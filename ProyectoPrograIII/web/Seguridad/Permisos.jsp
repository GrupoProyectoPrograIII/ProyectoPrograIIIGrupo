<%@page import="modelos.Modulo"%>
<%@page import="modelos.Rol"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Permiso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Permisos</title>
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

            <%
                List<Permiso> lstPermiso = (List<Permiso>) request.getAttribute("permiso");
                List<Rol> lstRol = (List<Rol>) request.getAttribute("rol");
                List<Modulo> lstModulo = (List<Modulo>) request.getAttribute("modulo");
            %>
                // Create an input element for Modulo
                var modulo = document.createElement("select");
                modulo.setAttribute("name", "Amodulo");
                modulo.setAttribute("placeholder", "Modulo");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("seleccione");
                modulo.appendChild(option);
            <%
                for (Modulo modulo : lstModulo) {
            %>
                var opcionM = document.createElement("option");
                opcionM.setAttribute("value", "<%=modulo.getIdModulo()%>");
                opcionM.innerHTML = "<%=modulo.getNombre()%>";
                modulo.appendChild(opcionM);
            <%}%>
                // Create an input element for Rol
                var role = document.createElement("select");
                role.setAttribute("name", "Arol");
                role.setAttribute("placeholder", "Rol");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("seleccione");
                role.appendChild(option);
            <%
                for (Rol rol : lstRol) {
            %>
                var optionR = document.createElement("option");
                optionR.setAttribute("value", "<%=rol.getIdRol()%>");
                optionR.innerHTML = "<%=rol.getNombre()%>";
                role.appendChild(optionR);
            <%}%>
                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "agregarP");
                s.innerHTML = ("Agregar");

                // Append the inputs to the form
                form.append(newlabel, modulo, role);
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

                        console.log(cellVal);
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
                        newlabel.innerHTML = "Editar Fila " + datos[1];


                        var id = document.createElement("input");
                        id.setAttribute("name", "Eidpermiso");
                        id.setAttribute("type", "hidden");
                        id.setAttribute("Value", datos[1]);


            <%
                lstPermiso = (List<Permiso>) request.getAttribute("permiso");
                lstRol = (List<Rol>) request.getAttribute("rol");
                lstModulo = (List<Modulo>) request.getAttribute("modulo");
            %>
                        // Create an input element for Modulo
                        var modulo = document.createElement("select");
                        modulo.setAttribute("name", "Emodulo");
                        modulo.setAttribute("placeholder", "Modulo");
                        var option = document.createElement("option");
                        option.setAttribute("disabled", "selected");
                        option.setAttribute("selected", "selected");
                        option.innerHTML = ("seleccione");
                        modulo.appendChild(option);
            <%
                for (Modulo modulo : lstModulo) {
            %>
                        var opcionM = document.createElement("option");
                        opcionM.setAttribute("value", "<%=modulo.getIdModulo()%>");
                        opcionM.innerHTML = "<%=modulo.getNombre()%>";
                        modulo.appendChild(opcionM);
            <%}%>
                        // Create an input element for Rol
                        var role = document.createElement("select");
                        role.setAttribute("name", "Erol");
                        role.setAttribute("placeholder", "Rol");
                        var option = document.createElement("option");
                        option.setAttribute("disabled", "selected");
                        option.setAttribute("selected", "selected");
                        option.innerHTML = ("seleccione");
                        role.appendChild(option);
            <%
                for (Rol rol : lstRol) {
            %>
                        var optionR = document.createElement("option");
                        optionR.setAttribute("value", "<%=rol.getIdRol()%>");
                        optionR.innerHTML = "<%=rol.getNombre()%>";
                        role.appendChild(optionR);
            <%}%>

                        // Create a submit button
                        var s = document.createElement("button");
                        s.setAttribute("type", "submit");
                        s.setAttribute("name", "accion");
                        s.setAttribute("value", "editarP");
                        s.innerHTML = "Editar";


                        // Append the inputs to the form
                        form.append(newlabel, id, modulo, role);

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

                        console.log(cellVal);
                    }
                    datos = cellVal.split(',');

                }

                        var form = document.createElement("form");
                        form.setAttribute("class", "container");
                        form.setAttribute("method", "post");
                        form.setAttribute("action", "controllerSeguridad");

                        var newlabel = document.createElement("h1");
                        newlabel.setAttribute("type", "text");
                        newlabel.innerHTML = "Eliminar Fila " + datos[1];

                        var id = document.createElement("input");
                        id.setAttribute("type", "hidden");
                        id.setAttribute("name", "Didpermiso");
                        id.setAttribute("Value", datos[1]);

                        // Create an input element for Nombre
                        var modulo = document.createElement("input");
                        modulo.setAttribute("type", "text");
                        modulo.setAttribute("name", "DModulo");
                        modulo.setAttribute("disabled", "disabled");
                        modulo.setAttribute("Value", datos[2]);
                        // Create an input element for Rol
                        var role = document.createElement("input");
                        role.setAttribute("name", "Drol");
                        role.setAttribute("type", "text");
                        role.setAttribute("disabled", "disabled");
                        role.setAttribute("Value", datos[3]);

                        // Create a submit button
                        var s = document.createElement("button");
                        s.setAttribute("type", "submit");
                        s.setAttribute("name", "accion");
                        s.setAttribute("value", "eliminarP");
                        s.innerHTML = ("Eliminar");

                        // Append the inputs to the form
                        form.append(newlabel, id, modulo, role);
                        // Append the button to the form
                        form.append(s);

                        document.getElementsByTagName("body")[0]
                                .appendChild(form);
                    
            }
        </script>
    </head>
    <body style="padding-bottom: 50px">
        <div class="container">   
            <h1>Permisos</h1>        
            <table border="1" width="1" cellspacing="1" class="table table-hover" id="myTable">
                <thead>
                    <tr>
                        <th class="text-center">No Permiso</th>
                        <th class="text-center">Modulo</th>
                        <th class="text-center">Rol</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int iter = 0;
                        for (Permiso permiso : lstPermiso) {
                            iter++;
                    %>
                    <tr>
                        <td class="text-center"><%=permiso.getIdPermiso()%></td>
                        <td class="text-center"><%=permiso.getModulo()%></td>
                        <td class="text-center"><%=permiso.getRol()%></td>
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
