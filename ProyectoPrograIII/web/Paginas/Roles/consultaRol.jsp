<%@page import="modelos.Rol"%>
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
            <h1>Roles</h1>           
            <table border="1" width="1" cellspacing="1" class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">Id Rol</th>
                            <th class="text-center">Nombre</th>
                            <th class="text-center">Descripcion</th>
                            <th class="text-center">Activo</th>
                            <th class="text-center">Usuario Creacion</th>
                            <th class="text-center">Usuario Modificacion</th>
                            <th class="text-center">Fecha Creacion</th>
                            <th class="text-center">Fecha Modificacion</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <%
                                if(request.getAttribute("rol")!=null){
                                    Rol rol = (Rol)request.getAttribute("rol");
                            %>
                            <td class="text-center"><%=rol.getIdRol()%></td>
                            <td class="text-center"><%=rol.getNombre()%></td>
                            <td class="text-center"><%=rol.getDescripcion()%></td>
                            <td class="text-center"><%=rol.getIsActivo()%></td>
                            <td class="text-center"><%=rol.getUserCrear()%></td>
                            <td class="text-center"><%=rol.getUserMod()%></td>
                            <td class="text-center"><%=rol.getFechaCrear()%></td>
                            <td class="text-center"><%=rol.getFechaMod()%></td>
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
