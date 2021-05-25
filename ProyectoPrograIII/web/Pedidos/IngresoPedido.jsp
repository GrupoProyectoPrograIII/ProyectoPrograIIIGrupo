<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar Pedido</title>
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
                var col2 = document.createElement("td");
                col2.innerHTML = element2;
                var col3 = document.createElement("td");
                col3.innerHTML = element3;
                var col4 = document.createElement("td");
                col4.innerHTML = element4;
                tabla.append(no, col1, col2, col3, col4);

            }

            function eliminarFila() {
                var table = document.getElementById("tablaprueba");
                var rowCount = table.rows.length;
                //console.log(rowCount);

                if (rowCount <= 1)
                    alert('No se puede eliminar el encabezado');
                else
                    table.deleteRow(rowCount - 2);
            }
            $(document).ready(function () {
                $('#producto').on('change', function () {
                    verProducto(this.value);
                });
            });
            function verProducto(d) {
                cliente = d.split(',');
                document.getElementById("precio").value = cliente[2];
                console.log(d);
                //console.log(cliente[0] + cliente[1]);
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
                console.log(total);
                document.getElementById("totalQ").value = total;
                $("#totalQ").text(total);
            }
        </script>
    </head>
    <body>
        <div class="container">            
            <h1>Ingreso de nuevo Pedido</h1>
            <form id="form-work" name="form-work" action="ControllerPedido" method="get">
                <div class="form-group" >
                    <%

                    %>
                    <label>Cliente</label><br>
                    <div>
                        <form name="" action="controllerPedido" method="get">    
                            <select name="clienteNit" id="clienteNit">
                                <option disabled selected>Seleccione Uno</option>

                                <option name="nit" value=""></option>

                            </select>
                            <label>Nombre Apellido </label>
                            <input name="clienteNombre" id="clienteNombre" type="text">
                            <label> Telefono </label> 
                            <input name="telefono" id="telefono" type="text">
                            <label> Direccion</label> 
                            <input name="direccion" id="direccion" type="text">
                            <br><br>
                            </div>
                            <div class="row">
                                <button type="button" class="btn btn-primary mr-2" onclick="agregarFila()">Agregar</button>
                                <input type="text" id="nofila" hidden="true" value="1">
                                <select id="producto"><option selected ="selected" disabled="true" >Seleccione</option><option value="1,prueba,1.00">prueba</option><option value="2,testing,2.50">Testing</option></select>
                                <input type="text" id="precio" value="0.00" disabled="true">
                                <input type="number" id="cantidad" style="width: 60px; height: 26px">
                                <input type="text" id="totalQ" value="0.00">
                                <button type="button" class="btn btn-danger mr-2" onclick="eliminarFila()">Eliminar Ultima Fila</button>
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
                                    <button id="accion" name="accion" value="create" class="btn btn-success btn-lg" type="submit">Aceptar</button>                    
                                </div>
                            </div>

                    </div>
            </form>
    </body>
</html>
