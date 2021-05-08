<%@page import="java.util.Iterator"%>
<%@page import="modelos.Usuario"%>
<%@page import="java.util.List"%>
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
            <h1>Usuarios</h1>           
            <table border="1" width="1" cellspacing="1" class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">Id Usuario</th>
                            <th class="text-center">Nombre</th>
                            <th class="text-center">Apellido</th>
                            <th class="text-center">Usuario</th>
                            <th class="text-center">Password</th>
                            <th class="text-center">Rol</th>
                            <th class="text-center">Fecha Creacion</th>
                            <th class="text-center">Activo</th>
                            <th class="text-center">Fecha Modificacion</th>
                            <th class="text-center">Usuario Creacion</th>
                            <th class="text-center">Usuario Modificacion</th>
                            <th class="text-center">Codigo</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <% 
                                if(request.getAttribute("user")!=null){
                                    Usuario user = (Usuario)request.getAttribute("user");
                            %>
                            <td class="text-center"><%=user.getIdUser()%></td>
                            <td class="text-center"><%=user.getNombre()%></td>
                            <td class="text-center"><%=user.getApellido() %></td>
                            <td class="text-center"><%=user.getUser()%></td>
                            <td class="text-center"><%=user.getPass() %></td>
                            <td class="text-center"><%=user.getIdRol()%></td>
                            <td class="text-center"><%=user.getFechaCrear() %></td>
                            <td class="text-center"><%=user.getIsActivo()%></td>
                            <td class="text-center"><%=user.getFechaMod() %></td>
                            <td class="text-center"><%=user.getUserCrear() %></td>
                            <td class="text-center"><%=user.getUserMod() %></td>
                            <td class="text-center"><%=user.getCodigo()%></td>
                            <%}%>
                            <td class="text-center">                                
                                <a class="btn btn-warning" href="ControllerUsuario?accion=editar&id=">Editar</a>
                                <a class="btn btn-danger" href="ControllerUsuario?accion=delete&id=">Eliminar</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
        </div>
    </body>
</html>
