<%@page import="modelos.Proveedor"%>
<%@page import="modelos.Rol"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelos.Usuario"%>
<%@page import="dao.DaoProveedor"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proveedores</title>
        <script>
            function agregarFila() {
                var form = document.createElement("form");
                form.setAttribute("class", "container");
                form.setAttribute("method", "post");
                form.setAttribute("autocomplete", "off");
                form.setAttribute("action", "controllerMantenimiento");
                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Agregar Fila";
                
                // Create an input element for Proveedor
                var provee = document.createElement("input");
                provee.setAttribute("type", "text");
                provee.setAttribute("name", "Aproveedor");
                provee.setAttribute("placeholder", "Proveedor");
                // Create an input element for Telefono
                var telefono = document.createElement("input");
                telefono.setAttribute("type", "text");
                telefono.setAttribute("name", "Atelefono");
                telefono.setAttribute("placeholder", "Telefono");
                // Create an input element for Direccion
                var direccion = document.createElement("input");
                direccion.setAttribute("type", "text");
                direccion.setAttribute("name", "Adireccion");
                direccion.setAttribute("placeholder", "Direccion");
            <%
                List<Proveedor> lstProvee = (List<Proveedor>) request.getAttribute("proveedor");
            %>
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "agregarPro");
                s.innerHTML = ("Agregar");
                // Append the inputs to the form
                form.append(newlabel, provee, telefono, direccion);
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
                form.setAttribute("autocomplete", "off");
                form.setAttribute("action", "controllerMantenimiento");
                
                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Editar Fila";
                
                var id = document.createElement("input");
                id.setAttribute("type", "hidden");
                id.setAttribute("name", "Eidprovee");
                id.setAttribute("value", datos[1]);

                // Create an input element for Nombre
                var provee = document.createElement("input");
                provee.setAttribute("type", "text");
                provee.setAttribute("name", "Enombre");
                provee.setAttribute("Value", datos[2]);
                // Create an input element for Apellido
                var telefono = document.createElement("input");
                telefono.setAttribute("name", "Etelefono");
                telefono.setAttribute("type", "text");
                telefono.setAttribute("Value", datos[3]);
                // Create an input element for Usuario
                var direccion = document.createElement("input");
                direccion.setAttribute("type", "text");
                direccion.setAttribute("name", "Edireccion");
                direccion.setAttribute("Value", datos[4]);
            <%
                lstProvee = (List<Proveedor>) request.getAttribute("proveedor");
            %>
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "editarPro");
                s.innerHTML = ("Editar");
                // Append the inputs to the form
                form.append(newlabel, id, provee, telefono, direccion);
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
                form.setAttribute("autocomplete", "off");

                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Eliminar Fila";

                var id = document.createElement("input");
                id.setAttribute("type", "hidden");
                id.setAttribute("name", "Didprovee");
                id.setAttribute("value", datos[1]);

                var provee = document.createElement("input");
                provee.setAttribute("type", "text");
                provee.setAttribute("name", "Pnombre");
                provee.setAttribute("disabled", "disabled");
                provee.setAttribute("Value", datos[2]);
                
                var telefono = document.createElement("input");
                telefono.setAttribute("name", "Ptelefono");
                telefono.setAttribute("type", "text");
                telefono.setAttribute("disabled", "disabled");
                telefono.setAttribute("Value", datos[3]);
                
                var direccion = document.createElement("input");
                direccion.setAttribute("type", "text");
                direccion.setAttribute("name", "Pdireccion");
                direccion.setAttribute("disabled", "disabled");
                direccion.setAttribute("Value", datos[4]);
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "eliminarPro");
                s.innerHTML = ("Eliminar");
                // Append the inputs to the form
                form.append(newlabel, id, provee, telefono, direccion);
                // Append the button to the form
                form.append(s);
                document.getElementsByTagName("body")[0]
                        .appendChild(form);
            }
        </script>
    </head>
    <body style="padding-bottom: 50px">
        <div class="container"> 
            <h1>Proveedores</h1>        
            <table border="1" width="1" cellspacing="1" class="table table-hover" id="myTable">
                <thead>
                    <tr>
                        <th class="text-center">Id Proveedor</th>
                        <th class="text-center">Proveedor</th>
                        <th class="text-center">Telefono</th>
                        <th class="text-center">Direccion</th>    
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int iter = 0;
                        for (Proveedor provee : lstProvee) {
                            iter++;
                    %>
                    <tr>
                        <td class="text-center"><%=provee.getId_proveedor() %></td>
                        <td class="text-center"><%=provee.getNombre_proveedor() %></td>
                        <td class="text-center"><%=provee.getTelefono() %></td>
                        <td class="text-center"><%=provee.getDireccion() %></td>

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
    </body>
</html>
