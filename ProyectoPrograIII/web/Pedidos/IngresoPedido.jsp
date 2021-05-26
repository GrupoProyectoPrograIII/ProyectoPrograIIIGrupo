<%@page import="modelos.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar Pedido</title>
        <%
            List<Cliente> lstCliente = (List) request.getAttribute("lstCliente");
        %>
        <script>
            function agregarFila() {
                var tabla = document.getElementById("tablaprueba").insertRow(1);
                var nofila = (document.getElementById("nofila").value)++;
                var element1 = document.getElementById("producto").value;
                var element2 = document.getElementById("precio").value;
                var element3 = document.getElementById("cantidad").value;
                var element4 = document.getElementById("totalQ").value;

                //Primera Columna, que lleva el numero de fila
                var no = document.createElement("td");
                no.setAttribute("type", "text");
                no.setAttribute("class", "text-center");
                no.innerHTML = (nofila.valueOf());
                // Create an input element for Combo
                var col1 = document.createElement("td");
                prod = element1.split(',');
                col1.innerHTML = prod[1];
                // Create an input element for Precio
                var col2 = document.createElement("td");
                col2.innerHTML = "Q" + element2;
                //Create an input element for Cantidad
                var col3 = document.createElement("td");
                col3.innerHTML = element3;
                // Create an input element for precio c/cantidad
                var col4 = document.createElement("td");
                col4.setAttribute("id", "valorColumna");
                col4.innerHTML = element4;
                tabla.append(no, col1, col2, col3, col4);

            }

            function eliminarFila() {
                var table = document.getElementById("tablaprueba");
                var rowCount = table.rows.length;
                var nofila = (document.getElementById("nofila").value)--;

                console.log('row' + rowCount);
                if (rowCount <= 2)
                    alert('No hay filas para eliminar');
                else
                    table.deleteRow(1);
            }

            $(document).ready(function () {
                $('#producto').on('change', function () {
                    verProducto(this.value);
                });
            });

            function verProducto(d) {
                cliente = d.split(',');
                document.getElementById("precio").value = cliente[2];
                $("#precio").text(cliente[2]);
            }

            $(document).ready(function () {
                $('#producto').on('change', function () {
                    $('#cantidad').on('change', function () {
                        multiplicacion(this.value);
                    });
                });
            });

            function multiplicacion(e) {
                cantidadA = e;
                cantidadB = document.getElementById("precio").value;
                total = cantidadA * cantidadB;
                document.getElementById("totalQ").value = total;
                $("#totalQ").text(total);
            }

            function totalOrden() {
                //getsTable
                var oTable = document.getElementById('tablaprueba');
                //gets rows of table
                var rowLength = oTable.rows.length;
                //loops through rows    

                var suma = 0;

                for (var i = 1; i < rowLength - 1; i++) {
                    //gets cells of current row  
                    var oCells = oTable.rows.item(i).cells;
                    //gets amount of cells of current row
                    var cellLength = oCells.length;
                    var cellVal = (oCells.item(cellLength - 1).innerHTML);
                    console.log(cellVal);

                    suma = Number(cellVal) + Number(suma);
                }
                console.log("Suma " + suma);
                document.getElementById("totalOrden").value = suma;
                $('#totalOrden').text('Q' + suma);
            }

            $(document).ready(function () {
                $('#opcionCliente').on('change', function () {
                    clientes(this.value);
                });
            });
            function clientes(client) {
                
                var element1 = document.getElementById("opcionCliente").value;
                console.log(element1);
            <%
                for (Cliente cliente : lstCliente) {%>
                if (client === '<%=cliente.getNombre()%>') {
                    document.getElementById("clienteNombre").value = '<%=cliente.getNickname()%>';
                    $('#clienteNombre').text('<%=cliente.getNickname()%>');
                    document.getElementById("telefono").value = '<%=cliente.getTelefono()%>';
                    $('#telefono').text('<%=cliente.getTelefono()%>');
                    document.getElementById("direccion").value = '<%=cliente.getDireccion()%>';
                    $('#direccion').text('<%=cliente.getDireccion()%>');
                    document.getElementById("nit").value = '<%=cliente.getNit()%>';
                    $('#nit').text('<%=cliente.getNit()%>');
                }
            <%}%>
            }
        </script>
    </head>
    <body>
        <div class="container">            
            <h1>Ingreso de nuevo Pedido en <%=request.getParameter("mesa")%> </h1>
            <form id="form-work" name="form-work" action="controllerPedido" method="post">
                <div class="form-group" >

                    <br>
                    <label>Cliente</label>
                    <select name="opcionCliente" id="opcionCliente">
                        <option selected ="selected" disabled="true">Seleccione</option>
                        <%for (Cliente cliente : lstCliente) {%>
                        <option value="<%=cliente.getNombre()%>"><%=cliente.getNombre()%></option>
                        <%}%>
                    </select><br><br>
                    <label>Nombre</label>
                    <input name="clienteNombre" id="clienteNombre" type="text">
                    <label> Telefono </label> 
                    <input name="telefono" id="telefono" type="text">
                    <label> Direccion</label> 
                    <input name="direccion" id="direccion" type="text">
                    <label> Nit</label> 
                    <input name="nit" id="nit" type="text">
                    <br><br>
                    
                    <button type="button" class="btn btn-primary mr-2" onclick="agregarFila(); totalOrden()">Agregar</button>
                    <input type="text" id="nofila" hidden="true" value="1">
                    <select id="producto"><option selected ="selected" disabled="true" >Seleccione</option><option value="1,prueba,1.00">prueba</option><option value="2,testing,2.50">Testing</option></select>
                    <input type="text" id="precio" value="0.00" disabled="true">
                    <input type="number" id="cantidad" style="width: 60px; height: 26px">
                    <input type="text" id="totalQ" value="0.00" disabled="true">
                    <button type="button" class="btn btn-danger mr-2" onclick="eliminarFila();totalOrden()">Eliminar Ultima Fila</button>
                    <br><br>
                    <div class="row">

                        <table border="1" class="table" id="tablaprueba">
                            <thead class="thead-dark">
                                <tr>
                                    <th>No</th>
                                    <th>Producto</th>
                                    <th>Precio</th>
                                    <th>Cantidad</th>
                                    <th>Total Q</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td> 
                                    <td id="totalOrden">Q0.00</td>
                                </tr>
                            </tbody>
                        </table>

                        <!-- -------------------------------------------------- -->

                        <div class="col-md-3">
                            <button id="accion" name="accion" value="editarSM" class="btn btn-success btn-lg" type="submit">Aceptar</button>                    
                        </div>
                    </div>

                </div>
            </form>
    </body>
</html>
