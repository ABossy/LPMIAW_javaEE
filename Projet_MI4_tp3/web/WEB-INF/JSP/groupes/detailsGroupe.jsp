<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%-- IMPORT --%>
<%@ page import="projet.data.Groupe" %>
<%@ page import="java.util.*" %>
<%@ page import="projet.data.Etudiant" %>


<%-- USEBEAN --%>
<jsp:useBean id="groupes" class="projet.data.Groupe" scope="request"/>

<div class="container">
    <div class="row">
        <!-- AFFICHAGE d'un titre  -->
        <h3>Details des Groupes</h3>
        <table class="table table-striped">
            <tr>
                <th>Etudiant</th>
                <th>Groupe</th>
            </tr>

        <%for (Etudiant etudiant : groupes.getEtudiants()){%>
        <tr>
            <td><a href="<%= application.getContextPath()%>/do/etudiant?id=<%=etudiant.getId()%>"><%=etudiant.getPrenom()%> <%=etudiant.getNom()%></a></td>
            <td><%=etudiant.getGroupe().getNom()%></td>
        </tr>

        <%}%>
        </table>
    </div>
</div>
