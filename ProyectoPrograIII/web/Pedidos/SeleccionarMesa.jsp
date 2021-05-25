<%@page import="modelos.Area"%>
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
    <%
        List<Area> lstArea = (List) (request.getAttribute("lstArea"));
        List<Area> lstMesa = (List) (request.getAttribute("lstMesa"));
    %>
    
    <body>
        <div class="container">
            <div class="tab">
                <button class="tablinks" onclick="openArea(event, 'Area1')">Area1</button>
                <button class="tablinks" onclick="openArea(event, 'Area2')">Area2</button>
                <button class="tablinks" onclick="openArea(event, 'Balcon')">Balcon</button>
            </div>

            <div id="Area1" class="tabcontent">
                <ul>
                    <form style="display: none" action="controllerPedido?accion=nuevoPedido" method="post"><button type="submit" id="Mesa1"> </button></form>
                    <li id="Li2" class="dropdown" ><a id="A2"> <label for="Mesa1">Mesa1</label></a></li>
                </ul>
            </div>
            
            <div id="Area2" class="tabcontent">
                <ul>
                    <li>Mesa56</li>
                    <li>Mesa5</li>
                    <li>Mesa12</li>
                </ul>
            </div>

            <div id="Balcon" class="tabcontent">
                <ul>
                    <li>Mesa3</li>
                    <li>Mesa56</li>
                    <li>Mesa132</li>
                </ul>
            </div>
            <script>
                function openArea(evt, Area) {
                    var i, tabcontent, tablinks;
                    tabcontent = document.getElementsByClassName("tabcontent");
                    for (i = 0; i < tabcontent.length; i++) {
                        tabcontent[i].style.display = "none";
                    }
                    tablinks = document.getElementsByClassName("tablinks");
                    for (i = 0; i < tablinks.length; i++) {
                        tablinks[i].className = tablinks[i].className.replace(" active", "");
                    }
                    document.getElementById(Area).style.display = "block";
                    evt.currentTarget.className += " active";
                }
            </script>
        </div>
    </body>
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
</html>
