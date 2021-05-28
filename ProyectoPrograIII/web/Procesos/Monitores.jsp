<%-- 
    Document   : Monitores
    Created on : 24/05/2021, 11:50:35 PM
    Author     : JAVIER OSORIO
--%>

<%@page import="dao.DaoMonitor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Monitores</title>
    </head>
    <body style="padding-bottom: 50px">
        <div class="container"> 
            <h1>Monitor</h1>
            <%
                DaoMonitor daoM = new DaoMonitor();
                String cod = (String) request.getAttribute("sele");
                int ver_cod = Integer.parseInt(cod);

                int todos = 1, cocina = 2, bar = 3, recepcion = 4;
                if (todos == ver_cod) {
            %>
            <div class="nav-header">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Cocina</a>
                    <a class="navbar-brand" href="#">Bar</a>
                    <a class="navbar-brand" href="#">Recepcion</a>
                </div>
            </div>
            <%} else if(cocina == ver_cod){
            %>
            <div class="nav-header">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Cocina</a>
                </div>
            </div>
            <%} else if(bar == ver_cod){
            %>
            <div class="nav-header">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Bar</a>
                </div>
            </div>
            <%} else if(recepcion == ver_cod){
            %>
            <div class="nav-header">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Recepcion</a>
                </div>
            </div>
            <%}%>
        </div>
    </body>
</html>
