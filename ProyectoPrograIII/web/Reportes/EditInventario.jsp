<%-- 
    Document   : EditInventario
    Created on : 27/05/2021, 01:43:01 PM
    Author     : JAVIER OSORIO
--%>

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
        <form id="form-work" class="" name="form-work" action="controllerReporte" method="POST">
                <%
                    DaoInventario daoInv = new DaoInventario();
                    int cod = Integer.parseInt((String) request.getParameter("codigo_pro"));
                    Inventario inv = new Inventario();  
                %>
                <div class="form-group">
                    <br><br><br>
                    <div class="col-md-4">
                        <label class="control-label" for ="nombre">Nombre:</label>
                        <input name="txtnombre" class="form-control" placeholder="nombre del cliente" type="text">
                    </div>    
                    <br><br><br>
                    <div class="col-md-4">
                        <label class="control-label" for ="apellido">Apellido:</label>
                        <input name="txtapellido" class="form-control" placeholder="apellido del cliente" type="text">
                    </div>    
                    <br><br><br>
                    <div class="col-md-4">
                        <label class="control-label" for ="saldo">Saldo:</label>
                        <input name="txtsaldo" class="form-control" placeholder="saldo en Q." type="number" step="0.01">
                    </div>    
                    <br><br><br>
                    <div class="col-md-4">
                    <label for ="tipocliente" class="control-label" >Tipo Cliente:</label>
                    <select name="txttipocliente" id="tipo" class="form-control" >
                        
                    </select>
                    </div>
                    <br><br><br>
                    <div class="col-md-4">
                        <label class="control-label" for ="estado">Estado:</label>
                        <input name="txtestado" class="form-control" placeholder="Poner estado 0 o 1" min="0" max="1" type="number" step="1">
                    </div>    
                    <br><br><br>
                    <div class="col-md-4">
                        <label for ="fechaincio" class="control-label">Fecha de Ingreso:</label>
                        <input name="txtfechainicio" class="form-control" type="date">
                    </div>  
                    <br><br><br>
                    <br><br><br>
                    <div class="col-md-3">
                        <button id="accion" name="accion" value="create" class="btn btn-success btn-lg btn-block info" type="submit">Aceptar</button>                    
                    </div>
                    <br><br>
                </div>
            </form>
        </div>
    </body>
</html>
