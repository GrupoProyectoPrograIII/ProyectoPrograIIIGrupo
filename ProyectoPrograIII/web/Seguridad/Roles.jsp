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
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                // Create an input element for Activo
                var active = document.createElement("select");
                active.setAttribute("name", "Aactivo");
                active.setAttribute("placeholder", "Activo");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("seleccione");
                active.appendChild(option);
                var option1 = document.createElement("option");
                option1.setAttribute("value", "1");
                option1.innerHTML = ("Activo");
                var option2 = document.createElement("option");
                option2.setAttribute("value", "0");
                option2.innerHTML = ("Inactivo");
                active.appendChild(option1);
                active.appendChild(option2);

                // Create a submit button
                var s = document.createElement("button");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "agregarR");
                s.innerHTML = ("Agregar");

                // Append the inputs to the form
                form.append(newlabel, name, des, active);
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

                Swal.fire({
                    title: '¿Deseas modificar el registro de Rol: ' + datos[2] + '?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#30AB26',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Confirmar',
                    cancelButtonText: 'Cancelar'
                }).then((result) => {
                    if (result.isConfirmed) {
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
                        // Create an input element for Activo
                        var active = document.createElement("select");
                        active.setAttribute("name", "Eactivo");
                        active.setAttribute("value", "Activo");
                        var option = document.createElement("option");
                        option.setAttribute("disabled", "selected");
                        option.setAttribute("selected", "selected");
                        option.innerHTML = ("seleccione");
                        active.appendChild(option);
                        var option1 = document.createElement("option");
                        option1.setAttribute("value", "1");
                        option1.innerHTML = ("Activo");
                        var option2 = document.createElement("option");
                        option2.setAttribute("value", "0");
                        option2.innerHTML = ("Inactivo");
                        active.appendChild(option1);
                        active.appendChild(option2);

                        // Create a submit button
                        var s = document.createElement("button");
                        s.setAttribute("type", "submit");
                        s.setAttribute("name", "accion");
                        s.setAttribute("value", "editarR");
                        s.innerHTML = ("Editar");

                        // Append the inputs to the form
                        form.append(newlabel, id, name, des, active);

                        // Append the button to the form
                        form.append(s);

                        document.getElementsByTagName("body")[0]
                                .appendChild(form);
                    }
                });
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

                Swal.fire({
                    title: '¿Deseas eliminar el registro de Rol: ' + datos[2] + '?',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#30AB26',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Confirmar',
                    cancelButtonText: 'Cancelar'
                }).then((result) => {
                    if (result.isConfirmed) {
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
                        var active = document.createElement("input");
                        active.setAttribute("type", "text");
                        active.setAttribute("name", "Dactivo");
                        active.setAttribute("Value", datos[4]);
                        active.setAttribute("disabled", "disabled");

                        // Create a submit button
                        var s = document.createElement("button");
                        s.setAttribute("type", "submit");
                        s.setAttribute("name", "accion");
                        s.setAttribute("value", "eliminarR");
                        s.innerHTML = ("Eliminar");

                        // Append the inputs to the form
                        form.append(newlabel, id, name, des, active);
                        // Append the button to the form
                        form.append(s);

                        document.getElementsByTagName("body")[0]
                                .appendChild(form);
                    }
                });
            }

        </script>
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">-->
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
                        <th class="text-center">Activo</th>
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
                        <% if (rol.getIsActivo() == 1) { %>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    </body>
    <c:if test="${vacio == 1}">
        <script type="text/javascript">
            swal.fire({
                title: "¡Advertencia!",
                text: "Debe llenar todos los campos que se solicita",
                icon: 'warning', //warning,info,question,error,success
                confirmButtonText: "Aceptar"
            });
        </script>
    </c:if>
    <c:if test="${guardar == 0}">
        <script type="text/javascript">
                swal.fire({
                    title: "¡Error!",
                    text: "El registro no se pudo guardar",
                    icon: 'error', //warning,info,question,error,success
                    confirmButtonText: "Aceptar"
                });
        </script>
    </c:if>
    <c:if test="${guardar == 1}">
        <script type="text/javascript">
            swal.fire({
                title: "¡Éxito!",
                text: "El registro se guardo correctamente",
                icon: 'success', //warning,info,question,error,success
                confirmButtonText: "Aceptar"
            });
        </script>
    </c:if>
    <c:if test="${modificar == 0}">
        <script type="text/javascript">
            swal.fire({
                title: "¡Error!",
                text: "El registro no se pudo modificar",
                icon: 'error', //warning,info,question,error,success
                confirmButtonText: "Aceptar"
            });
        </script>
    </c:if>
    <c:if test="${modificar == 1}">
        <script type="text/javascript">
            swal.fire({
                title: "¡Éxito!",
                text: "El registro se modifico correctamente",
                icon: 'success', //warning,info,question,error,success
                confirmButtonText: "Aceptar"
            });
        </script>
    </c:if>
    <c:if test="${eliminar == 0}">
        <script type="text/javascript">
            swal.fire({
                title: "¡Error!",
                text: "El registro no se pudo eliminar",
                icon: 'error', //warning,info,question,error,success
                confirmButtonText: "Aceptar"
            });
        </script>
    </c:if>
    <c:if test="${eliminar == 1}">
        <script type="text/javascript">
            swal.fire({
                title: "¡Éxito!",
                text: "El registro se elimino correctamente",
                icon: 'success', //warning,info,question,error,success
                confirmButtonText: "Aceptar"
            });
        </script>
    </c:if>
</html>
