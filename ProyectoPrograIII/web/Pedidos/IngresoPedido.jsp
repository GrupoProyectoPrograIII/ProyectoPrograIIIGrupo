<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar Pedido</title>
        <script>
            $(document).ready(function () {
                $('#clienteNit').on('change', function () {
                    verClientes(this.value);
                });
            });
            function verClientes(a) {
                cliente = a.split(',');
                document.getElementById("clienteNombre").value = cliente[1] + ' ' + cliente[2];
                document.getElementById("telefono").value = cliente[3];
                document.getElementById("direccion").value = cliente[4];
            }
            $(document).ready(function () {
                $('#departamento').on('change', function () {
                    verMunicipios(this.value);
                });
            });
            function verMunicipios(b) {
                console.log(b);

                select = document.getElementById('municipio1');
                document.getElementById('municipio1').innerText = null;
                Array.from(document.querySelector("#municipio").options).forEach(function (option_element) {
                    let option_text = option_element.text;
                    let option_value = option_element.value.split(',');
                    console.log(option_value[1]);

                    if (b === option_value[1]) {
                        opcion = new Option(option_text, option_value[0]);

                        select.appendChild(opcion);
                        console.log(option_value[0], option_text);
                    }
                });
            }
            $(document).ready(function () {
                $('#producto').on('change', function () {
                    verProducto(this.value);
                });
            });
            function verProducto(d) {
                cliente = d.split(',');
                document.getElementById("precio").value = cliente[1];
                console.log(cliente[1]);
                $("#precio").text(cliente[1]);
            }
            $(document).ready(function () {
                $('#cantidad').on('change', function () {
                    multiplicacion(this.value);

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

            function agregarFila() {
                var tabla = document.getElementById("tablaprueba").insertRow(2);
                //Primera Columna, que lleva el numero de fila
                var no = document.createElement("td");
                no.setAttribute("type", "text");
                no.setAttribute("class", "text-center");
                no.innerHTML = (1);
                
                // Create an input element for Combo
                var col1 = document.createElement("td");
                var name = document.createElement("select");
                name.setAttribute("id", "producto");
                name.setAttribute("name", "combo");
                var option = document.createElement("option");
                option.setAttribute("Value","1,2.5");
                option.innerHTML = ("Prueba");
                var option2 = document.createElement("option");
                option2.setAttribute("Value","1,2.5");
                option2.innerHTML = ("Prueba");
                
                name.appendChild(option);
                name.appendChild(option2);
                col1.appendChild(name);

                //Para mostrar el precio del producto
                var col2 = document.createElement("td");
                col2.getAttribute("class","text-center");
                col2.setAttribute("id", "precio");
                col2.innerHTML = ("Q1.00");
                
                var col3 = document.createElement("td");
                // Create an input element for Cantidad
                var path = document.createElement("input");
                path.setAttribute("type", "number");
                path.setAttribute("id", "cantidad");
                col3.appendChild(path);
                
                var col4 = document.createElement("td");
                col4.setAttribute("id", "totalQ");
                col4.setAttribute("class", "text-center");
                var col5 = document.createElement("td");
                col5.setAttribute("class", "text-center");
                // Create an input element for Orden
                var orden = document.createElement("button");
                orden.setAttribute("type", "button");
                orden.setAttribute("class", "btn btn-danger");
                orden.setAttribute("onclick", "eliminarFila()");
                orden.innerHTML = ("Eliminar");
                col5.appendChild(orden);
                
                tabla.append(no, col1, col2, col3, col4, col5);
            }
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
                        </form>
                    </div>
                    <div class="row">
                        <button type="button" class="btn btn-primary mr-2" onclick="agregarFila()">Agregar</button>
                        <table border="1" class="table" id="tablaprueba">
                            <thead class="thead-dark">
                                <tr>
                                    <th>No</th>
                                    <th>Producto</th>
                                    <th>Precio</th>
                                    <th>Cantidad</th>
                                    <th>Total Q</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="text-center">1</td>
                                    <td class="text-center"><select id="producto"><option value="1,1.00">prueba</option><option value="1,2.50">prueba</option></select></td>
                                    <td class="text-center" id="precio">Q0.00</td>
                                    <td><input type="number" id="cantidad" style="width: 60px; height: 26px"></td> 
                                    <td class="text-center" id="totalQ"></td>
                                    <td class="text-center"></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td> 
                                    <td>Q0.00</td>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>

                        <!-- -------------------------------------------------- -->
                        <br><br>
                        <label>Departamento</label><br>
                        <select name="departamento" id="departamento">
                            <option disabled selected>Seleccione Uno</option>

                            <option value=""></option>

                        </select><br><br>

                        <label>Municipio</label><br>
                        <select type="hidden" name="municipio" id="municipio" style="display: none">

                            <option></option>

                        </select>

                        <select name="municipio1" id="municipio1">

                            <option disabled selected></option>

                        </select><br><br>



                        <label>Tipo Cambio(Q a $):</label><br><input id="cambio" type="text" value="">
                        <br>
                        <!--<label>Total (en Q):</label><br><input id="totalQs" value="0.00"></label><br>
                        <label>Total (en $):</label><br><input id="totalUsds" value="0.00"><br><br>-->
                        <div class="col-md-3">
                            <button id="accion" name="accion" value="create" class="btn btn-success btn-lg" type="submit">Aceptar</button>                    
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
