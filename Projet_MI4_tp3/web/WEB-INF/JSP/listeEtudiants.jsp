<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- IMPORT --%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.Integer"%>
<%@ page import="projet.data.*"%>

<%-- USEBEAN --%>
<jsp:useBean id="listeEtudiants" type="java.util.Collection<projet.data.Etudiant>" scope="request"/>

<div style="background-color:#D8F6CE">

<!-- AFFICHAGE d'un titre  -->
<h3>Moyennes générales</h3>

<!-- AFFICHAGE des notes des étudiants  -->
<% if (listeEtudiants.size() != 0) {%>

<!-- tableau de notes  -->
<table border="1">

<%
int sommeMoyenneGenerale = 0;
for (Etudiant etudiant : listeEtudiants) {
%>
	<tr>
		<td><a href="<%= application.getContextPath()%>/do/etudiant?id=<%=etudiant.getId()%>"><%=etudiant.getPrenom()%> <%=etudiant.getNom()%></a></td>
		<td><%=etudiant.getGroupe().getNom()%></td>
	</tr>
<%
}
%>
</table>

<% } else {%>

	<p>Aucun étudiant</p>
<%}%>

<blockquote>je suis listeEtudiants.jsp</blockquote>

</div>
