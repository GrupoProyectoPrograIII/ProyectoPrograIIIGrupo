<%@page import="modelos.Monitor"%>
<%@page import="dao.DaoMonitor"%>
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
        <title>Elegir Monitor</title>

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
            <h1>Elegir Monitor</h1> 
            <table border="1" width="1" cellspacing="1" class="table table-hover" id="myTable">
                <thead>
                    <tr>
                        <th class="text-center">Codigo Monitor</th>
                        <th class="text-center">Monitor</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <%
                    DaoMonitor daoM = new DaoMonitor();
                    List<Monitor> listMon = daoM.listar();
                    Iterator<Monitor> iteraM = listMon.iterator();
                    Monitor mon = null;

                    while (iteraM.hasNext()) {
                        mon = iteraM.next();
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= mon.getCod_monitor()%></td>
                        <td class="text-center"><%= mon.getDescripcion_monitor()%></td>
                        <td class="text-center">
                            <form action="controllerProceso?accion=seleccionarMon&codigo=<%= mon.getCod_monitor()%>" method="post"><button class="btn btn-info" type="submit">Seleccionar</button></form>                           
                        </td>
                    </tr>
                    <%}%>
                </tbody>
        </div>
    </body>
</html>
