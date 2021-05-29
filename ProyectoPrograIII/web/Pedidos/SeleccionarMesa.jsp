<%@page import="modelos.Mesa"%>
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
        List<Mesa> lstMesa = (List) (request.getAttribute("lstMesa"));
    %>

    <body>

        <div class="container" id="disponible">

            <div class="tab">
                <%
                    int iter = 0;
                    for (Area area : lstArea) {
                %>
                <button class="tablinks" onclick="openArea(event, '<%=area.getNombre()%>')"><%=area.getNombre()%></button>
                <%}%>
            </div>
            <%for (Area area : lstArea) {%>
            <div id="<%=area.getNombre()%>" class="tabcontent">

                <ul>
                    <%for (Mesa mesa : lstMesa) {
                        if(mesa.getIdArea()== area.getIdArea()){
                    %>

                    
                    <%
                        if (mesa.getIdEstado() == 1) {
                    %>
                    <form style="display: none" action="controllerPedido?accion=nuevoPedido&mesa=<%=mesa.getMesa()%>&area=<%=area.getNombre()%>" method="post"><button type="submit" id="<%=mesa.getMesa()%>"> </button></form>
                    <li id="Li2" class="dropdown" ><a id="A2"> <label for="<%=mesa.getMesa()%>"><%=mesa.getMesa()%></label></a></li>
                            <%
                                }
                                if (mesa.getIdEstado() == 0) {
                            %>
                    <li id="Li2" class="dropdown" ><a id="A2"> <label style="color:red;" onclick="ocupado()" ><%=mesa.getMesa()%></label></a></li>
                            <%
                                }
                                if (mesa.getIdEstado() == 2) {
                            %>

                    <li id="Li2" class="dropdown" ><a id="A2"> <label style="color:purple;" onclick="limpieza()" ><%=mesa.getMesa()%></label></a></li>
                            <%
                                }
                            %>
                            <%} }%>

                </ul>
            </div>
            <%}%>
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
        <script type="text/javascript">
            function ocupado() {
                swal.fire({
                    title: "¡Mesa Ocupado!",
                    text: "Escojan otra mesa,que la mesa seleccionada lo estan ocupando",
                    icon: 'error', //warning,info,question,error,success
                    confirmButtonText: "Aceptar",
                    footer: "¡Cualquier error hacerlo saber al gerente!"
                });
            }
            function limpieza() {
                swal.fire({
                    title: "¡Mesa seleccionada esta en Limpieza!",
                    text: "Escojan otra mesa, la mesa seleccionada esta en proceso de limpieza",
                    icon: 'info', //warning,info,question,error,success
                    confirmButtonText: "Aceptar",
                    footer: "¡Cualquier error hacerlo saber al gerente!"
                });
            }

        </script>
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
