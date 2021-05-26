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
        <title>Inventario Parcial</title>
        
    </head>
    <body style="padding-bottom: 50px">
        <div class="container"> 
            <h1>Inventario Parcial (Solo vista)</h1>
            <h3>Cambios se realizan en Inventario General</h3>
            <table border="1" width="1" cellspacing="1" class="table table-hover" id="myTable">
                <thead>
                    <tr>
                        <th class="text-center">Codigo Producto</th>
                        <th class="text-center">Producto</th>
                        <th class="text-center">Proveedor</th>
                        <th class="text-center">Unidad</th>
                        <th class="text-center">Costo_Unidad (Q)</th>
                        <th class="text-center">Cantidad</th>
                    </tr>
                </thead>
                <%
                    DaoInventario daoInv = new DaoInventario();
                    List<Inventario> listInv = daoInv.listar_inv_detalle();
                    Iterator<Inventario> iteraInv = listInv.iterator();
                    Inventario inv = null;
                    
                    while(iteraInv.hasNext()){
                        inv = iteraInv.next();
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= inv.getCodigo_pro() %></td>
                        <td class="text-center"><%= inv.getDescripcion() %></td>
                        <td class="text-center"><%= inv.getProveedor() %></td>
                        <td class="text-center"><%= inv.getUnidad() %></td>
                        <td class="text-center"><%= inv.getCosto_uni() %></td>
                        <td class="text-center"><%= inv.getCantidad() %></td>
                    </tr>
                    <%}%>
                </tbody>
        </div>
    </body>
</html>
