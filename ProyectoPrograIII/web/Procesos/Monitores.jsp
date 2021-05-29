<%-- 
    Document   : Monitores
    Created on : 24/05/2021, 11:50:35 PM
    Author     : JAVIER OSORIO
--%>

<%@page import="modelos.Despacho"%>
<%@page import="dao.DaoDespacho"%>
<%@page import="modelos.ProductoCombo"%>
<%@page import="dao.DaoProductoCombo"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelos.Monitor"%>
<%@page import="java.util.List"%>
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
                DaoMonitor daoMon = new DaoMonitor();
                List<Monitor> lstMon = daoMon.listar();
                Iterator<Monitor> iteMon = lstMon.iterator();
                Monitor mon = null;

                String cod = (String) request.getAttribute("sele");
                int ver_cod = Integer.parseInt(cod);
            %>
            <div class="container" id="disponible">

                <div>
                    <%
                        while (iteMon.hasNext()) {
                            mon = iteMon.next();
                            if (ver_cod == mon.getIdMonitor()) {
                    %>
                    <button class="tablinks btn btn-primary" onclick="openArea(event, '<%=mon.getIdMonitor()%>')"><%=mon.getNombre()%></button>
                    <br><br>
                    <table border="1" width="1" cellspacing="1" class="table table-hover">
                        <thead>
                            <tr>
                                <th class="text-center">No Pedido</th>
                                <th class="text-center">Descripcion</th>
                                <th class="text-center">Area</th>
                                <th class="text-center">Mesa</th>
                                <th class="text-center">Accion</th>
                            </tr>
                        </thead>
                        <%
                            DaoDespacho daoDes = new DaoDespacho();
                            List<Despacho> lstdes = daoDes.listar();
                            Iterator<Despacho> iteD = lstdes.iterator();
                            Despacho des = null;

                            while (iteD.hasNext()) {
                                des = iteD.next();
                        %>
                        <tbody>
                            <tr>
                                <th class="text-center"><%= des.getPedido()%></th>
                                <th class="text-center"><%= des.getDescripcion()%></th>
                                <th class="text-center"><%= des.getArea()%></th>
                                <th class="text-center"><%= des.getMesa()%></th>
                                <td class="text-center">
                                    <form action="controllerProceso?accion=eliminarDes&id=<%= des.getId_despacho() %>&codigo=<%=mon.getIdMonitor()%>" method="post"><button class="btn btn-info" type="submit">Despachar</button></form>                           
                                </td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                    <% }
                        }
                    %>


                </div>           
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
