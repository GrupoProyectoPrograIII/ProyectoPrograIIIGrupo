<%@page import="modelos.DetallePedido"%>
<%@page import="modelos.Pedido"%>
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

        <div style="padding-left:5%; padding-right: 5%;" id="disponible">
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
                            if (mesa.getIdArea() == area.getIdArea()) {
                                if (mesa.getIdEstado() == 0) {
                    %>
                    <table border="1" width="1" cellspacing="1" class="table table-hover">
                        <thead>
                        <h4 style="color:red;"><%=mesa.getMesa()%></h4>
                        <th class="text-center">No Pedido</th>
                        <th class="text-center">Descripcion</th>
                        <th class="text-center">Mesero Encargado</th>
                        <th class="text-center">Area</th>
                        <th class="text-center">Mesa</th>
                        <th class="text-center">Accion</th>
                        </thead>
                        <tbody>
                            <%
                                List<Pedido> lstPedido = (List) request.getAttribute("lstPedido");
                                List<DetallePedido> lstDp = (List) request.getAttribute("lstDetallePedido");
                                for (Pedido p : lstPedido) { %>
                        <td><%=p.getIdPedido()%></td>
                            <%        if (p.getIdMesa() == mesa.getIdMesa()) {
                                    for (DetallePedido dp : lstDp) {

                            %>
                        <td>
                            <ul>
                                <li><%=dp.getCombo()%> <button class="btn btn-info" type="submit">Despachar</button></li>

                            </ul>
                        </td>
                        <%}%>
                        <td class="text-center"><%=p.getIdMesa()%></td>

                        <td><button class="btn btn-info" type="submit">Despachar</button></td>
                        <%
                            }
                        %>
                        <td><%=p.getIdUsuario()%></td>
                        </tbody>
                    </table>
                    <%
                                    }
                                }
                            }
                        }
                    %>

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
