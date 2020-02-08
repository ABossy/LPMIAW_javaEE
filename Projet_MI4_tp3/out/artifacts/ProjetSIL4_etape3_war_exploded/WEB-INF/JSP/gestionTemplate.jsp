<%@ page contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="content" class="java.lang.String" scope="request"/>

<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title><%= application.getInitParameter("title")%></title>
</head>
<body>
<!--navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Projet MI4</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item active nav-link">
                    <a href="<%= application.getContextPath()%>/do/accueil">Accueil</a></li>
                <li class="nav-item nav-link">
                    <a href="<%= application.getContextPath()%>/do/listeEtudiants">les étudiants</a>
                </li>
                <li class="nav-item nav-link">
                    <a href="<%= application.getContextPath()%>/do/consultationNotes">Consulter les notes</a>
                </li>
                <li class="nav-item nav-link">
                    <a href="<%= application.getContextPath()%>/do/consultationAbsences">Consulter les absences</a>
                </li>
            </ul>
        </div>
    </nav>

<jsp:include page="<%=content%>" />

<%--<div style="background-color:#A9F5F2">--%>
<%--    <h1><%= application.getInitParameter("title")%></h1>--%>
<%--    <blockquote>je suis le context-param 'title'</blockquote>--%>
<%--</div>--%>
<%--<jsp:include page="<%= application.getInitParameter(\"pieddepage\")%>"/>--%>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>
