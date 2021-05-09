<%@page import="modelos.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
            <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
            <title>Bienvenido</title>
        
    </head>
    <body>
        <% 
            Usuario usuario = new Usuario();
            String nombre= usuario.getNombre();
            String rol = usuario.getRol();
        %>
        <div class="container">  
            <h1>Bienvenido, <%=nombre+" "+rol%></h1>
            <a href="Autenticacion/consultaAutenticacion.jsp">Autenticacion</a>
        </div>
    </body>
</html>
