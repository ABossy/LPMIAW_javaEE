/**
 * 
 */
package projet.controleur;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projet.data.*;
import projet.data.Module;

@SuppressWarnings("serial")
public class Controleur extends HttpServlet {

	// private String urlTest;
	private String urlGestionTemplate;
	private String urlAccueil;
	private String urlListeEtudiants;
	private String urlEtudiant;
	private String urlConsultationAbsences;
	private String urlConsultationNotes;
	private String urlCreationEtudiant;



    // INIT
	public void init() throws ServletException {
		GestionFactory.open();
		// Récupération des URLs en paramètre du web.xml
		urlGestionTemplate = getServletConfig().getInitParameter("urlGestionTemplate");
		urlAccueil = getServletConfig().getInitParameter("urlAccueil");
		urlListeEtudiants = getServletConfig().getInitParameter("urlListeEtudiants");
		urlEtudiant = getServletConfig().getInitParameter("urlEtudiant");
		urlConsultationAbsences = getServletConfig().getInitParameter("urlConsultationAbsences");
		urlConsultationNotes = getServletConfig().getInitParameter("urlConsultationNotes");
		urlCreationEtudiant = getServletConfig().getInitParameter("urlCreationEtudiant");

		if ((GroupeDAO.getAll().size() == 0) && (EtudiantDAO.getAll().size() == 0)) {

			// Creation des groupes
			Groupe MIAM = GroupeDAO.create("miam");
			Groupe SIMO = GroupeDAO.create("SIMO");
			Groupe MESSI = GroupeDAO.create("MESSI");

			// Creation des étudiants
			EtudiantDAO.create("Francis", "Brunet-Manquat", MIAM);
			EtudiantDAO.create("Philippe", "Martin", MIAM);
			EtudiantDAO.create("Pierrick", "Loiacono", MIAM);
			EtudiantDAO.create("Paulien", "Marange", SIMO);
			EtudiantDAO.create("Marie", "Kersale", MESSI);
			EtudiantDAO.create("Astrid", "Bossy", MESSI);

			// Creation des groupes
			projet.data.Module MI1 = ModuleDAO.create("MI1");
			Module MI4 = ModuleDAO.create("MI4");

			// Liés groupe et module
			MIAM.addModule(MI1);
			MIAM.addModule(MI4);
			SIMO.addModule(MI1);

			MI1.addGroupe(MIAM);
			MI4.addGroupe(MIAM);
			MI1.addGroupe(SIMO);

			GroupeDAO.update(MIAM);
			GroupeDAO.update(SIMO);

			ModuleDAO.update(MI1);
			ModuleDAO.update(MI4);

		}
	}

	@Override
	public void destroy() {
		super.destroy();
		GestionFactory.close();
	}

	// POST
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

