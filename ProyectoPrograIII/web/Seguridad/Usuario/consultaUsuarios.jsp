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
        <script>
            
            function agregarFila() {
                var form = document.createElement("form");
                form.setAttribute("class","container")
                form.setAttribute("method", "get");
                form.setAttribute("action","controllerUsuario");
  
                // Create an input element for Nombre
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "emailID");
                name.setAttribute("placeholder", "E-Mail ID");
                // Create an input element for Apellido
                var apellido = document.createElement("input");
                apellido.setAttribute("type", "text");
                apellido.setAttribute("name", "emailapellido");
                apellido.setAttribute("placeholder", "E-Mail ID");
                // Create an input element for Usuario
                var users = document.createElement("input");
                users.setAttribute("type", "text");
                users.setAttribute("name", "emailuser");
                users.setAttribute("placeholder", "E-Mail ID");
                // Create an input element for Password
                var password = document.createElement("input");
                password.setAttribute("type", "text");
                password.setAttribute("name", "emailpassword");
                password.setAttribute("placeholder", "E-Mail ID");
                // Create an input element for Rol
                var role = document.createElement("input");
                role.setAttribute("type", "text");
                role.setAttribute("name", "emailrole");
                role.setAttribute("placeholder", "E-Mail ID");
                // Create an input element for Activo
                var active = document.createElement("input");
                active.setAttribute("type", "text");
                active.setAttribute("name", "emailactive");
                active.setAttribute("placeholder", "E-Mail ID");
                // Create an input element for Codigo
                var codigo = document.createElement("input");
                codigo.setAttribute("type", "text");
                codigo.setAttribute("name", "emailcodigo");
                codigo.setAttribute("placeholder", "E-Mail ID");
                
                // Create a submit button
                var s = document.createElement("input");
                s.setAttribute("type","submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "agregar");
                
                // Append the inputs to the form
                form.append(name);
                form.append(apellido);
                form.append(users);
                form.append(password);
                form.append(role);
                form.append(active);
                form.append(codigo);
                // Append the button to the form
                form.append(s); 
  
                document.getElementsByTagName("body")[0]
               .appendChild(form);
            
                //document.getElementById("tablaprueba").insertRow(-1).innerHTML = '<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><a class="btn btn-warning" href="ControllerUsuario?accion=editar&id=">Editar</a><button type="button" class="btn btn-danger" onclick="eliminarFila()">Eliminar Fila</button></td>';
            }

            function eliminarFila() {
                var table = document.getElementById("tablaprueba");
                var rowCount = table.rows.length;
                //console.log(rowCount);

                if (rowCount <= 1)
                    alert('No se puede eliminar el encabezado');
                else
                    table.deleteRow(rowCount - 1);
            }
        </script>
    </head>
    <body>
        <div class="container"> 
            <h1>Usuarios</h1>
            <button type="button" class="btn btn-primary mr-2" onclick="agregarFila()">Agregar Usuario</button>
            <table border="1" width="1" cellspacing="1" class="table table-bordered" id="tablaprueba">
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
                    <%
                        List<Usuario> lstUsuario = (List<Usuario>) request.getAttribute("user");
                        for (Usuario user : lstUsuario) {
                    %>
                    <tr>
                        <td class="text-center"><%=user.getIdUser()%></td>
                        <td class="text-center"><%=user.getNombre()%></td>
                        <td class="text-center"><%=user.getApellido()%></td>
                        <td class="text-center"><%=user.getUser()%></td>
                        <td class="text-center"><%=user.getPass()%></td>
                        <td class="text-center"><%=user.getIdRol()%></td>
                        <td class="text-center"><%=user.getFechaCrear()%></td>
                        <td class="text-center"><%=user.getIsActivo()%></td>
                        <td class="text-center"><%=user.getFechaMod()%></td>
                        <td class="text-center"><%=user.getUserCrear()%></td>
                        <td class="text-center"><%=user.getUserMod()%></td>
                        <td class="text-center"><%=user.getCodigo()%></td>

                        <td class="text-center">                                
                            <a class="btn btn-warning" href="ControllerUsuario?accion=editar&id=">Editar</a>
                            <button type="button" class="btn btn-danger" onclick="eliminarFila()">Eliminar Fila</button>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
