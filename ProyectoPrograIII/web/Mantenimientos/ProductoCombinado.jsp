<%@page import="modelos.Rol"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelos.ProductoCombo"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Producto Combinado</title>
        <script>
            function agregarFila() {
                var form = document.createElement("form");
                form.setAttribute("class", "container");
                form.setAttribute("method", "post");
                form.setAttribute("action", "controllerMantenimiento");
                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Agregar Fila";
                // Create an input element for Tipo Combo
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "AidTipo");
                name.setAttribute("placeholder", "idTipoCombo");
                // Create an input element for Descripcion(primer producto)
                var apellido = document.createElement("input");
                apellido.setAttribute("type", "text");
                apellido.setAttribute("name", "Anombre");               
                name.setAttribute("placeholder", "Nombre");
                // Create an input element for Apellido
                var apellido = document.createElement("input");
                apellido.setAttribute("type", "text");
                apellido.setAttribute("name", "Aprecio");
                apellido.setAttribute("placeholder", "Precio");
                // Create an input element for Descripcion(Segundo Producto)
                var users = document.createElement("input");
                users.setAttribute("type", "text");
                users.setAttribute("name", "Adescripcion2");
                users.setAttribute("placeholder", "Usuario");
                // Create an input element for precio
                var password = document.createElement("input");
                password.setAttribute("type", "text");
                password.setAttribute("name", "Aprecio");
                password.setAttribute("placeholder", "Password");
                // Create an input element for Estado
                var role = document.createElement("select");
                role.setAttribute("name", "Estado");
                role.setAttribute("placeholder", "Rol");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("seleccione");
                role.appendChild(option);
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "agregarPC");
                s.innerHTML = ("Agregar");
                // Append the inputs to the form
                form.append(newlabel, name, apellido, users, password, role);
                // Append the button to the form
                form.append(s);
                document.getElementsByTagName("body")[0]
                        .appendChild(form);
                
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
                form.setAttribute("action", "controllerMantenimiento");
                
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
                s.setAttribute("value", "editarPC");
                s.innerHTML = ("Editar");
                // Append the inputs to the form
                form.append(newlabel, id, name, apellido, users, password, role, active);
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
                form.setAttribute("action", "controllerMantenimiento");

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
                s.setAttribute("value", "eliminarPC");
                s.innerHTML = ("Eliminar");
                // Append the inputs to the form
                form.append(newlabel, id, name, apellido, users, password, role, active);
                // Append the button to the form
                form.append(s);
                document.getElementsByTagName("body")[0]
                        .appendChild(form);
            }
        </script>
    </head>
    <body style="padding-bottom: 50px">
        <div class="container"> 
            <h1>Productos Combinados</h1>        
            <table border="1" width="1" cellspacing="1" class="table table-hover" id="myTable">
                <thead>
                    <tr>
                        <th class="text-center">Id Combo</th>
                        <th class="text-center">Id Tipo Combo</th>
                        <th class="text-center">Descripcion</th>
                        <th class="text-center">Precio</th>
                        <!--<th class="text-center">Estado</th>-->
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int iter = 0;
                        List<ProductoCombo> lstProductoCombo = (List<ProductoCombo>) request.getAttribute("productoCombo");
                        for (ProductoCombo productoCombo : lstProductoCombo) {
                            iter++;
                    %>
                    <tr>
                        <td class="text-center"><%=productoCombo.getIdCombo() %></td>
                        <td class="text-center"><%=productoCombo.getTipoCombo()%></td>
                        <td class="text-center"><%=productoCombo.getNombre()%></td>
                        <td class="text-center"><%=productoCombo.getPrecio()%></td>  
                                       
                       
                        <td class="text-center">                            
                            <button type="button" class="btn btn-warning" id="edit" onclick="editarFila(<%=iter%>)">Editar</button>
                            <button type="button" class="btn btn-danger" id="delete" onclick="eliminarFila(<%=iter%>)">Eliminar</button>
                        </td>
                    </tr>
                    <%}%>
                    <td class="text-center">                            
                            <button type="button" class="btn btn-warning" id="edit" onclick="editarFila(<%=iter%>)">Editar</button>
                            <button type="button" class="btn btn-danger" id="delete" onclick="eliminarFila(<%=iter%>)">Eliminar</button>
                        </td>
                </tbody>
            </table>
            <button type="button" class="btn btn-success" onclick="agregarFila()">Agregar</button>
        </div>
    </body>
</html>