			// on passe la main au GET
			doGet(request, response);

	}

	// GET
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ServletException {

		// On récupère le path
		String action = request.getPathInfo();
		if (action == null) {
			action = "/accueil";
		}

		// Exécution action
		if (action.equals("/accueil")) {
			doAcceuil(request, response);
		} else if (action.equals("/listeEtudiants")) {
			doListeEtudiants(request, response);

		} else if (action.equals("/etudiant")) {
			doEtudiant(request, response);

        } else if (action.equals("/creationEtudiant")) {
            doCreationEtudiant(request, response);

        } else if (action.equals("/modifEtudiant")) {
            doEditionEtudiant(request, response);

		} else if (action.equals("/supprimerEtudiant")) {
			doSupprimerEtudiant(request, response);

		} else if (action.equals("/consultationAbsences")) {
			doConsultationAbsences(request, response);

		} else if (action.equals("/consultationNotes")) {
			doConsultationNotes(request, response);

		} else if (action.equals("/modifierMoyenne")) {
			doUpdateMoyenne(request, response);

		} else if (action.equals("/modifierGroupe")) {
			doUpdateGroupe(request, response);

        } else if (action.equals("/ajouter-absence")) {

            doAjouterAbsence(request, response);
        } else if (action.equals("/enlever-absence")) {

            doEnleverAbsence(request, response);
        } else {
            // Autres cas
            doAcceuil(request, response);
        }
	}


    // /////////////////////// ACCUEIL
	//
	private void doAcceuil(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// Inclusion du content dans le template
		request.setAttribute("content", urlAccueil);
		loadJSP(urlGestionTemplate, request, response);
	}

	// /////////////////////// Liste des étudiants
	//
	private void doListeEtudiants(HttpServletRequest request,
									 HttpServletResponse response) throws ServletException, IOException {

		// Récupérer les étudiants
		Collection<Etudiant> listeEtudiants = EtudiantDAO.getAll();
        String idGroupe = request.getParameter("idGroupe");
        if (idGroupe != null) {
            Groupe groupe = GroupeDAO.retrieveById(Integer.parseInt(idGroupe));
            listeEtudiants = EtudiantDAO.getAllByGroupe(groupe);
        } else {
            listeEtudiants = EtudiantDAO.getAll();
        }

		// Mettre les étudians en attibuts de request
		request.setAttribute("listeEtudiants", listeEtudiants);

		//
		request.setAttribute("content", urlListeEtudiants);
		loadJSP(urlGestionTemplate, request, response);
	}

	///////////////////////// Détails étudiant
	//
	private void doEtudiant(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// Récupérer le parametre id, l'objet Etudiant associé, le nombre d'absences et la moyenne

		int idEtudiant = Integer.parseInt(request.getParameter("id"));
		Etudiant etudiant = EtudiantDAO.retrieveById(idEtudiant);
		int nbAbsences = etudiant.getNbAbsences();
		float note = etudiant.getMoyenneGenerale();
		List<Groupe> groupes = GroupeDAO.getAll();


		// Mettre l'objet étudiant en attribut pour affichage par la vue
		// correspondant
		request.setAttribute("etudiant", etudiant);
		request.setAttribute("nbAbsences", nbAbsences);
		request.setAttribute("note", note);
		request.setAttribute("groupes", groupes);



		//
		request.setAttribute("content", urlEtudiant);
		loadJSP(urlGestionTemplate, request, response);
	}

    private void doCreationEtudiant(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nom = request.getParameter("nom");
        String prenom = request.getParameter("prenom");
        String groupeId = request.getParameter("groupe");

        if (nom != null && prenom != null && groupeId != null) {
            Groupe groupe = GroupeDAO.retrieveById(Integer.parseInt(groupeId));
            EtudiantDAO.create(nom, prenom, groupe);
//
            doListeEtudiants(request,response);
        }

        List<Groupe> groupes = GroupeDAO.getAll();

        request.setAttribute("groupes", groupes);

        request.setAttribute("content", urlCreationEtudiant);
        loadJSP(urlGestionTemplate, request, response);
    }

    private void doEditionEtudiant(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int idEtudiant = Integer.parseInt(request.getParameter("id"));
        Etudiant etudiant = EtudiantDAO.retrieveById(idEtudiant);

        etudiant.setNom(request.getParameter("nom"));
        etudiant.setPrenom(request.getParameter("prenom"));

		EtudiantDAO.update(etudiant);

		doListeEtudiants(request, response);
    }

    private void doSupprimerEtudiant(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Etudiant etudiant = EtudiantDAO.retrieveById(Integer.parseInt(request.getParameter("id")));
		EtudiantDAO.remove(etudiant);

		response.sendRedirect(request.getContextPath() + "/do/listeEtudiants");

	}

	// /////////////////////// CONSULTATION NOTES
	//
	private void doConsultationNotes(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// Récupérer les étudiants en fonction du filtre groupe
		Collection<Etudiant> listeEtudiants = EtudiantDAO.getAll();

		// Récupérer l'association Etudiant/Note pour affichage
		Map<Etudiant, Float> listeNotesEtudiants = new HashMap<>();

		// pour chaque etudiant on lui passe l'etudiant plus une note
		for (Etudiant etudiant:listeEtudiants){
			listeNotesEtudiants.put(etudiant, (float) etudiant.getMoyenneGenerale());
		}
		request.setAttribute("listeNotesEtudiants", listeNotesEtudiants);

		//
		request.setAttribute("content", urlConsultationNotes);
		loadJSP(urlGestionTemplate, request, response);
	}

	 private void doUpdateMoyenne(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{

		 int idEtudiant = Integer.parseInt(request.getParameter("id"));
		 Etudiant etudiant = EtudiantDAO.retrieveById(idEtudiant);

		 float moyenne = Float.parseFloat(request.getParameter("moyenne"));

		 etudiant.setMoyenneGenerale(moyenne);

		 EtudiantDAO.update(etudiant);

		 doEtudiant(request,response);
	 }

	 private void doUpdateGroupe(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		 int idEtudiant = Integer.parseInt(request.getParameter("id"));
		 Etudiant etudiant = EtudiantDAO.retrieveById(idEtudiant);

		 String groupeId = request.getParameter("groupe");
		 Groupe groupe = GroupeDAO.retrieveById(Integer.parseInt(groupeId));
		 List<Groupe> groupes = GroupeDAO.getAll();

		 request.setAttribute("groupes", groupes);

		 etudiant.setGroupe(groupe);

		 EtudiantDAO.update(etudiant);

		 doEtudiant(request,response);
	 }

	// /////////////////////// CONSULTATION ABSENCES
	//
	private void doConsultationAbsences(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// Récupérer les étudiants
		Collection<Etudiant> listeEtudiants = EtudiantDAO.getAll();

		// Récupérer l'association Etudiant/Note pour affichage
		Map<Etudiant, Integer> listeAbsencesEtudiants = new HashMap<>();

		for (Etudiant etudiant:listeEtudiants){
			listeAbsencesEtudiants.put(etudiant, etudiant.getNbAbsences());
		}

		//
		request.setAttribute("listeAbsencesEtudiants", listeAbsencesEtudiants);

		//
		request.setAttribute("content", urlConsultationAbsences);
		loadJSP(urlGestionTemplate, request, response);
	}

    private void doAjouterAbsence(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //On récupère l'étudiant
        int idEtudiant = Integer.parseInt(request.getParameter("id"));
        Etudiant etudiant = EtudiantDAO.retrieveById(idEtudiant);

        etudiant.ajouterAbsence();

        EtudiantDAO.update(etudiant);

        doEtudiant(request, response);
    }

    private void doEnleverAbsence(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //On récupère l'étudiant
        int idEtudiant = Integer.parseInt(request.getParameter("id"));
        Etudiant etudiant = EtudiantDAO.retrieveById(idEtudiant);

        etudiant.enleverAbsence();

        EtudiantDAO.update(etudiant);

        doEtudiant(request, response);
    }


	/**
	 * Charge la JSP indiquée en paramètre
	 * 
	 * @param url
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void loadJSP(String url, HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		// L'interface RequestDispatcher permet de transférer le contrôle à une
		// autre servlet
		// Deux méthodes possibles :
		// - forward() : donne le contrôle à une autre servlet. Annule le flux
		// de sortie de la servlet courante
		// - include() : inclus dynamiquement une autre servlet
		// + le contrôle est donné à une autre servlet puis revient à la servlet
		// courante (sorte d'appel de fonction).
		// + Le flux de sortie n'est pas supprimé et les deux se cumulent

		ServletContext sc = getServletContext();
		System.out.println(sc.getContextPath());
		RequestDispatcher rd = sc.getRequestDispatcher(url);
		rd.forward(request, response);
	}

}
