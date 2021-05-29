<%@page import="modelos.Producto"%>
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
                
                <%
                    List<Producto> lstProducto = (List<Producto>)request.getAttribute("lstProducto");
                    //List<TipoProducto> lstTipoProducto =(List<TipoProducto>)request.getAttribute("lstTipoCombo");
                    
                %>
                
                // Create an input element for Tipo Combo
                var tc = document.createElement("select");
                tc.setAttribute("name", "Atc");
                tc.setAttribute("placeholder", "Activo");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("Tipo Combo");
                var option1 = document.createElement("option");
                option1.setAttribute("value", "0");
                option1.innerHTML = ("Desayuno");
                var option2 = document.createElement("option");
                option2.setAttribute("value", "1");
                option2.innerHTML = ("Almuerzo");
                var option3 = document.createElement("option");
                option3.setAttribute("value", "2");
                option3.innerHTML = ("Cena");
                var option4 = document.createElement("option");
                option4.setAttribute("value", "0");
                option4.innerHTML = ("Refaccion");
                tc.appendChild(option);
                tc.appendChild(option1);
                tc.appendChild(option2);
                tc.appendChild(option3);
                tc.appendChild(option4);
                
                // Create an input element for Descripcion(primer producto)
                
                var desc1 = document.createElement("select");
                desc1.setAttribute("name", "Adesc1");
                desc1.setAttribute("placeholder", "Activo");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("Descripcion 1");
                desc1.appendChild(option);
                <%
                    for(Producto producto:lstProducto){
                %>
                var option1 = document.createElement("option");
                option1.setAttribute("value", "<%=producto.getNombre() %>");
                option1.innerHTML = ("<%=producto.getNombre()%>");
                desc1.appendChild(option1);
                <%}%>
                
                // Create an input element for Descripcion(Segundo Producto)
                var desc2 = document.createElement("select");
                desc2.setAttribute("name", "Adesc2");
                desc2.setAttribute("placeholder", "Activo");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("Descripcion 2");
                desc2.appendChild(option);
                <%
                    for(Producto producto:lstProducto){
                %>
                var option1 = document.createElement("option");
                option1.setAttribute("value", "<%=producto.getIdProducto() %>");
                option1.innerHTML = ("<%=producto.getNombre()%>");
                desc2.appendChild(option1);
                <%}%>
                // Create an input element for precio
                var precio = document.createElement("input");
                precio.setAttribute("type", "text");
                precio.setAttribute("name", "Aprecio");
                precio.setAttribute("placeholder", "Precio");
                
                // Create an input element for Estado
                var estado = document.createElement("select");
                estado.setAttribute("name", "Aestado");
                estado.setAttribute("placeholder", "Activo");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("Estado");
                var option1 = document.createElement("option");
                option1.setAttribute("value", "1");
                option1.innerHTML = ("Disponible");
                var option2 = document.createElement("option");
                option2.setAttribute("value", "0");
                option2.innerHTML = ("Agotado");
                estado.appendChild(option);
                estado.appendChild(option1);
                estado.appendChild(option2);
                
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "agregarPC");
                s.innerHTML = ("Agregar");
                // Append the inputs to the form
                form.append(newlabel, tc, name, desc1, desc2, precio, estado);
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
                id.setAttribute("name", "Eidpc");
                id.setAttribute("value", datos[1]);

                // Create an input element for Tipo Combo
                var tc = document.createElement("select");
                tc.setAttribute("name", "Etc");
                tc.setAttribute("placeholder", "Activo");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("Tipo Combo");
                var option1 = document.createElement("option");
                option1.setAttribute("value", "0");
                option1.innerHTML = ("Desayuno");
                var option2 = document.createElement("option");
                option2.setAttribute("value", "1");
                option2.innerHTML = ("Almuerzo");
                var option3 = document.createElement("option");
                option3.setAttribute("value", "2");
                option3.innerHTML = ("Cena");
                var option4 = document.createElement("option");
                option4.setAttribute("value", "0");
                option4.innerHTML = ("Refaccion");
                tc.appendChild(option);
                tc.appendChild(option1);
                tc.appendChild(option2);
                tc.appendChild(option3);
                tc.appendChild(option4);
                
                // Create an input element for Descripcion(primer producto)
                
                var desc1 = document.createElement("select");
                desc1.setAttribute("name", "Edesc1");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("Descripcion 1");
                desc1.appendChild(option);
                <%
                    for(Producto producto:lstProducto){
                %>
                var option1 = document.createElement("option");
                option1.setAttribute("value", "<%=producto.getNombre() %>");
                option1.innerHTML = ("<%=producto.getNombre()%>");
                desc1.appendChild(option1);
                <%}%>
                
                // Create an input element for Descripcion(Segundo Producto)
                var desc2 = document.createElement("select");
                desc2.setAttribute("name", "Edesc2");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("Descripcion 2");
                desc2.appendChild(option);
                <%
                    for(Producto producto:lstProducto){
                %>
                var option1 = document.createElement("option");
                option1.setAttribute("value", "<%=producto.getNombre() %>");
                option1.innerHTML = ("<%=producto.getNombre()%>");
                desc2.appendChild(option1);
                <%}%>
                
                // Create an input element for precio
                var precio = document.createElement("input");
                precio.setAttribute("type", "text");
                precio.setAttribute("name", "Eprecio");
                precio.setAttribute("value", datos[4]);
                
                // Create an input element for Estado
                var estado = document.createElement("select");
                estado.setAttribute("name", "Eestado");
                estado.setAttribute("placeholder", "Activo");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("Estado");
                var option1 = document.createElement("option");
                option1.setAttribute("value", "1");
                option1.innerHTML = ("Disponible");
                var option2 = document.createElement("option");
                option2.setAttribute("value", "0");
                option2.innerHTML = ("Agotado");
                estado.appendChild(option);
                estado.appendChild(option1);
                estado.appendChild(option2);
                
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "editarPC");
                s.innerHTML = ("Editar");
                // Append the inputs to the form
                form.append(newlabel, id, tc, name, desc1, desc2, precio, estado);
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
                id.setAttribute("name", "Didpc");
                id.setAttribute("value", datos[1]);

                // Create an input element for Tipo Combo
                var tc = document.createElement("input");
                tc.setAttribute("type", "text");
                tc.setAttribute("name", "Dtc");
                tc.setAttribute("disabled", "disabled");
                tc.setAttribute("Value", datos[2]);
                // Create an input element for Descripcion
                var des = document.createElement("input");
                des.setAttribute("name", "Ddescripcion");
                des.setAttribute("type", "text");
                des.setAttribute("disabled", "disabled");
                des.setAttribute("Value", datos[3]);
                // Create an input element for Precio
                var precio = document.createElement("input");
                precio.setAttribute("type", "text");
                precio.setAttribute("name", "Dprecio");
                precio.setAttribute("disabled", "disabled");
                precio.setAttribute("Value", datos[4]);
                // Create an input element for Estado
                var estado = document.createElement("input");
                estado.setAttribute("type", "text");
                estado.setAttribute("name", "Destado");
                estado.setAttribute("disabled", "disabled");
                estado.setAttribute("Value", datos[5]);
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "eliminarPC");
                s.innerHTML = ("Eliminar");
                // Append the inputs to the form
                form.append(newlabel, id, tc, name, des, precio, estado);
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
                        <th class="text-center">Tipo Combo</th>
                        <th class="text-center">Descripcion</th>
                        <th class="text-center">Precio</th>
                        <th class="text-center">Estado</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int iter = 0;
                        List<ProductoCombo> lstProductoCombo = (List<ProductoCombo>) request.getAttribute("lstProductoCombo");
                        for (ProductoCombo productoCombo : lstProductoCombo) {
                            iter++;
                    %>
                    <tr>
                        
                        <td class="text-center"><%=productoCombo.getIdCombo()%></td>
                        <% if (productoCombo.getIdTipoCombo() == 0) { %>
                        <td class="text-center">Desayuno</td>
                        <%} else if(productoCombo.getIdTipoCombo() == 1){%>
                        <td class="text-center">Almuerzo</td>
                        <%}else if(productoCombo.getIdTipoCombo() == 2){%>
                        <td class="text-center">Cena</td>
                        <%}else if(productoCombo.getIdTipoCombo() == 3){%>
                        <td class="text-center">Refaccion</td>
                        <%}%>
                        
                        <td class="text-center"><%=productoCombo.getNombre()%></td>
                        <td class="text-center"><%=productoCombo.getPrecio()%></td>  
                        <% if(productoCombo.getEstado()==1){ %>
                        <td class="text-center">Disponible</td>
                        <%}else if(productoCombo.getEstado()==0 ){%>
                        <td class="text-center">Agotado</td>                
                       <%}%>
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
