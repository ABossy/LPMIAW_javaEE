<%@ page contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%-- IMPORT --%>
<%@ page import="projet.data.Groupe" %>

<%-- USEBEAN --%>
<jsp:useBean id="groupes" type="java.util.Collection<projet.data.Groupe>" scope="request"/>

<div class="container">
        <div class="row">
        <!-- AFFICHAGE d'un titre  -->
        <h3>Liste des goupes</h3>
        <a href="<%=application.getContextPath()%>/do/creationGroupe" class="btn btn-info ml-4">Créer un groupe</a></div>
        <table class="table table-striped">
                <tr>
                <th>Groupes</th>
                <th>Edition</th>
                </tr>

                <%for (Groupe groupe : groupes) {%>
                <tr>
                <td><a href="<%=application.getContextPath()%>/do/detailsGroupe?id=<%=groupe.getId()%>"><%=groupe.getNom()%></a></td>
                <td><a href="<%=application.getContextPath()%>/do/supprimerGroupe?id=<%=groupe.getId()%>" class="btn btn-danger ml-4">Delete</a></td>
                </tr>
               <%}%>

        </table>
        </div>
</div>
