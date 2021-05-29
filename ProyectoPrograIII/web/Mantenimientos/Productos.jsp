<%@page import="modelos.Producto"%>
<%@page import="modelos.Rol"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelos.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Productos</title>
        <script>
            function agregarFila() {
                var form = document.createElement("form");
                form.setAttribute("class", "container");
                form.setAttribute("method", "post");
                form.setAttribute("action", "controllerMantenimiento");
                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Agregar Fila";
                // Create an input element for Descripcion
                var descripcion = document.createElement("input");
                descripcion.setAttribute("type", "text");
                descripcion.setAttribute("name", "Anombre");
                descripcion.setAttribute("placeholder", "Descripcion");
                // Create an input element for Precio
                var precio = document.createElement("input");
                precio.setAttribute("type", "text");
                precio.setAttribute("name", "Aprecio");
                precio.setAttribute("placeholder", "Precio");
                // Create an input element for Unidad
                var unidad = document.createElement("input");
                unidad.setAttribute("type", "text");
                unidad.setAttribute("name", "Aunidad");
                unidad.setAttribute("placeholder", "Unidad");
                // Create an input element for id Proveedor
                var idProveedor = document.createElement("input");
                idProveedor.setAttribute("type", "text");
                idProveedor.setAttribute("name", "AidProveedor");
                idProveedor.setAttribute("placeholder", "idProveedor");
                // Create an input element for Stock
                var stock = document.createElement("input");
                stock.setAttribute("type", "text");
                stock.setAttribute("name", "Astock");
                stock.setAttribute("placeholder", "Stock");
                // Create an input element for id Tipo Producto
                 var idTipo = document.createElement("input");
                idTipo.setAttribute("type", "text");
                idTipo.setAttribute("name", "AidTipo");
                idTipo.setAttribute("placeholder", "idTipo");                
                // Create a submit button
                var s = document.createElement("input");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "agregarProd");
                s.innerHTML = ("Agregar");
                // Append the inputs to the form
                form.append(newlabel, descripcion, precio, unidad, idProveedor, stock, idTipo);
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
                id.setAttribute("name", "Eidproducto");
                id.setAttribute("value", datos[1]);

                // Create an input element for Descripcion
                var descripcion = document.createElement("input");
                descripcion.setAttribute("type", "text");
                descripcion.setAttribute("name", "Enombre");
                descripcion.setAttribute("Value", datos[2]);
                // Create an input element for Precio
                var precio = document.createElement("input");
                precio.setAttribute("name", "Eprecio");
                precio.setAttribute("type", "text");
                precio.setAttribute("Value", datos[3]);
                // Create an input element for Unidad
                var unidad = document.createElement("input");
                unidad.setAttribute("type", "text");
                unidad.setAttribute("name", "Eunidad");
                unidad.setAttribute("Value", datos[4]);
                // Create an input element for id Proveedor
                var idProveedor = document.createElement("input");
                idProveedor.setAttribute("type", "text");
                idProveedor.setAttribute("name", "EidProveedor");
                idProveedor.setAttribute("Value", datos[5]);
                // Create an input element for Stock
                var stock = document.createElement("input");
                stock.setAttribute("type", "text");
                stock.setAttribute("name", "Estock");
                stock.setAttribute("Value", datos[5]);
                // Create an input element for id Tipo
                var idTipo = document.createElement("input");
                idTipo.setAttribute("type", "text");
                idTipo.setAttribute("name", "EidTipo");
                idTipo.setAttribute("Value", datos[5]);                
                // Create a submit button
                var s = document.createElement("input");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "editarProd");
                s.innerHTML = ("Editar");
                // Append the inputs to the form
                form.append(newlabel, id, descripcion, precio, unidad, idProveedor, stock, idTipo);
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
                id.setAttribute("name", "Didproducto");
                id.setAttribute("value", datos[1]);

                // Create an input element for Descripcion
                var descripcion = document.createElement("input");
                descripcion.setAttribute("type", "text");
                descripcion.setAttribute("name", "Dnombre");
                descripcion.setAttribute("disabled", "disabled");
                descripcion.setAttribute("Value", datos[2]);
                // Create an input element for Precio
                var precio = document.createElement("input");
                precio.setAttribute("name", "Dprecio");
                precio.setAttribute("type", "text");
                precio.setAttribute("disabled", "disabled");
                precio.setAttribute("Value", datos[3]);
                // Create an input element for Unidad
                var unidad = document.createElement("input");
                unidad.setAttribute("type", "text");
                unidad.setAttribute("name", "Dunidad");
                unidad.setAttribute("disabled", "disabled");
                unidad.setAttribute("Value", datos[4]);
                // Create an input element for id Proveedor
                var idProveedor = document.createElement("input");
                idProveedor.setAttribute("type", "text");
                idProveedor.setAttribute("name", "DidProveedor");
                idProveedor.setAttribute("disabled", "disabled");
                idProveedor.setAttribute("Value", datos[5]);
                // Create an input element for Stock
                var stock = document.createElement("input");
                stock.setAttribute("name", "Dstock");
                stock.setAttribute("disabled", "disabled");
                stock.setAttribute("value", datos[6]);
                // Create an input element for id Tipo
                var idTipo = document.createElement("input");
                idTipo.setAttribute("name", "DidTipo");
                idTipo.setAttribute("disabled", "disabled");
                idTipo.setAttribute("value", datos[6]);                
                // Create a submit button
                var s = document.createElement("input");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "eliminarProd");
                s.innerHTML = ("Eliminar");
                // Append the inputs to the form
                form.append(newlabel, id, descripcion, precio, unidad, idProveedor, stock, idTipo);
                // Append the button to the form
                form.append(s);
                document.getElementsByTagName("body")[0]
                        .appendChild(form);
            }
        </script>
    </head>
    <body style="padding-bottom: 50px">
        <div class="container"> 
            <h1>Productos</h1>        
            <table border="1" width="1" cellspacing="1" class="table table-hover" id="myTable">
                <thead>
                    <tr>
                        <th class="text-center">Id Producto</th>
                        <th class="text-center">Descripcion</th>
                        <th class="text-center">Precio</th>
                        <th class="text-center">Unidad</th>
                        <th class="text-center">Proveedor</th>
                        <th class="text-center">Stock</th>
                        <th class="text-center">Tipo</th>
                        <!--<th class="text-center">Activo</th>-->                           
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int iter = 0;
                        List<Producto> lstProducto = (List<Producto>) request.getAttribute("producto");
                        for (Producto producto : lstProducto) {
                            iter++;
                    %>
                    <tr>
                        <td class="text-center"><%=producto.getIdProducto() %></td>
                        <td class="text-center"><%=producto.getNombre()%></td>
                        <td class="text-center"><%=producto.getPrecio()%></td>
                        <td class="text-center"><%=producto.getUnidad()%></td>
                        <td class="text-center"><%=producto.getIdProveedor()%></td>
                        <td class="text-center"><%=producto.getStock()%></td>
                        <td class="text-center"><%=producto.getIdTipoProducto()%></td>
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
