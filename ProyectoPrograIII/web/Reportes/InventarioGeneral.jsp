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
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center"></td>
                        <td class="text-center">
                                 
                        </td>
                    </tr>
                    <% %>
                </tbody>
        </div>
    </body>
</html>
