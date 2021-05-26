<%@page import="modelos.Rol"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelos.Mesa"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Mesas</title>
        <script>
            function agregarFila() {
                var form = document.createElement("form");
                form.setAttribute("class", "container");
                form.setAttribute("method", "post");
                form.setAttribute("action", "contollerMantenimiento");
                
                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Agregar Fila";
                
                 // Create an input element for Area
                var area = document.createElement("select");
                area.setAttribute("name", "Aarea");
                area.setAttribute("placeholder", "Aarea");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("seleccione");
                var option1 = document.createElement("option");
                option1.setAttribute("value", "1");
                option1.innerHTML = ("Activo");
                area.appendChild(option);
                area.appendChild(option1);
                
                // Create an input element for Descripcion
                var des = document.createElement("input");
                des.setAttribute("type", "text");
                des.setAttribute("name", "Adescripcion");
                des.setAttribute("placeholder", "Descripcion");
                
                // Create an input element for Asiento
                
                var asiento = document.createElement("input");
                asiento.setAttribute("type", "text");
                asiento.setAttribute("name", "Aasiento");
                asiento.setAttribute("placeholder", "Asiento");
                
                //Create an input element for Estado
                var estado = document.createElement("select");
                estado.setAttribute("name", "Aestado");
                estado.setAttribute("placeholder", "Estado");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("seleccione");
                var option1 = document.createElement("option");
                option1.setAttribute("value", "1");
                option1.innerHTML = ("Ocupado");
                var option2 = document.createElement("option");
                option2.setAttribute("value", "0");
                option2.innerHTML = ("Disponible");
                estado.appendChild(option);
                estado.appendChild(option1);
                estado.appendChild(option2);
                
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "agregarM");
                s.innerHTML = ("Agregar");
                // Append the inputs to the form
                form.append(newlabel, area, des,asiento,estado);
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
                form.setAttribute("action", "contollerMantenimiento");
                
                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Editar Fila";
                
                var id = document.createElement("input");
                id.setAttribute("type", "hidden");
                id.setAttribute("name", "Eiduser");
                id.setAttribute("value", datos[1]);

                 // Create an input element for Area
                var area = document.createElement("select");
                area.setAttribute("name", "Earea");
                area.setAttribute("placeholder", "Area");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("seleccione");
                var option1 = document.createElement("option");
                option1.setAttribute("value", "1");
                option1.innerHTML = ("Activo");
                area.appendChild(option);
                area.appendChild(option1);
                
                // Create an input element for Descripcion
                var des = document.createElement("input");
                des.setAttribute("type", "text");
                des.setAttribute("name", "Edescripcion");
                des.setAttribute("value", datos[3]);
                
                // Create an input element for Asiento
                
                var asiento = document.createElement("input");
                asiento.setAttribute("type", "text");
                asiento.setAttribute("name", "Easiento");
                asiento.setAttribute("value", datos[4]);
                
                //Create an input element for Estado
                var estado = document.createElement("select");
                estado.setAttribute("name", "Eestado");
                estado.setAttribute("placeholder", "Estado");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("seleccione");
                var option1 = document.createElement("option");
                option1.setAttribute("value", "1");
                option1.innerHTML = ("Ocupado");
                var option2 = document.createElement("option");
                option2.setAttribute("value", "0");
                option2.innerHTML = ("Disponible");
                estado.appendChild(option);
                estado.appendChild(option1);
                estado.appendChild(option2);
                
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "editar");
                s.innerHTML = ("Editar");
                // Append the inputs to the form
                form.append(newlabel, area, des,asiento,estado);
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
                form.setAttribute("action", "contollerMantenimiento");

                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Eliminar Fila";

                var id = document.createElement("input");
                id.setAttribute("type", "hidden");
                id.setAttribute("name", "Eiduser");
                id.setAttribute("value", datos[1]);

                 // Create an input element for Area
                var area = document.createElement("select");
                area.setAttribute("name", "Earea");
                area.setAttribute("placeholder", "Area");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("seleccione");
                var option1 = document.createElement("option");
                option1.setAttribute("value", "1");
                option1.innerHTML = ("Activo");
                area.appendChild(option);
                area.appendChild(option1);
                
                // Create an input element for Descripcion
                var des = document.createElement("input");
                des.setAttribute("type", "text");
                des.setAttribute("name", "Edescripcion");
                des.setAttribute("disabled","disabled");
                des.setAttribute("value", datos[3]);
                
                // Create an input element for Asiento
                
                var asiento = document.createElement("input");
                asiento.setAttribute("type", "text");
                asiento.setAttribute("name", "Easiento");
                asiento.setAttribute("disabled","disabled");
                asiento.setAttribute("value", datos[4]);
                
                //Create an input element for Estado
                var estado = document.createElement("select");
                estado.setAttribute("name", "Eestado");
                estado.setAttribute("placeholder", "Estado");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("seleccione");
                var option1 = document.createElement("option");
                option1.setAttribute("value", "1");
                option1.innerHTML = ("Ocupado");
                var option2 = document.createElement("option");
                option2.setAttribute("value", "0");
                option2.innerHTML = ("Disponible");
                estado.appendChild(option);
                estado.appendChild(option1);
                estado.appendChild(option2);
                
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "eliminar");
                s.innerHTML = ("Eliminar");
                // Append the inputs to the form
                form.append(newlabel, area, des,asiento,estado);
                // Append the button to the form
                form.append(s);
                document.getElementsByTagName("body")[0]
                        .appendChild(form);
            }
        </script>
    </head>
    <body style="padding-bottom: 50px">
        <div class="container"> 
            <h1>Mesas</h1>        
            <table border="1" width="1" cellspacing="1" class="table table-hover" id="myTable">
                <thead>
                    <tr>
                        <th class="text-center">Id Mesa</th>
                        <%--<th class="text-center">Id Area</th>--%>
                        <th class="text-center">Descripcion</th>
                        <th class="text-center">Area</th>
                        <th class="text-center">Asientos</th>
                        <th class="text-center">Estado</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int iter = 0;
                        List<Mesa> lstMesa = (List<Mesa>) request.getAttribute("mesa");
                        for (Mesa mesa : lstMesa) {
                            iter++;
                    %>
                    <tr>
                        <td class="text-center"><%=mesa.getIdMesa()%></td>
                        <td class="text-center"><%=mesa.getIdArea()%></td>
                        <td class="text-center"><%=mesa.getDescripcion()%></td>
                        <td class="text-center"><%=mesa.getIdArea()%></td>
                        <td class="text-center"><%=mesa.getAsientos()%></td>
                        <%--<td class="text-center"><%=mesa.getUser()%></td>--%>
                        <% if (mesa.getIdEstado() == 1) { %>
                        <td class="text-center">Activo</td>
                        <%} else {%>
                        <td class="text-center">Inactivo</td>
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
