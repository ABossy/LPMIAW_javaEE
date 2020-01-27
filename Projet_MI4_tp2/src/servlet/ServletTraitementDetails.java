package servlet;
import projet.data.Etudiant;
import projet.data.GestionFactory;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/servlettraitementdetails")

public class ServletTraitementDetails extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException, IOException {

        Etudiant etudiant = GestionFactory.getEtudiantById(Integer.parseInt(request.getParameter("etudiantId")));
        int missingNumber = GestionFactory.getAbsencesByEtudiantId(Integer.parseInt(request.getParameter("etudiantId")));
        etudiant.setNbAbscence(missingNumber);

        request.setAttribute("etudiant", etudiant);

        getServletContext().getRequestDispatcher("/details.jsp").forward(request, response);
    }
}
