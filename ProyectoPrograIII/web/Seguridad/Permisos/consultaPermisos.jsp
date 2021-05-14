<%@page import="modelos.Modulo"%>
<%@page import="modelos.Rol"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Permiso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../../plantillaAdm.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Permisos</title>
        <script>

            function agregarFila() {
                var form = document.createElement("form");
                form.setAttribute("class", "container")
                form.setAttribute("method", "post");
                form.setAttribute("action", "controllerPermiso");


                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Agregar Fila";
                
            <%
                List<Permiso> lstPermiso = (List<Permiso>)request.getAttribute("permiso");
                List<Rol> lstRol = (List<Rol>) request.getAttribute("rol");
                List<Modulo> lstModulo = (List<Modulo>) request.getAttribute("modulo");
            %>
                // Create an input element for Modulo
                var modulo = document.createElement("select");
                modulo.setAttribute("name", "Amodulo");
                modulo.setAttribute("placeholder", "Modulo");
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
            <%
                for (Rol rol : lstRol) {
            %>
                var optionR = document.createElement("option");
                optionR.setAttribute("value", "<%=rol.getIdRol()%>");
                optionR.innerHTML = "<%=rol.getNombre()%>";
                role.appendChild(optionR);
            <%}%>
                // Create an input element for Activo
                var active = document.createElement("select");
                active.setAttribute("name", "Aactivo");
                active.setAttribute("placeholder", "Activo");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("seleccione");
                var option1 = document.createElement("option");
                option1.setAttribute("value", "1");
                option1.innerHTML = ("Activo");
                var option2 = document.createElement("option");
                option2.setAttribute("value", "0");
                option2.innerHTML = ("Inactivo");
                active.appendChild(option);
                active.appendChild(option1);
                active.appendChild(option2);

                // Create a submit button
                var s = document.createElement("input");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "agregar");

                // Append the inputs to the form
                form.append(newlabel, modulo, role, active);
                // Append the button to the form
                form.append(s);

                document.getElementsByTagName("body")[0]
                        .appendChild(form);
                //document.getElementById("tablaprueba").insertRow(-1).innerHTML = '<td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td></td><td><a class="btn btn-warning" href="ControllerUsuario?accion=editar&id=">Editar</a><button type="button" class="btn btn-danger" onclick="eliminarFila()">Eliminar Fila</button></td>';
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
                for (i = a; i <= a; i++) {
                    //gets cells of current row  
                    var oCells = oTable.rows.item(i).cells;
                    //gets amount of cells of current row
                    var cellLength = oCells.length;
                    //loops through each cell in current row
                    for (var j = 1; j < cellLength - 1; j++) {
                        //get your cell info here
                        console.log(cellVal);// check values added
                        var cellVal = cellVal + " , " + oCells.item(j).innerHTML;
                    datos = cellVal.split(',');
                    }
                    // console.log(datos[3]);
                }

                var form = document.createElement("form");
                form.setAttribute("class", "container")
                form.setAttribute("method", "post");
                form.setAttribute("action", "controllerPermiso");

                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Editar Fila";
                var id = document.createElement("input");
                 id.setAttribute("type", "hidden");
                 id.setAttribute("name", "Eidpermiso");
                 id.setAttribute("Value", a);
                 
                <%
                lstPermiso = (List<Permiso>)request.getAttribute("permiso");
                lstRol = (List<Rol>) request.getAttribute("rol");
                lstModulo = (List<Modulo>) request.getAttribute("modulo");
            %>
                // Create an input element for Modulo
                var modulo = document.createElement("select");
                modulo.setAttribute("name", "Emodulo");
                modulo.setAttribute("placeholder", "Modulo");
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
            <%
                for (Rol rol : lstRol) {
            %>
                var optionR = document.createElement("option");
                optionR.setAttribute("value", "<%=rol.getIdRol()%>");
                optionR.innerHTML = "<%=rol.getNombre()%>";
                role.appendChild(optionR);
            <%}%>
                // Create an input element for Activo
                var active = document.createElement("select");
                active.setAttribute("name", "Eactivo");
                active.setAttribute("placeholder", "Activo");
                var option = document.createElement("option");
                option.setAttribute("disabled", "selected");
                option.setAttribute("selected", "selected");
                option.innerHTML = ("seleccione");
                var option1 = document.createElement("option");
                option1.setAttribute("value", "1");
                option1.innerHTML = ("Activo");
                var option2 = document.createElement("option");
                option2.setAttribute("value", "0");
                option2.innerHTML = ("Inactivo");
                active.appendChild(option);
                active.appendChild(option1);
                active.appendChild(option2);
                
                // Create a submit button
                var s = document.createElement("input");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "editar");

                // Append the inputs to the form
                form.append(newlabel, id,modulo, role, active);

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
                for (i = b; i <= b; i++) {
                    //gets cells of current row  
                    var oCells = oTable.rows.item(i).cells;
                    //gets amount of cells of current row
                    var cellLength = oCells.length;
                    //loops through each cell in current row
                    for (var j = 1; j < cellLength - 1; j++) {
                        //get your cell info here
                        console.log(cellVal);// check values added
                        var cellVal = cellVal + " , " + oCells.item(j).innerHTML;
                    datos = cellVal.split(',');
                    }
                    // console.log(datos[3]);
                }

                var form = document.createElement("form");
                form.setAttribute("class", "container")
                form.setAttribute("method", "post");
                form.setAttribute("action", "controllerPermiso");

                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Eliminar Fila";
                var id = document.createElement("input");
                
                 id.setAttribute("type", "hidden");
                 id.setAttribute("name", "Didpermiso");
                 id.setAttribute("Value", b);
                 
                // Create an input element for Nombre
                var modulo = document.createElement("input");
                modulo.setAttribute("type", "text");
                modulo.setAttribute("name", "DModulo");
                modulo.setAttribute("disabled", "disabled");
                modulo.setAttribute("Value", datos[1]);
                // Create an input element for Rol
                var role = document.createElement("input");
                role.setAttribute("name", "Drol");
                role.setAttribute("type", "text");
                role.setAttribute("disabled", "disabled");
                role.setAttribute("Value", datos[2]);
                // Create an input element for Activo
                var active = document.createElement("input");
                active.setAttribute("type", "text");
                active.setAttribute("name", "Dactivo");
                active.setAttribute("disabled", "disabled");
                active.setAttribute("Value", datos[3]);
                
                // Create a submit button
                var s = document.createElement("input");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "eliminar");

                // Append the inputs to the form
                form.append(newlabel,id, modulo, role, active);
                // Append the button to the form
                form.append(s);

                document.getElementsByTagName("body")[0]
                        .appendChild(form);
            }
        </script>
    </head>
    <body>
        <div class="container">   
            <h1>Permisos</h1> 
            <table border="1" width="1" cellspacing="1" class="table table-hover" id="myTable">
                <thead>
                    <tr>
                        <th class="text-center">Id Permiso</th>
                        <th class="text-center">Modulo</th>
                        <th class="text-center">Rol</th>
                        <th class="text-center">Activo</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        for(Permiso permiso : lstPermiso){
                    %>
                    <tr>
                        <td class="text-center"><%=permiso.getIdPermiso()%></td>
                        <td class="text-center"><%=permiso.getModulo()%></td>
                        <td class="text-center"><%=permiso.getRol()%></td>
                        <% if (permiso.getIsActivo() == 1) { %>
                        <td class="text-center">Activo</td>
                        <%} else {%>
                        <td class="text-center">Inactivo</td>
                        <%}%>
                        <td class="text-center">    
                            <button type="button" class="btn btn-success" onclick="agregarFila()">Agregar</button>                            
                            <button type="button" class="btn btn-warning" id="edit" onclick="editarFila(<%=permiso.getIdPermiso()%>)">Editar</button>
                            <button type="button" class="btn btn-danger" id="delete" onclick="eliminarFila(<%=permiso.getIdPermiso()%>)">Eliminar</button>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>
    </body>
</html>
