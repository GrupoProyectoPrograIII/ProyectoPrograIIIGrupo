<%@page import="java.util.List"%>
<%@page import="modelos.Modulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modulos</title>
        <script>
            <%
                List<Modulo> lstModulo = null;
            %>
            function agregarFila() {
                var form = document.createElement("form");
                form.setAttribute("class", "container")
                form.setAttribute("method", "get");
                form.setAttribute("action", "controllerModulo");

                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Agregar Fila";
                
                // Create an input element for Nombre
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "nombre");
                name.setAttribute("placeholder", "Nombre");
                // Create an input element for Descripcion
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "nombre");
                name.setAttribute("placeholder", "Nombre");
                // Create an input element for Path
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "nombre");
                name.setAttribute("placeholder", "Nombre");
                // Create an input element for Nivel
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "nombre");
                name.setAttribute("placeholder", "Nombre");
                // Create an input element for Orden
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "nombre");
                name.setAttribute("placeholder", "Nombre");
                // Create an input element for Modulo Padre
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "nombre");
                name.setAttribute("placeholder", "Nombre");
                // Create an input element for Activo
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "nombre");
                name.setAttribute("placeholder", "Nombre");

                // Create a submit button
                var s = document.createElement("input");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "agregar");

                // Append the inputs to the form
                form.append(newlabel, name);
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
                var form = document.createElement("form");
                form.setAttribute("class", "container")
                form.setAttribute("method", "get");
                form.setAttribute("action", "controllerUsuario");

                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Editar Fila";

                // Create an input element for Nombre
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "nombre");
                name.setAttribute("placeholder",a);
                //name.setAttribute("value", "Nombre");

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
            function eliminarFila(a) {
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
                name.setAttribute("name", "nombre");
                name.setAttribute("value", "Nombre");

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
        </script>
    </head>
    <body>
        <div class="container"> 
            <h1>Modulos</h1>           
            <button type="button" class="btn btn-success" onclick="agregarFila()">Agregar Modulo</button>
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
                            lstModulo = (List<Modulo>) request.getAttribute("modulo");
                            for (Modulo modulo : lstModulo) {
                        %>
                        <td class="text-center"><%=modulo.getIdModulo()%></td>
                        <td class="text-center"><%=modulo.getNombre()%></td>
                        <td class="text-center"><%=modulo.getDescripcion()%></td>
                        <td class="text-center"><%=modulo.getPath()%></td>
                        <td class="text-center"><%=modulo.getNivel()%></td>
                        <td class="text-center"><%=modulo.getOrden()%></td>
                        <td class="text-center"><%=modulo.getIdModuloPadre()%></td>
                        <td class="text-center"><%=modulo.getFechaCrear()%></td>
                        <td class="text-center"><%=modulo.getFechaMod()%></td>
                        <td class="text-center"><%=modulo.getUserCrear()%></td>
                        <td class="text-center"><%=modulo.getUserMod()%></td>
                        <td class="text-center"><%=modulo.getIsActivo()%></td>

                        <td class="text-center">                                          
                            <button type="button" class="btn btn-warning" id="edit" onclick="editarFila()">Editar</button>
                            <button type="button" class="btn btn-danger" id="delete" onclick="eliminarFila()">Eliminar</button>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
