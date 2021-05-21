<%@page import="modelos.Rol"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelos.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla.jsp"/>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script>
            function agregarFila() {
                var form = document.createElement("form");
                form.setAttribute("class", "container");
                form.setAttribute("method", "post");
                form.setAttribute("action", "controllerUsuario");
                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Agregar Fila";
                // Create an input element for Nombre
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "Anombre");
                name.setAttribute("placeholder", "Nombre");
                // Create an input element for Apellido
                var apellido = document.createElement("input");
                apellido.setAttribute("type", "text");
                apellido.setAttribute("name", "Aapellido");
                apellido.setAttribute("placeholder", "Apellido");
                // Create an input element for Usuario
                var users = document.createElement("input");
                users.setAttribute("type", "text");
                users.setAttribute("name", "Auser");
                users.setAttribute("placeholder", "Usuario");
                // Create an input element for Password
                var password = document.createElement("input");
                password.setAttribute("type", "password");
                password.setAttribute("name", "Apassword");
                password.setAttribute("placeholder", "Password");
                // Create an input element for Rol
                var role = document.createElement("select");
                role.setAttribute("name", "Arole");
                role.setAttribute("placeholder", "Rol");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("seleccione");
                role.appendChild(option);
            <%
                List<Usuario> lstUsuario = (List<Usuario>) request.getAttribute("user");
                List<Rol> lstRol = (List<Rol>) request.getAttribute("rol");
                for (Rol rol : lstRol) {
            %>
                option = document.createElement("option");
                option.setAttribute("value", "<%=rol.getIdRol()%>");
                option.innerHTML = ("<%=rol.getNombre()%>");
                role.appendChild(option);
            <%}%>
                // Create an input element for Activo
                var active = document.createElement("select");
                active.setAttribute("name", "Aactivo");
                active.setAttribute("placeholder", "Activo");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("seleccione");
                var option1 = document.createElement("option");
                option1.setAttribute("value", "1");
                option1.innerHTML = ("Activo");
                var option2 = document.createElement("option");
                option2.setAttribute("value", "0");
                option2.innerHTML = ("Inactivo");
                active.appendChild(option);
                active.appendChild(option1);
                active.appendChild(option2);
                // Create a submit button
                var s = document.createElement("input");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "agregar");
                // Append the inputs to the form
                form.append(newlabel, name, apellido, users, password, role, active);
                // Append the button to the form
                form.append(s);
                document.getElementsByTagName("body")[0]
                        .appendChild(form);
                //document.getElementById("tablaprueba").insertRow(-1).innerHTML = '<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><a class="btn btn-warning" href="ControllerUsuario?accion=editar&id=">Editar</a><button type="button" class="btn btn-danger" onclick="eliminarFila()">Eliminar Fila</button></td>';
            }
        </script>
    </head>
    <body style="padding-bottom: 50px">
        <div class="container"> 
            <h1>Usuarios</h1>        
            <table border="1" width="1" cellspacing="1" class="table table-hover" id="myTable">
                <thead>
                    <tr>
                        <th class="text-center">Id Usuario</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">Apellido</th>
                        <th class="text-center">Usuario</th>
                        <th class="text-center">Password</th>
                        <th class="text-center">Rol</th>
                            <%--<th class="text-center">Fecha Creacion</th>--%>
                        <th class="text-center">Activo</th>
                            <%--<th class="text-center">Fecha Modificacion</th>
                            <th class="text-center">Usuario Creacion</th>
                            <th class="text-center">Usuario Modificacion</th>
                            <th class="text-center">Codigo</th>--%>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int iter = 0;
                        for (Usuario user : lstUsuario) {
                            iter++;
                    %>
                    <tr>
                        <td class="text-center"><%=user.getIdUser()%></td>
                        <td class="text-center"><%=user.getNombre()%></td>
                        <td class="text-center"><%=user.getApellido()%></td>
                        <td class="text-center"><%=user.getUser()%></td>
                        <td class="text-center"><%=user.getPass()%></td>
                        <td class="text-center"><%=user.getRol()%></td>
                        <%--<td class="text-center"><%=user.getFechaCrear()%></td>--%>
                        <% if (user.getIsActivo() == 1) { %>
                        <td class="text-center">Activo</td>
                        <%} else {%>
                        <td class="text-center">Inactivo</td>
                        <%}%>
                        <%--<td class="text-center"><%=user.getFechaMod()%></td>
                        <td class="text-center"><%=user.getUserCrear()%></td>
                        <td class="text-center"><%=user.getUserMod()%></td>
                        <td class="text-center"><%=user.getCodigo()%></td>--%>

                        <td class="text-center">                            
                            <button type="button" class="btn btn-warning" id="edit" onclick="editarFila(<%=iter%>)">Editar</button>
                            <button type="button" class="btn btn-danger" id="delete" onclick="eliminarFila(<%=iter%>)">Eliminar</button>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
            <button type="button" class="btn btn-success" onclick="agregarFila()">Agregar</button>
        </div>
        <script>
            function editarFila(a) {
                Swal.fire({
                    title: '¿Desea modificar el registro?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#30AB26',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Confirmar',
                    cancelButtonText: 'Cancelar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        //getsTable
                        var oTable = document.getElementById('myTable');
                        //gets rows of table
                        var rowLength = oTable.rows.length;
                        //loops through rows    
                        for (var i = a; i <= a; i++) {
                            //gets cells of current row  
                            var oCells = oTable.rows.item(i).cells;
                            //gets amount of cells of current row
                            var cellLength = oCells.length;
                            //loops through each cell in current row
                            for (var j = 0; j < cellLength - 1; j++) {
                                var cellVal = cellVal + "," + oCells.item(j).innerHTML;

                                console.log(cellVal);
                            }
                            datos = cellVal.split(',');

                        }

                        var form = document.createElement("form");
                        form.setAttribute("class", "container");
                        form.setAttribute("method", "post");
                        form.setAttribute("action", "controllerUsuario");

                        var newlabel = document.createElement("h1");
                        newlabel.setAttribute("type", "text");
                        newlabel.innerHTML = "Editar Fila";

                        var id = document.createElement("input");
                        id.setAttribute("type", "hidden");
                        id.setAttribute("name", "Eiduser");
                        id.setAttribute("value", datos[1]);

                        // Create an input element for Nombre
                        var name = document.createElement("input");
                        name.setAttribute("type", "text");
                        name.setAttribute("name", "Enombre");
                        name.setAttribute("Value", datos[2]);
                        // Create an input element for Apellido
                        var apellido = document.createElement("input");
                        apellido.setAttribute("name", "Eapellido");
                        apellido.setAttribute("type", "text");
                        apellido.setAttribute("Value", datos[3]);
                        // Create an input element for Usuario
                        var users = document.createElement("input");
                        users.setAttribute("type", "text");
                        users.setAttribute("name", "Euser");
                        users.setAttribute("Value", datos[4]);
                        // Create an input element for Password
                        var password = document.createElement("input");
                        password.setAttribute("type", "password");
                        password.setAttribute("name", "Epassword");
                        password.setAttribute("Value", datos[5]);
                        // Create an input element for Rol
                        var role = document.createElement("select");
                        role.setAttribute("name", "Erole");
                        role.setAttribute("placeholder", "Rol");
                        var option = document.createElement("option");
                        option.setAttribute("disabled", "selected");
                        option.setAttribute("selected", "selected");
                        option.innerHTML = ("seleccione");
                        role.appendChild(option);
            <%
                lstUsuario = (List<Usuario>) request.getAttribute("user");
                lstRol = (List<Rol>) request.getAttribute("rol");
                for (Rol rol : lstRol) {
            %>
                        option = document.createElement("option");
                        option.setAttribute("value", "<%=rol.getIdRol()%>");
                        option.innerHTML = ("<%=rol.getNombre()%>");
                        role.appendChild(option);
            <%}%>
                        // Create an input element for Activo
                        var active = document.createElement("select");
                        active.setAttribute("name", "Eactivo");
                        active.setAttribute("placeholder", "Activo");
                        var option = document.createElement("option");
                        option.setAttribute("disabled", "selected");
                        option.setAttribute("selected", "selected");
                        option.innerHTML = ("seleccione");
                        var option1 = document.createElement("option");
                        option1.setAttribute("value", "1");
                        option1.innerHTML = ("Activo");
                        var option2 = document.createElement("option");
                        option2.setAttribute("value", "0");
                        option2.innerHTML = ("Inactivo");
                        active.appendChild(option);
                        active.appendChild(option1);
                        active.appendChild(option2);

                        // Create a submit button
                        var s = document.createElement("input");
                        s.setAttribute("type", "submit");
                        s.setAttribute("name", "accion");
                        s.setAttribute("value", "editar");
                        // Append the inputs to the form
                        form.append(newlabel, id, name, apellido, users, password, role, active);
                        // Append the button to the form
                        form.append(s);
                        document.getElementsByTagName("body")[0]
                                .appendChild(form);
                    }
                });
            }
            function eliminarFila(b)
            {
                Swal.fire({
                    title: '¿Desea eliminar el registro?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#30AB26',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Confirmar',
                    cancelButtonText: 'Cancelar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        //getsTable
                        var oTable = document.getElementById('myTable');
                        //gets rows of table
                        var rowLength = oTable.rows.length;
                        //loops through rows    
                        for (var i = b; i <= b; i++) {
                            //gets cells of current row  
                            var oCells = oTable.rows.item(i).cells;
                            //gets amount of cells of current row
                            var cellLength = oCells.length;
                            //loops through each cell in current row
                            for (var j = 0; j < cellLength - 1; j++) {
                                var cellVal = cellVal + "," + oCells.item(j).innerHTML;

                                console.log("CellVal:" + cellVal);
                            }
                            datos = cellVal.split(',');

                        }

                        var form = document.createElement("form");
                        form.setAttribute("class", "container");
                        form.setAttribute("method", "post");
                        form.setAttribute("action", "controllerUsuario");

                        var newlabel = document.createElement("h1");
                        newlabel.setAttribute("type", "text");
                        newlabel.innerHTML = "Eliminar Fila";

                        var id = document.createElement("input");
                        id.setAttribute("type", "hidden");
                        id.setAttribute("name", "Diduser");
                        id.setAttribute("value", datos[1]);

                        // Create an input element for Nombre
                        var name = document.createElement("input");
                        name.setAttribute("type", "text");
                        name.setAttribute("name", "Dnombre");
                        name.setAttribute("disabled", "disabled");
                        name.setAttribute("Value", datos[2]);
                        // Create an input element for Apellido
                        var apellido = document.createElement("input");
                        apellido.setAttribute("name", "DApellido");
                        apellido.setAttribute("type", "text");
                        apellido.setAttribute("disabled", "disabled");
                        apellido.setAttribute("Value", datos[3]);
                        // Create an input element for Usuario
                        var users = document.createElement("input");
                        users.setAttribute("type", "text");
                        users.setAttribute("name", "Duser");
                        users.setAttribute("disabled", "disabled");
                        users.setAttribute("Value", datos[4]);
                        // Create an input element for Password
                        var password = document.createElement("input");
                        password.setAttribute("type", "password");
                        password.setAttribute("name", "Dpassword");
                        password.setAttribute("disabled", "disabled");
                        password.setAttribute("Value", datos[5]);
                        // Create an input element for Rol
                        var role = document.createElement("input");
                        role.setAttribute("name", "Drole");
                        role.setAttribute("disabled", "disabled");
                        role.setAttribute("value", datos[6]);
                        // Create an input element for Activo
                        var active = document.createElement("input");
                        active.setAttribute("type", "text");
                        active.setAttribute("name", "Dactivo");
                        active.setAttribute("disabled", "disabled");
                        active.setAttribute("Value", datos[7]);
                        // Create a submit button
                        var s = document.createElement("input");
                        s.setAttribute("type", "submit");
                        s.setAttribute("name", "accion");
                        s.setAttribute("value", "eliminar");
                        // Append the inputs to the form
                        form.append(newlabel, id, name, apellido, users, password, role, active);
                        // Append the button to the form
                        form.append(s);
                        document.getElementsByTagName("body")[0]
                                .appendChild(form);
                    }
                });
            }
        </script>
    </body>
    <c:if test="${guardar == 0}">
        <script type="text/javascript">
            swal.fire({
                title: "¡Error!",
                text: "El registro no se pudo guardar",
                icon: 'error', //warning,info,question,error,success
                confirmButtonText: "Aceptar"
            });
        </script>
    </c:if>
    <c:if test="${guardar == 1}">
        <script type="text/javascript">
            swal.fire({
                title: "¡Éxito!",
                text: "El registro se guardo correctamente",
                icon: 'success', //warning,info,question,error,success
                confirmButtonText: "Aceptar"
            });
        </script>
    </c:if>
    <c:if test="${modificar == 0}">
        <script type="text/javascript">
            swal.fire({
                title: "¡Error!",
                text: "El registro no se pudo modificar",
                icon: 'error', //warning,info,question,error,success
                confirmButtonText: "Aceptar"
            });
        </script>
    </c:if>
    <c:if test="${modificar == 1}">
        <script type="text/javascript">
            swal.fire({
                title: "¡Éxito!",
                text: "El registro se modifico correctamente",
                icon: 'success', //warning,info,question,error,success
                confirmButtonText: "Aceptar"
            });
        </script>
    </c:if>
    <c:if test="${eliminar == 0}">
        <script type="text/javascript">
            swal.fire({
                title: "¡Error!",
                text: "El registro no se pudo eliminar",
                icon: 'error', //warning,info,question,error,success
                confirmButtonText: "Aceptar"
            });
        </script>
    </c:if>
    <c:if test="${eliminar == 1}">
        <script type="text/javascript">
            swal.fire({
                title: "¡Éxito!",
                text: "El registro se elimino correctamente",
                icon: 'success', //warning,info,question,error,success
                confirmButtonText: "Aceptar"
            });
        </script>
    </c:if>  
</html>
