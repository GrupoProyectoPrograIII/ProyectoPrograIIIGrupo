<%-- 
    Document   : EditInventario
    Created on : 27/05/2021, 01:43:01 PM
    Author     : JAVIER OSORIO
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Inventario"%>
<%@page import="dao.DaoInventario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Inventario</title>
    </head>
    <body>
        <div class="container">
            <h1>Modificar Inventario</h1>
            <br>
            <form id="form-work" class="" name="form-work" action="controllerReporte" method="POST" autocomplete="off">
                <%
                    DaoInventario daoInv = new DaoInventario();
                    int cod = Integer.parseInt((String) request.getAttribute("cod"));
                    Inventario inv = daoInv.list(cod);

                    daoInv = new DaoInventario();
                    List<Inventario> listcat = daoInv.listar_categoria();
                    Iterator<Inventario> iteratorCat = listcat.iterator();
                    Inventario cat = null;
                %>
                <div class="form-group">   
                    <br>
                    <div class="col-md-4">
                        <label class="control-label" for ="producto">Producto:</label>
                        <input name="txtdescripcion" class="form-control" placeholder="Producto" type="text" value="<%= inv.getDescripcion()%>">
                    </div>    
                    <br><br><br>
                    <div class="col-md-4">
                        <label for ="categoria" class="control-label" >Categoria:</label>
                        <select name="txtidcat" id="categoria" class="form-control" >
                            <option value="<%= inv.getId_categoria()%>"><%= inv.getDesc_categoria()%></option>
                            <% while (iteratorCat.hasNext()) {
                                    cat = iteratorCat.next();%> 
                            <option value=<%= cat.getId_categoria()%>><%= cat.getDesc_categoria()%></option>
                            <%}%>
                        </select>
                    </div>
                    <br><br><br>
                    <div class="col-md-4">
                        <label class="control-label" for ="stock">Stock:</label>
                        <input name="txtstock" class="form-control" placeholder="" type="number" value="<%= inv.getStock()%>">
                    </div>    
                    <br><br><br>
                    <div class="col-md-4">
                        <label class="control-label" for ="proveedor">Proveedor:</label>
                        <input name="txtproveedor" class="form-control" placeholder="" type="text" value="<%= inv.getProveedor()%>">
                    </div>    
                    <br><br><br>
                    <div class="col-md-4">
                        <label class="control-label" for ="unidad">Unidad:</label>
                        <input name="txtunidad" class="form-control" placeholder="unidad de medidad del producto" type="text" value="<%= inv.getUnidad()%>">
                    </div> 
                    <br><br><br>
                    <div class="col-md-4">
                        <label class="control-label" for ="costo">Costo por unidad:</label>
                        <input name="txtcosto" class="form-control" placeholder="precio por unidad del producto" type="number" value="<%= inv.getCosto_uni()%>" step="0.01">
                    </div>    
                    <br><br><br>
                    <div class="col-md-4">
                        <label class="control-label" for ="cantidad">Cantidad:</label>
                        <input name="txtcantidad" class="form-control" placeholder="" type="number" value="<%= inv.getCantidad()%>" step="0.01">
                    </div>
                    <input type="hidden" name="txtcodigo" value="<%= inv.getCodigo_pro()%>">
                    <br><br><br>  
                    <div class="col-md-3">
                        <button id="accion" name="accion" value="modificarInventario" class="btn btn-success btn-lg btn-block info" type="submit">Aceptar</button>                    
                    </div>
                    <br><br>
                </div>
            </form>
        </div>
    </body>
</html>
