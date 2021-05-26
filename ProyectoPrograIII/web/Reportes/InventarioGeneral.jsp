<%@page import="modelos.Inventario"%>
<%@page import="dao.DaoInventario"%>
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
        <title>Inventario General</title>
        
    </head>
    <body style="padding-bottom: 50px">
        <div class="container"> 
            <h1>Inventario General</h1>        
            <table border="1" width="1" cellspacing="1" class="table table-hover" id="myTable">
                <thead>
                    <tr>
                        <th class="text-center">Codigo Producto</th>
                        <th class="text-center">Producto</th>
                        <th class="text-center">Categoria</th>
                        <th class="text-center">Stock</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <%
                    DaoInventario daoInv = new DaoInventario();
                    List<Inventario> listInv = daoInv.listar_inv_general();
                    Iterator<Inventario> iteraInv = listInv.iterator();
                    Inventario inv = null;
                    
                    while(iteraInv.hasNext()){
                        inv = iteraInv.next();
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= inv.getCodigo_pro() %></td>
                        <td class="text-center"><%= inv.getDescripcion() %></td>
                        <td class="text-center"><%= inv.getDesc_categoria() %></td>
                        <td class="text-center"><%= inv.getStock() %></td>
                        <td class="text-center">
                                 <form action="controllerProceso?accion=seleccionarMon&codigo=<%= inv.getCodigo_pro() %>" method="post"><button class="btn btn-warning" type="submit">Modificar</button></form>
                                 <form action="controllerProceso?accion=seleccionarMon&codigo=<%= inv.getCodigo_pro() %>" method="post"><button class="btn btn-danger" type="submit">Eliminar</button></form>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
        </div>
    </body>
</html>
