<%@ page import="projet.data.Groupe" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="groupes" type="java.util.List<projet.data.Groupe>" scope="request" />
<jsp:useBean id="etudiant" class="projet.data.Etudiant" scope="request"/>
<jsp:useBean id="nbAbsences" type="java.lang.Integer" scope="request"/>
<jsp:useBean id="note" type="java.lang.Float" scope="request"/>



<h3>Fiche de <%=etudiant.getPrenom()%> <%=etudiant.getNom()%></h3>
<div class="container">
<table class="table table-striped">
	<tr>
		<td>Groupe</td>
<%--		<td><%=etudiant.getGroupe().getNom()%></td>--%>
        <td><% if (etudiant.getGroupe() != null) {%>
            <%=etudiant.getGroupe().getNom()%>
            <% } else {%>
            Aucun groupe
            <%}%></td>
        <td>Modifier Groupe</td>
        <td><form action="<%=application.getContextPath()%>/do/modifierGroupe?id=<%=etudiant.getId()%>" method="post">
            <div class="form-group">
                <select class="form-control" name="groupe" id="groupe">
                    <%
                        for (Groupe groupe : groupes) {
                    %>
                        <% if (etudiant.getGroupe() != null) {
                            if ( groupe.getId() == etudiant.getGroupe().getId() ) {
                                %>selected<%
                            }%>
                        <%}%>
                        <option value="<%=groupe.getId()%>">
                            <%=groupe.getNom()%></option>
                        <%}%>
                </select>
                <button type="submit" class="btn btn-info">Modifier</button>
            </div>
        </form> </td>
	</tr>
	<tr>
		<td>Moyenne Generale</td>
        <td><%=etudiant.getMoyenneGenerale()%></td>
        <td>Modifier Moyenne</td>
                    <td><form action="<%= application.getContextPath()%>/do/modifierMoyenne?id=<%=etudiant.getId()%>" method="post">
                        <div class="form-group">
                            <input type="number" class="form-control" id="moyenne" name="moyenne" step="any" value="<%=note%>" max="20" min="0">
                            <button type="submit" class="btn btn-info">Modifier</button>
                        </div>
          </form></td>

	</tr>
	<tr>
        <td>Absences</td>
        <td><%=etudiant.getNbAbsences()%></td>
		<td>Absences</td>
		<td><a href="<%= application.getContextPath()%>/do/enlever-absence?id=<%=etudiant.getId()%>"><button>-</button></a> <%=nbAbsences%>
			<a href="<%= application.getContextPath()%>/do/ajouter-absence?id=<%=etudiant.getId()%>"><button>+</button></a></td>
	</tr>
</table><hr>
</div>
<div style="background-color:#D8F6CE">
	<h3>Modification Fiche de <%=etudiant.getPrenom()%> <%=etudiant.getNom()%></h3>
	<form method="post" action="<%= application.getContextPath()%>/do/modifEtudiant?id=<%=etudiant.getId()%>">
		<div class="container">
            <div class="form-group">
                <label for="inputNom">Nom</label>
                <input type="text" class="form-control" id="inputNom" aria-describedby="emailHelp" placeholder="nom" name="nom" value="<%=etudiant.getNom()%>">
            </div>
		<div class="form-group">
			<label for="inputPrenom">Prenom</label>
			<input type="text" class="form-control" id="inputPrenom" placeholder="Prenom" name="prenom" value="<%=etudiant.getPrenom()%>">
		</div>
			<button type="submit" class="btn btn-primary">Modifier</button>
		</div>
	</form>

</div>
