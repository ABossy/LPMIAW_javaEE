<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- IMPORT --%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="projet.data.*"%>

<%-- USEBEAN --%>
<jsp:useBean id="listeAbsencesEtudiants" type="java.util.Map<projet.data.Etudiant,java.lang.Integer>" scope="request"/>

<!--% ou en JAVA
Map<Etudiant,Integer> listeAbsencesEtudiants = (Map<Etudiant,Integer>)request.getAttribute("listeAbsencesEtudiants");
%-->


<div class="container">
<h3>Consultation des absences</h3>
<!-- tableau des absences  -->
<% if (listeAbsencesEtudiants.size() != 0) {%>
<table class="table table-striped">
	<tr>
		<th>Etudiant</th>
		<th>Groupe</th>
		<th>Absence</th>
	</tr>
<%
int totalAbsences = 0;
for (Map.Entry<Etudiant, Integer> entry : listeAbsencesEtudiants.entrySet()) {
	Etudiant etudiant = entry.getKey();
	Integer absences = entry.getValue();
%>
	<tr>
		<td><a href="<%= application.getContextPath()%>/do/etudiant?id=<%=etudiant.getId()%>"><%=etudiant.getPrenom()%> <%=etudiant.getNom()%></a></td>
		<td><%=etudiant.getGroupe().getNom()%></td>
		<td><%=absences%></td>
	</tr>
<%
totalAbsences = totalAbsences + absences;
}
%>
</table>

<p>Nombre total d'absences : <%= totalAbsences%></p>

<% } else {%>

	<p>Aucun étudiant</p>
<%}%>



</div>
