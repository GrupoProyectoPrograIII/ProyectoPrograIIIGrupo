<%@page import="modelos.Permiso"%>
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
            <table border="1" width="1" cellspacing="1" class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">Id Permiso</th>
                        <th class="text-center">Modulo</th>
                        <th class="text-center">Rol</th>
                        <th class="text-center">Fecha Creacion</th>
                        <th class="text-center">Fecha Modificacion</th>
                        <th class="text-center">Usuario Creacion</th>
                        <th class="text-center">Usuario Modificacion</th>
                        <th class="text-center">Activo</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                        <%
                            if (request.getAttribute("permiso") != null) {
                                Permiso permiso = (Permiso) request.getAttribute("permiso");
                        %>
                    <tr>
                            <td class="text-center"><%=permiso.getIdPermiso()%></td>
                            <td class="text-center"><%=permiso.getIdModulo()%></td>
                            <td class="text-center"><%=permiso.getIdRol()%></td>
                            <td class="text-center"><%=permiso.getFechaCrear()%></td>
                            <td class="text-center"><%=permiso.getFechaMod()%></td>
                            <td class="text-center"><%=permiso.getUserCrear()%></td>
                            <td class="text-center"><%=permiso.getUserMod()%></td>
                            <td class="text-center"><%=permiso.getIsActivo()%></td>
                        <%}%>
                        <td class="text-center">                                
                            <a class="btn btn-warning" href="ControllerClientes?accion=editar&id">Editar</a>
                            <a class="btn btn-danger" href="ControllerClientes?accion=delete&id=">Eliminar</a>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
