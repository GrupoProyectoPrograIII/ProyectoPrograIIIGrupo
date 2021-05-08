<%@page import="modelos.Modulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container"> 
            <h1>Modulos</h1>           
            <table border="1" width="1" cellspacing="1" class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">Id Modulo</th>
                            <th class="text-center">Nombre</th>
                            <th class="text-center">Descripcion</th>
                            <th class="text-center">Path</th>
                            <th class="text-center">Nivel</th>
                            <th class="text-center">Orden</th>
                            <th class="text-center">Modulo Padre</th>
                            <th class="text-center">Fecha Creacion</th>
                            <th class="text-center">Fecha Modificacion</th>
                            <th class="text-center">Usuario Creacion</th>
                            <th class="text-center">Usuario Modificacion</th>
                            <th class="text-center">Activo</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <%
                                if(request.getAttribute("modulo")!=null){
                                    Modulo modulo = (Modulo)request.getAttribute("modulo");
                            %>
                            <td class="text-center"><%=modulo.getIdModulo()%></td>
                            <td class="text-center"><%=modulo.getNombre()%></td>
                            <td class="text-center"><%=modulo.getDescripcion()%></td>
                            <td class="text-center"><%=modulo.getPath() %></td>
                            <td class="text-center"><%=modulo.getNivel() %></td>
                            <td class="text-center"><%=modulo.getOrden() %></td>
                            <td class="text-center"><%=modulo.getIdModuloPadre() %></td>
                            <td class="text-center"><%=modulo.getFechaCrear() %></td>
                            <td class="text-center"><%=modulo.getFechaMod() %></td>
                            <td class="text-center"><%=modulo.getUserCrear() %></td>
                            <td class="text-center"><%=modulo.getUserMod() %></td>
                            <td class="text-center"><%=modulo.getIsActivo()%></td>
                            <%}%>
                            <td class="text-center">                                
                                <a class="btn btn-warning" href="ControllerClientes?accion=editar&id=">Editar</a>
                                <a class="btn btn-danger" href="ControllerClientes?accion=delete&id=">Eliminar</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
        </div>
    </body>
</html>
