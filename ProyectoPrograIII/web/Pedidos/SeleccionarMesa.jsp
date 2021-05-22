<%@page import="java.util.Random"%>
<%@page import="java.awt.Polygon"%>
<%@page import="java.awt.Color"%>
<%@page import="java.awt.Graphics"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="modelos.Rol"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelos.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Seleccionar una Mesa</title>


    </head>
    <body style="padding-bottom: 50px">
        <div class="container"> 
            <h1>Seleccionar una Mesa</h1>
            <table class="container">
                <%for(int i=0; i<=5;i++){%>
                <tr>
                    <td>Mesa 1</td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
