<%@page import="modelos.Cliente"%>
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
        <title>Clientes</title>
        <script>
            function agregarFila() {
                var form = document.createElement("form");
                form.setAttribute("class", "container");
                form.setAttribute("method", "Post");
                form.setAttribute("action", "controllerMantenimiento");
                
                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Agregar Fila";
                
                // Create an input element for Nombre
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "Anombre");
                name.setAttribute("placeholder", "Nombre");
                // Create an input element for NIT
                var nit = document.createElement("input");
                nit.setAttribute("type", "text");
                nit.setAttribute("name", "Anit");
                nit.setAttribute("placeholder", "NIT");
                // Create an input element for Nickname
                var nick = document.createElement("input");
                nick.setAttribute("type", "text");
                nick.setAttribute("name", "Anick");
                nick.setAttribute("placeholder", "Nickname");
                // Create an input element for Direccion
                var direccion = document.createElement("input");
                direccion.setAttribute("type", "text");
                direccion.setAttribute("name", "Adireccion");
                direccion.setAttribute("placeholder", "Direccion");
                // Create an input element for Telefono
                var telefono= document.createElement("input");
                telefono.setAttribute("type", "text");
                telefono.setAttribute("name", "Atelefono");
                telefono.setAttribute("placeholder", "Telefono");
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "agregarC");
                s.innerHTML = ("Agregar");
                // Append the inputs to the form
                form.append(newlabel, name, nit, nick, direccion,telefono);
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
                id.setAttribute("name", "Eidcliente");
                id.setAttribute("value", datos[1]);

                // Create an input element for Nombre
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "Enombre");
                name.setAttribute("value", datos[2]);
                // Create an input element for NIT
                var nit = document.createElement("input");
                nit.setAttribute("type", "text");
                nit.setAttribute("name", "Enit");
                nit.setAttribute("value", datos[3]);
                // Create an input element for Nickname
                var nick = document.createElement("input");
                nick.setAttribute("type", "text");
                nick.setAttribute("name", "Enick");
                nick.setAttribute("value", datos[4]);
                // Create an input element for Direccion
                var direccion = document.createElement("input");
                direccion.setAttribute("type", "text");
                direccion.setAttribute("name", "Edireccion");
                direccion.setAttribute("value", datos[5]);
                // Create an input element for Telefono
                var telefono= document.createElement("input");
                telefono.setAttribute("type", "text");
                telefono.setAttribute("name", "Etelefono");
                telefono.setAttribute("value", datos[6]);
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "editarC");
                s.innerHTML = ("Editar");
                // Append the inputs to the form
                form.append(newlabel, id,name, nit, nick, direccion,telefono);
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
                id.setAttribute("name", "Didcliente");
                id.setAttribute("value", datos[1]);

                // Create an input element for Nombre
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "Dnombre");
                name.setAttribute("disabled", "disabled");
                name.setAttribute("value", datos[2]);
                // Create an input element for NIT
                var nit = document.createElement("input");
                nit.setAttribute("type", "text");
                nit.setAttribute("name", "Dnit");
                nit.setAttribute("disabled", "disabled");
                nit.setAttribute("value", datos[3]);
                // Create an input element for Nickname
                var nick = document.createElement("input");
                nick.setAttribute("type", "text");
                nick.setAttribute("name", "Dnick");
                nick.setAttribute("disabled", "disabled");
                nick.setAttribute("value", datos[4]);
                // Create an input element for Direccion
                var direccion = document.createElement("input");
                direccion.setAttribute("type", "text");
                direccion.setAttribute("name", "Ddireccion");
                direccion.setAttribute("disabled", "disabled");
                direccion.setAttribute("value", datos[5]);
                // Create an input element for Telefono
                var telefono= document.createElement("input");
                telefono.setAttribute("type", "text");
                telefono.setAttribute("name", "Dtelefono");
                telefono.setAttribute("disabled", "disabled");
                telefono.setAttribute("value", datos[6]);
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "eliminarC");
                s.innerHTML = ("Eliminar");
                // Append the inputs to the form
                form.append(newlabel, id, name, nit, nick, direccion,telefono);
                // Append the button to the form
                form.append(s);
                document.getElementsByTagName("body")[0]
                        .appendChild(form);
            }
        </script>
    </head>
    <body style="padding-bottom: 50px">
        <div class="container"> 
            <h1>Clientes</h1>        
            <table border="1" width="1" cellspacing="1" class="table table-hover" id="myTable">
                <thead>
                    <tr>
                        <th class="text-center">Id Cliente</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">NIT</th>
                        <th class="text-center">Nickname</th>
                        <th class="text-center">Direccion</th>
                        <th class="text-center">Telefono</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int iter = 0;
                        List<Cliente> lstCliente = (List<Cliente>) request.getAttribute("cliente");
                        for (Cliente cliente : lstCliente) {
                            iter++;
                    %>
                    <tr>
                        <td class="text-center"><%=cliente.getIdCliente()%></td>
                        <td class="text-center"><%=cliente.getNombre()%></td>
                        <td class="text-center"><%=cliente.getNit()%></td>
                        <td class="text-center"><%=cliente.getNickname()%></td>
                        <td class="text-center"><%=cliente.getDireccion()%></td>
                        <td class="text-center"><%=cliente.getTelefono()%></td>
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
