<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
    String nom = (String) session.getAttribute("nombre");
    String ape = (String) session.getAttribute("apellido");
    String usuarios = (String) session.getAttribute("usuario");
    String roles = (String) session.getAttribute("roles");

    if (usuarios == null) {
        //response.setHeader("Cache-Control", "no-cache");
        //response.setHeader("Cache-Control", "no-store");
        //response.setHeader("Pragma", "no-cache");
        //response.setDateHeader("Expires", 0);
        response.sendRedirect("index.jsp");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/Site.css" rel="stylesheet" type="text/css"/>
        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
        <script src="Scripts/Retroceso.js" type="text/javascript"></script>
        <title>probando</title>
    </head>
    <body>
        <nav class="navbar navbar-default" role="navigation" >
            <div class="navbar-header">
                <a class="navbar-brand" href="plantilla.jsp">Inicio</a>
            </div>
        </nav>
    </body>
</html>
