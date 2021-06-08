<%@page import="modelos.Pedido"%>
<%@page import="modelos.DetallePedido"%>
<%@page import="java.util.ArrayList"%>
<%@page import="modelos.Despacho"%>
<%@page import="modelos.ProductoCombo"%>
<%@page import="modelos.Cliente"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla.jsp"/>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar Pedido</title>
        <%
            List<Cliente> lstCliente = (List) request.getAttribute("lstCliente");
            String mesas = request.getParameter("mesa"), areas = request.getParameter("area");
        %>
        <script>

            $(document).ready(function () {
                $('#producto').on('change', function () {
                    verProducto(this.value);
                });
            });
            function verProducto(d) {
                cliente = d.split(',');
                precio = Math.round(cliente[2] * 100) / 100;
                document.getElementById("precio").value = precio;
                $("#precio").text(precio);
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
                total = Math.round(total * 100) / 100;
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
                suma = Math.round(suma * 100) / 100;
                document.getElementById("totalOrden").value = suma;
                $('#totalOrden').text('Q' + suma);
            }

            $(document).ready(function () {
                $('#opcionCliente').on('change', function () {
                    clientes(this.value);
                });
            });
            function clientes(client) {
                //var element1 = document.getElementById("opcionCliente").value;
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
            <h1>Ingreso de nuevo Pedido en <%=mesas%> en <%=areas%> </h1>
            <h3>Mesero de pedido: <%= request.getAttribute("user")%></h3>
            <form id="form-work" name="form-work" action="controllerPedido" method="post">
                <div class="form-group" >

                    <br>
                    <label>Cliente</label>
                    <select id="opcionCliente">
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

                    <button type="submit" class="btn btn-primary mr-2" name="accion" value="editarDp">Agregar</button>
                    <input type="text" id="nofila" hidden="true" value="1">

                    <select id="producto"><option selected ="selected" disabled="true" >Seleccione</option>
                        <%
                            List<ProductoCombo> lstProductoCombo = (List<ProductoCombo>) request.getAttribute("lstProductoCombo");
                            for (ProductoCombo pc : lstProductoCombo) {
                        %>
                        <option value="<%=pc.getIdCombo()%>,<%=pc.getNombre()%>,<%=pc.getPrecio()%>"><%=pc.getNombre()%></option>
                        <%
                            }
                        %>
                    </select>

                    <input type="text" id="precio" value="0.00" disabled="true">
                    <input type="number" id="cantidad" style="width: 60px; height: 26px">
                    <input type="text" id="totalQ" value="0.00" disabled="true">
                    <br><br>
                    <div class="row">

                        <table border="1" class="table table-hover" id="tablaprueba">
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
                                <%
                                    List<DetallePedido> lstDp = (List<DetallePedido>) request.getAttribute("lstDp");
                                    List<Pedido> lstPedido = (List<Pedido>) request.getAttribute("lstPedido");
                                    for (Pedido p : lstPedido) {
                                        for (DetallePedido dp : lstDp) {
                                            if(dp.getIdPedido()==p.getIdPedido())
                                %>
                                <tr>
                                    <td><%=dp.getIdDetalle()%></td>
                                    <td><%=dp.getIdPedido()%></td>
                                    <td><%=dp.getCombo()%></td>
                                    <td><%=dp.getCantidad()%></td>
                                    <td><%=dp.getPrecio()%></td>
                                    <td>test</td>
                                </tr> 
                                <%}
                                    }
                                %>
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
                            <button id="accion" name="accion" value="editarSM" class="btn btn-success btn-group-lg" type="submit">Aceptar</button>                    
                        </div>
                    </div>

                </div>
            </form>
    </body>
</html>
