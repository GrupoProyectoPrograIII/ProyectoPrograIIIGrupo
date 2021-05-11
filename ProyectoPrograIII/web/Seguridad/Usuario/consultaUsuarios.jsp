<%@page import="modelos.Rol"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelos.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>

        <script>

            function agregarFila() {
                var form = document.createElement("form");
                form.setAttribute("class", "container")
                form.setAttribute("method", "get");
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
                var role = document.createElement("input");
                role.setAttribute("type", "text");
                role.setAttribute("name", "Arol");
                role.setAttribute("placeholder", "Rol");
                // Create an input element for Activo
                var active = document.createElement("input");
                active.setAttribute("type", "text");
                active.setAttribute("name", "Aactivo");
                active.setAttribute("placeholder", "Activo");
                // Create an input element for Codigo
                var codigo = document.createElement("input");
                codigo.setAttribute("type", "text");
                codigo.setAttribute("name", "Acodigo");
                codigo.setAttribute("placeholder", "Codigo");

                // Create a submit button
                var s = document.createElement("input");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "agregar");

                // Append the inputs to the form
                form.append(newlabel, name, apellido, users, password, role, active, codigo);
                // Append the button to the form
                form.append(s);

                document.getElementsByTagName("body")[0]
                        .appendChild(form);
                //document.getElementById("tablaprueba").insertRow(-1).innerHTML = '<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><a class="btn btn-warning" href="ControllerUsuario?accion=editar&id=">Editar</a><button type="button" class="btn btn-danger" onclick="eliminarFila()">Eliminar Fila</button></td>';
            }
            $(document).ready(function () {
                $('#edit').on('change', function () {
                    editarFila(this.value);
                });
            });
            function editarFila(a) {
                //getsTable
                var oTable = document.getElementById('myTable');
                //gets rows of table
                var rowLength = oTable.rows.length;
                //loops through rows    
                for (i = 1; i <= a; i++) {
                    //gets cells of current row  
                    var oCells = oTable.rows.item(i).cells;
                    //gets amount of cells of current row
                    var cellLength = oCells.length;
                    //loops through each cell in current row
                    for (var j = 1; j < cellLength - 1; j++) {
                        //get your cell info here
                        //console.log(cellVal); check values added
                        var cellVal = cellVal + " , " + oCells.item(j).innerHTML;
                    }
                    datos = cellVal.split(',');
                    // console.log(datos[3]);
                }

                var form = document.createElement("form");
                form.setAttribute("class", "container")
                form.setAttribute("method", "get");
                form.setAttribute("action", "controllerUsuario");

                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Editar Fila";

                /*var id = document.createElement("input");
                 id.setAttribute("type", "hidden");
                 id.setAttribute("name", "valorEditar");
                 id.setAttribute("Value", a);*/

                // Create an input element for Nombre
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "Enombre");
                name.setAttribute("Value", datos[1]);
                // Create an input element for Apellido
                var apellido = document.createElement("input");
                apellido.setAttribute("name", "EApellido");
                apellido.setAttribute("type", "text");
                apellido.setAttribute("Value", datos[2]);
                // Create an input element for Usuario
                var users = document.createElement("input");
                users.setAttribute("type", "text");
                users.setAttribute("name", "Euser");
                users.setAttribute("Value", datos[3]);
                // Create an input element for Password
                var password = document.createElement("input");
                password.setAttribute("type", "password");
                password.setAttribute("name", "Epassword");
                password.setAttribute("Value", datos[4]);
                // Create an input element for Rol
                var role = document.createElement("input");
                role.setAttribute("type", "text");
                role.setAttribute("name", "Erol");
                role.setAttribute("Value", datos[5]);
                // Create an input element for Activo
                var active = document.createElement("input");
                active.setAttribute("type", "text");
                active.setAttribute("name", "Eactivo");
                active.setAttribute("Value", datos[7]);
                // Create an input element for Codigo
                var codigo = document.createElement("input");
                codigo.setAttribute("type", "text");
                codigo.setAttribute("name", "Ecodigo");
                codigo.setAttribute("Value", datos[11]);

                // Create a submit button
                var s = document.createElement("input");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "editar");

                // Append the inputs to the form
                form.append(newlabel, name, apellido, users, password, role, active, codigo);

                // Append the button to the form
                form.append(s);

                document.getElementsByTagName("body")[0]
                        .appendChild(form);
            }

            $(document).ready(function () {
                $('#delete').on('change', function () {
                    eliminarFila(this.value);
                });
            });
            function eliminarFila(b) {
                //getsTable
                var oTable = document.getElementById('myTable');
                //gets rows of table
                var rowLength = oTable.rows.length;
                //loops through rows    
                for (i = 1; i <= b; i++) {
                    //gets cells of current row  
                    var oCells = oTable.rows.item(i).cells;
                    //gets amount of cells of current row
                    var cellLength = oCells.length;
                    //loops through each cell in current row
                    for (var j = 1; j < cellLength - 1; j++) {
                        //get your cell info here
                        //console.log(cellVal); check values added
                        var cellVal = cellVal + " , " + oCells.item(j).innerHTML;
                    }
                    datos = cellVal.split(',');
                    //console.log(datos[3]);
                }

                var form = document.createElement("form");
                form.setAttribute("class", "container")
                form.setAttribute("method", "get");
                form.setAttribute("action", "controllerUsuario");

                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Eliminar Fila";

                // Create an input element for Nombre
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "Dnombre");
                name.setAttribute("Value", datos[1]);
                // Create an input element for Apellido
                var apellido = document.createElement("input");
                apellido.setAttribute("name", "DApellido");
                apellido.setAttribute("type", "text");
                apellido.setAttribute("Value", datos[2]);
                // Create an input element for Usuario
                var users = document.createElement("input");
                users.setAttribute("type", "text");
                users.setAttribute("name", "Duser");
                users.setAttribute("Value", datos[3]);
                // Create an input element for Password
                var password = document.createElement("input");
                password.setAttribute("type", "password");
                password.setAttribute("name", "Dpassword");
                password.setAttribute("Value", datos[4]);
             
                // Create an input element for Rol
                var role = document.createElement("input");
                role.setAttribute("name", "Drole");
                role.setAttribute("placeholder", datos[5]);
                // Create an input element for Activo
                var active = document.createElement("input");
                active.setAttribute("type", "text");
                active.setAttribute("name", "Dactivo");
                active.setAttribute("Value", datos[7]);
                // Create an input element for Codigo
                var codigo = document.createElement("input");
                codigo.setAttribute("type", "text");
                codigo.setAttribute("name", "Dcodigo");
                codigo.setAttribute("Value", datos[11]);



                // Create a submit button
                var s = document.createElement("input");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "eliminar");

                // Append the inputs to the form
                form.append(newlabel, name, apellido, users, password, role, active, codigo);
                // Append the button to the form
                form.append(s);

                document.getElementsByTagName("body")[0]
                        .appendChild(form);
            }

          /*  function extraerDatos() {

                var oTable = document.getElementById('myTable');
                //gets rows of table
                var rowLength = oTable.rows.length;
                //loops through rows    
                for (i = 1; i < rowLength; i++) {
                    //gets cells of current row  
                    var oCells = oTable.rows.item(i).cells;
                    //gets amount of cells of current row
                    var cellLength = oCells.length;
                    //loops through each cell in current row
                    for (var j = 1; j < cellLength - 1; j++) {
                        // get your cell info here
                        var cellVal = oCells.item(j).innerHTML;

                        console.log(cellVal);
                    }
                }
            }*/
        </script>
    </head>
    <body>
        <div class="container"> 
            <h1>Usuarios</h1>
            <button type="button" class="btn btn-success" onclick="agregarFila()">Agregar Usuario</button>
            <table border="1" width="1" cellspacing="1" class="table-bordered" id="myTable">
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
                            <button type="button" class="btn btn-warning" id="edit" onclick="editarFila(<%=user.getIdUser()%>)">Editar</button>
                            <button type="button" class="btn btn-danger" id="delete" onclick="eliminarFila(<%=user.getIdUser()%>)">Eliminar</button>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
