<%@ page import="projet.data.Groupe" %>
<%--
  Created by IntelliJ IDEA.
  User: astrid
  Date: 30/01/2020
  Time: 18:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="groupes" type="java.util.List<projet.data.Groupe>" scope="request" />
<div>
    <h3>Fiche de creation d'un etudiant</h3>
        <div class="container">
            <form method="post">
                <div class="form-group">
                        <label for="inputNom">Nom</label>
                        <input type="text" class="form-control" id="inputNom" placeholder="nom" name="nom">
                    </div>
                    <div class="form-group">
                        <label for="inputPrenom">Prenom</label>
                        <input type="text" class="form-control" id="inputPrenom" placeholder="Prenom" name="prenom">
                    </div>
                    <div class="form-group">
                        <label for="groupe">Groupe</label>
                        <select class="form-control" name="groupe" id="groupe">
                            <%for (Groupe groupe : groupes) {%>
                            <option value="<%=groupe.getId()%>"><%=groupe.getNom()%></option>
                            <%}%>
                        </select>
                    </div>
                    <button type="submit" class="btn btn-primary">Creer</button>
             </form>
        </div>
</div>
