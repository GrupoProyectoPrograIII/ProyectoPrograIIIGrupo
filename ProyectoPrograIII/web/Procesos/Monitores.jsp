<%-- 
    Document   : Monitores
    Created on : 24/05/2021, 11:50:35 PM
    Author     : JAVIER OSORIO
--%>

<%@page import="dao.DaoMonitor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla.jsp"/>
<!DOCTYPE html>
<%
    DaoMonitor daoM = new DaoMonitor();
    String cod = (String) request.getAttribute("sele");
    int ver_cod = Integer.parseInt(cod);
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Monitores</title>
    </head>
    <style>
        body {font-family: Arial;}

        /* Style the tab */
        .tab {
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
        }

        /* Style the buttons inside the tab */
        .tab button {
            background-color: inherit;
            float: left;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            transition: 0.3s;
            font-size: 17px;
        }

        /* Change background color of buttons on hover */
        .tab button:hover {
            background-color: #ddd;
        }

        /* Create an active/current tablink class */
        .tab button.active {
            background-color: #ccc;
        }

        /* Style the tab content */
        .tabcontent {
            display: none;
            padding: 6px 12px;
            border: 1px solid #ccc;
            border-top: none;
        }
    </style>
    <body style="padding-bottom: 50px">
        <div class="container"> 
            <h1>Monitor</h1>
        </div>
    </body>
</html>
