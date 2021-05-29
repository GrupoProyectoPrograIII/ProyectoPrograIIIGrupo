<%@page import="java.util.List"%>
<%@page import="modelos.Rol"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<jsp:include page="../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Roles</title>
        <script>
            function agregarFila() {
                var form = document.createElement("form");
                form.setAttribute("class", "container");
                form.setAttribute("method", "post");
                form.setAttribute("action", "controllerSeguridad");
                form.setAttribute("autocomplete", "off");

                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Agregar Fila";

                // Create an input element for Nombre
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "Anombre");
                name.setAttribute("placeholder", "Nombre");
                // Create an input element for Descripcion
                var des = document.createElement("input");
                des.setAttribute("type", "text");
                des.setAttribute("name", "Adescripcion");
                des.setAttribute("placeholder", "Descripcion");

                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "agregarR");
                s.innerHTML = ("Agregar");

                // Append the inputs to the form
                form.append(newlabel, name, des);
                // Append the button to the form
                form.append(s);

                document.getElementsByTagName("body")[0]
                        .appendChild(form);
                //document.getElementById("tablaprueba").insertRow(-1).innerHTML = '<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><a class="btn btn-warning" href="ControllerUsuario?accion=editar&id=">Editar</a><button type="button" class="btn btn-danger" onclick="eliminarFila()">Eliminar Fila</button></td>';
            }

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

                        console.log("CellVal:" + cellVal);
                    }
                    datos = cellVal.split(',');
                }

                        var form = document.createElement("form");
                        form.setAttribute("class", "container");
                        form.setAttribute("method", "post");
                        form.setAttribute("action", "controllerSeguridad");
                        form.setAttribute("autocomplete", "off");

                        var newlabel = document.createElement("h1");
                        newlabel.setAttribute("type", "text");
                        newlabel.innerHTML = "Editar Fila";

                        var id = document.createElement("input");
                        id.setAttribute("type", "hidden");
                        id.setAttribute("name", "Eidrol");
                        id.setAttribute("Value", datos[1]);

                        // Create an input element for Nombre
                        var name = document.createElement("input");
                        name.setAttribute("type", "text");
                        name.setAttribute("name", "Enombre");
                        name.setAttribute("Value", datos[2]);
                        // Create an input element for Descripcion
                        var des = document.createElement("input");
                        des.setAttribute("type", "text");
                        des.setAttribute("name", "Edescripcion");
                        des.setAttribute("value", datos[3]);
                        
                        // Create a submit button
                        var s = document.createElement("button");
                        s.setAttribute("type", "submit");
                        s.setAttribute("name", "accion");
                        s.setAttribute("value", "editarR");
                        s.innerHTML = ("Editar");

                        // Append the inputs to the form
                        form.append(newlabel, id, name, des);

                        // Append the button to the form
                        form.append(s);

                        document.getElementsByTagName("body")[0]
                                .appendChild(form);
                    
            }

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
                        form.setAttribute("action", "controllerSeguridad");

                        var newlabel = document.createElement("h1");
                        newlabel.setAttribute("type", "text");
                        newlabel.innerHTML = "Eliminar Fila";

                        var id = document.createElement("input");
                        id.setAttribute("type", "hidden");
                        id.setAttribute("name", "Didrol");
                        id.setAttribute("Value", datos[1]);

                        // Create an input element for Nombre
                        var name = document.createElement("input");
                        name.setAttribute("type", "text");
                        name.setAttribute("name", "Dnombre");
                        name.setAttribute("Value", datos[2]);
                        name.setAttribute("disabled", "disabled");
                        // Create an input element for Descripcion
                        var des = document.createElement("input");
                        des.setAttribute("type", "text");
                        des.setAttribute("name", "Ddescripcion");
                        des.setAttribute("value", datos[3]);
                        des.setAttribute("disabled", "disabled");
                        // Create a submit button
                        var s = document.createElement("button");
                        s.setAttribute("type", "submit");
                        s.setAttribute("name", "accion");
                        s.setAttribute("value", "eliminarR");
                        s.innerHTML = ("Eliminar");

                        // Append the inputs to the form
                        form.append(newlabel, id, name, des);
                        // Append the button to the form
                        form.append(s);

                        document.getElementsByTagName("body")[0]
                                .appendChild(form);
                    
            }

        </script>
        
    </head>
    <body style="padding-bottom: 50px">
        <div class="container"> 
            <h1>Roles</h1>                
            <table border="1" width="1" cellspacing="1" class="table table-hover" id="myTable">
                <thead>
                    <tr>
                        <th class="text-center">Id Rol</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">Descripcion</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%
                            List<Rol> lstRol = (List<Rol>) request.getAttribute("rol");
                            int iter = 0;
                            for (Rol rol : lstRol) {
                                iter++;
                        %>
                        <td class="text-center"><%=rol.getIdRol()%></td>
                        <td class="text-center"><%=rol.getNombre()%></td>
                        <td class="text-center"><%=rol.getDescripcion()%></td>
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
