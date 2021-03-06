<%@page import="modelos.Area"%>
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
                form.setAttribute("action", "controllerMantenimiento");
                
                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Agregar Fila";
                
                 // Create an input element for Area
                var area = document.createElement("select");
                area.setAttribute("name", "Aarea");
                area.setAttribute("placeholder", "Aarea");
                var option = document.createElement("option");
                option.setAttribute("disabled", "true");
                option.setAttribute("selected", "true");
                option.innerHTML = ("seleccione");
                area.appendChild(option);
                <% 
                    List<Area> lstArea= (List<Area>)request.getAttribute("lstArea");
                    for(Area area: lstArea){
                %>
                var option1 = document.createElement("option");
                option1.setAttribute("value", <%=area.getIdArea()%>);
                option1.innerHTML = ("<%=area.getNombre()%>");
                area.appendChild(option1);
                <%}%>
                // Create an input element for Mesa
                var mesa = document.createElement("input");
                mesa.setAttribute("type", "text");
                mesa.setAttribute("name", "Amesa");
                mesa.setAttribute("placeholder", "Descripcion");
                
                // Create an input element for Asiento
                
                var asiento = document.createElement("input");
                asiento.setAttribute("type", "text");
                asiento.setAttribute("name", "Aasiento");
                asiento.setAttribute("placeholder", "Asiento");
                
                // Create an input element for Activo
                var active = document.createElement("select");
                active.setAttribute("name", "Aactivo");
                var option = document.createElement("option");
                option.setAttribute("disabled", "true");
                option.setAttribute("selected", "true");
                option.innerHTML = ("seleccione");
                var option1 = document.createElement("option");
                option1.setAttribute("value", "1");
                option1.innerHTML = ("Disponible");
                var option2 = document.createElement("option");
                option2.setAttribute("value", "2");
                option2.innerHTML = ("Limpieza");
                var option3 = document.createElement("option");
                option3.setAttribute("value", "0");
                option3.innerHTML = ("Ocupado");
                active.appendChild(option);
                active.appendChild(option1);
                active.appendChild(option2);
                active.appendChild(option3);
                
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "agregarM");
                s.innerHTML = ("Agregar");
                // Append the inputs to the form
                form.append(newlabel, mesa,area,asiento,active);
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
                id.setAttribute("name", "Eidmesa");
                id.setAttribute("value", datos[1]);

                 // Create an input element for Area
                var area = document.createElement("select");
                area.setAttribute("name", "Earea");
                area.setAttribute("placeholder", "Area");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("seleccione");
                 area.appendChild(option);
                <% 
                    lstArea= (List<Area>)request.getAttribute("lstArea");
                    for(Area area: lstArea){
                %>
                var option1 = document.createElement("option");
                option1.setAttribute("value", <%=area.getIdArea()%>);
                option1.innerHTML = ("<%=area.getNombre()%>");
                area.appendChild(option1);
                <%}%>
                
                // Create an input element for Mesa
                var mesa = document.createElement("input");
                mesa.setAttribute("type", "text");
                mesa.setAttribute("name", "Edescripcion");
                mesa.setAttribute("value", datos[2]);
                
                // Create an input element for Asiento
                
                var asiento = document.createElement("input");
                asiento.setAttribute("type", "text");
                asiento.setAttribute("name", "Easiento");
                asiento.setAttribute("value", datos[4]);
                
                //Create an input element for Activo
                var active = document.createElement("select");
                active.setAttribute("name", "Eestado");
                active.setAttribute("placeholder", "Estado");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("seleccione");
                var option1 = document.createElement("option");
                option1.setAttribute("value", "1");
                option1.innerHTML = ("Disponible");
                var option2 = document.createElement("option");
                option2.setAttribute("value", "2");
                option2.innerHTML = ("Limpieza");
                var option3 = document.createElement("option");
                option3.setAttribute("value", "0");
                option3.innerHTML = ("Ocupado");
                active.appendChild(option);
                active.appendChild(option1);
                active.appendChild(option2);
                active.appendChild(option3);
                
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "editarM");
                s.innerHTML = ("Editar");
                // Append the inputs to the form
                form.append(newlabel, id,mesa,area,asiento,active);
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
                id.setAttribute("name", "Eidmesa");
                id.setAttribute("value", datos[1]);

                 // Create an input element for Area
                var area = document.createElement("input");
                area.setAttribute("type", "text");
                area.setAttribute("name", "Darea");
                area.setAttribute("disabled","disabled");
                area.setAttribute("value", datos[2]);
                
                // Create an input element for Mesa
                var mesa = document.createElement("input");
                mesa.setAttribute("type", "text");
                mesa.setAttribute("name", "Ddescripcion");
                mesa.setAttribute("disabled","disabled");
                mesa.setAttribute("value", datos[3]);
                
                // Create an input element for Asiento
                
                var asiento = document.createElement("input");
                asiento.setAttribute("type", "text");
                asiento.setAttribute("name", "Dasiento");
                asiento.setAttribute("disabled","disabled");
                asiento.setAttribute("value", datos[4]);
                
                var active = document.createElement("input");
                active.setAttribute("type", "text");
                active.setAttribute("name", "Dactivo");
                active.setAttribute("disabled","disabled");
                active.setAttribute("value", datos[5]);
                
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "eliminarM");
                s.innerHTML = ("Eliminar");
                // Append the inputs to the form
                form.append(newlabel, id,mesa,area,asiento,active);
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
                        <th class="text-center">Nombre</th>
                        <th class="text-center">Area Ubicada</th>
                        <th class="text-center">Asientos</th>
                        <th class="text-center">Estado</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    
                    <%
                        int iter = 0;
                        List<Mesa> lstMesa = (List<Mesa>) request.getAttribute("lstMesa");
                        for (Mesa mesa : lstMesa) {
                            iter++;
                    %>
                    
                    <tr>
                        <td class="text-center"><%=mesa.getIdMesa()%></td>
                        <%--<td class="text-center"><%=mesa.getIdArea()%></td>--%>                        
                        <td class="text-center"><%=mesa.getMesa()%></td>
                        <td class="text-center"><%=mesa.getArea()%></td>
                        <td class="text-center"><%=mesa.getAsientos()%></td>
                        <% if (mesa.getIdEstado() == 1) { %>
                        <td class="text-center">Disponible</td>
                        <%} else if(mesa.getIdEstado() == 2){%>
                        <td class="text-center">Mantenimiento</td>
                        <%}else if(mesa.getIdEstado() == 0){%>
                        <td class="text-center">Ocupado</td>
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
