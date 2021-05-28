<%@page import="modelos.Area"%>
<%@page import="modelos.Rol"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Areas</title>
        <script>
            function agregarFila() {
                var form = document.createElement("form");
                form.setAttribute("class", "container");
                form.setAttribute("action", "controllerMantenimiento");
                form.setAttribute("method", "POST");
                
                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Agregar Fila";
                
                // Create an input element for Nombre
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "Aarea");
                name.setAttribute("placeholder", "Nombre del Area");
                // Create an input element for Activo
                var active = document.createElement("select");
                active.setAttribute("name", "Aactivo");
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
                s.setAttribute("value", "agregarA");
                s.innerHTML = ("Agregar");
                
                // Append the inputs to the form
                form.append(newlabel, name, active);
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
                id.setAttribute("name", "Eidarea");
                id.setAttribute("value", datos[1]);

                // Create an input element for Nombre
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "Earea");
                name.setAttribute("Value", datos[2]);
                // Create an input element for Activo
                var active = document.createElement("select");
                active.setAttribute("name", "Eactivo");
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
                s.setAttribute("value", "editarA");
                s.innerHTML = ("Editar");
                // Append the inputs to the form
                form.append(newlabel, id, name, active);
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
                id.setAttribute("name", "Didarea");
                id.setAttribute("value", datos[1]);

                // Create an input element for Nombre
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "Darea");
                name.setAttribute("disabled", "disabled");
                name.setAttribute("Value", datos[2]);
                // Create an input element for Activo
                var active = document.createElement("input");
                active.setAttribute("type", "text");
                active.setAttribute("name", "Dactivo");
                active.setAttribute("disabled", "disabled");
                active.setAttribute("Value", datos[3]);
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "eliminarA");
                s.innerHTML = ("Eliminar");
                // Append the inputs to the form
                form.append(newlabel, id, name, active);
                // Append the button to the form
                form.append(s);
                document.getElementsByTagName("body")[0]
                        .appendChild(form);
            }
        </script>
    </head>
    <body style="padding-bottom: 50px">
        <div class="container"> 
            <h1>Areas</h1>        
            <table border="1" width="1" cellspacing="1" class="table table-hover" id="myTable">
                <thead>
                    <tr>
                        <th class="text-center">Id Area</th>
                        <th class="text-center">Area</th>
                        <th class="text-center">Estado</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int iter = 0;
                        List<Area> lstArea = (List<Area>) request.getAttribute("area");
                        for (Area area : lstArea) {
                            iter++;
                    %>
                    <tr>
                        <td class="text-center"><%=area.getIdArea()%></td>
                        <td class="text-center"><%=area.getNombre()%></td>
                        <% if (area.getEstado() == 1) { %>
                        <td class="text-center">Disponible</td>
                        <%} else if(area.getEstado() == 2){%>
                        <td class="text-center">Mantenimiento</td>
                        <%}else if(area.getEstado() == 0){%>
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
