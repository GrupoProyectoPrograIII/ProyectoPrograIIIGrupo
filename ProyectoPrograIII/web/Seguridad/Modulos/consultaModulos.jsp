<%@page import="java.util.List"%>
<%@page import="modelos.Modulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="../../plantillaAdm.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">-->
        <title>Modulos</title>
        <%
            List<Modulo> lstModulo = null;
        %>
        <script>
            function agregarFila() {
                var form = document.createElement("form");
                form.setAttribute("class", "container")
                form.setAttribute("method", "post");
                form.setAttribute("action", "controllerModulo");


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
                // Create an input element for Path
                var path = document.createElement("input");
                path.setAttribute("type", "text");
                path.setAttribute("name", "Apath");
                path.setAttribute("placeholder", "Path");
                // Create an input element for Nivel
                var nivel = document.createElement("input");
                nivel.setAttribute("type", "text");
                nivel.setAttribute("name", "Anivel");
                nivel.setAttribute("placeholder", "Nivel");
                // Create an input element for Orden
                var orden = document.createElement("input");
                orden.setAttribute("type", "text");
                orden.setAttribute("name", "Aorden");
                orden.setAttribute("placeholder", "Orden");
                // Create an input element for Modulo Padre
                var mp = document.createElement("input");
                mp.setAttribute("type", "text");
                mp.setAttribute("name", "AmoduloPadre");
                mp.setAttribute("placeholder", "Modulo Padre");
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
                form.append(newlabel, name, des, path, nivel, orden, mp, active);
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
                form.setAttribute("action", "controllerModulo");

                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Editar Fila";

                var id = document.createElement("input");
                id.setAttribute("type", "hidden");
                id.setAttribute("name", "Eidmodulo");
                id.setAttribute("Value", a);

                // Create an input element for Nombre
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "Enombre");
                name.setAttribute("Value", datos[1]);
                // Create an input element for Descripcion
                var des = document.createElement("input");
                des.setAttribute("type", "text");
                des.setAttribute("name", "Edescripcion");
                des.setAttribute("value", datos[2]);
                // Create an input element for Path
                var path = document.createElement("input");
                path.setAttribute("type", "text");
                path.setAttribute("name", "Epath");
                path.setAttribute("value", datos[3]);
                // Create an input element for Nivel
                var nivel = document.createElement("input");
                nivel.setAttribute("type", "text");
                nivel.setAttribute("name", "Enivel");
                nivel.setAttribute("value", datos[4]);
                // Create an input element for Orden
                var orden = document.createElement("input");
                orden.setAttribute("type", "text");
                orden.setAttribute("name", "Eorden");
                orden.setAttribute("value", datos[5]);
                // Create an input element for Modulo Padre
                var mp = document.createElement("input");
                mp.setAttribute("type", "text");
                mp.setAttribute("name", "EmoduloPadre");
                mp.setAttribute("value", datos[6]);
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
                form.append(newlabel, id, name, des, path, nivel, orden, mp, active);

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
                form.setAttribute("action", "controllerModulo");

                var newlabel = document.createElement("h1");
                newlabel.setAttribute("type", "text");
                newlabel.innerHTML = "Eliminar Fila";

                var id = document.createElement("input");
                id.setAttribute("type", "hidden");
                id.setAttribute("name", "Didmodulo");
                id.setAttribute("Value", b);

                // Create an input element for Nombre
                var name = document.createElement("input");
                name.setAttribute("type", "text");
                name.setAttribute("name", "Dnombre");
                name.setAttribute("Value", datos[1]);
                name.setAttribute("disabled", "disabled");
                // Create an input element for Descripcion
                var des = document.createElement("input");
                des.setAttribute("type", "text");
                des.setAttribute("name", "Ddescripcion");
                des.setAttribute("value", datos[2]);
                des.setAttribute("disabled", "disabled");
                // Create an input element for Path
                var path = document.createElement("input");
                path.setAttribute("type", "text");
                path.setAttribute("name", "Dpath");
                path.setAttribute("value", datos[3]);
                path.setAttribute("disabled", "disabled");
                // Create an input element for Nivel
                var nivel = document.createElement("input");
                nivel.setAttribute("type", "text");
                nivel.setAttribute("name", "Dnivel");
                nivel.setAttribute("value", datos[4]);
                nivel.setAttribute("disabled", "disabled");
                // Create an input element for Orden
                var orden = document.createElement("input");
                orden.setAttribute("type", "text");
                orden.setAttribute("name", "Dorden");
                orden.setAttribute("value", datos[5]);
                orden.setAttribute("disabled", "disabled");
                // Create an input element for Modulo Padre
                var mp = document.createElement("input");
                mp.setAttribute("type", "text");
                mp.setAttribute("name", "DmoduloPadre");
                mp.setAttribute("value", datos[6]);
                mp.setAttribute("disabled", "disabled");
                // Create an input element for Activo
                var active = document.createElement("input");
                active.setAttribute("type", "text");
                active.setAttribute("name", "Dactivo");
                active.setAttribute("value", datos[7]);
                active.setAttribute("disabled", "disabled");

                // Create a submit button
                var s = document.createElement("input");
                s.setAttribute("type", "submit");
                s.setAttribute("name", "accion");
                s.setAttribute("value", "eliminar");

                // Append the inputs to the form
                form.append(newlabel, id, name, des, path, nivel, orden, mp, active);
                // Append the button to the form
                form.append(s);

                document.getElementsByTagName("body")[0].appendChild(form);
            }
        </script>
    </head>
    <body>
        <div class="container"> 
            <h1>Modulos</h1>           

            <table border="1" width="1" cellspacing="1" class="table table-hover" id="myTable">
                <thead>
                    <tr>
                        <th class="text-center">Id Modulo</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">Descripcion</th>
                        <th class="text-center">Path</th>
                        <th class="text-center">Nivel</th>
                        <th class="text-center">Orden</th>
                        <th class="text-center">Modulo Padre</th>
                        <th class="text-center">Activo</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <%
                            lstModulo = (List<Modulo>) request.getAttribute("modulo");
                            for (Modulo modulo : lstModulo) {
                        %>
                        <td class="text-center"><%=modulo.getIdModulo()%></td>
                        <td class="text-center"><%=modulo.getNombre()%></td>
                        <td class="text-center"><%=modulo.getDescripcion()%></td>
                        <td class="text-center"><%=modulo.getPath()%></td>
                        <td class="text-center"><%=modulo.getNivel()%></td>
                        <td class="text-center"><%=modulo.getOrden()%></td>
                        <td class="text-center"><%=modulo.getIdModuloPadre()%></td>
                        <% if (modulo.getIsActivo() == 1) { %>
                        <td class="text-center">Activo</td>
                        <%} else {%>
                        <td class="text-center">Inactivo</td>
                        <%}%>

                        <td class="text-center">        
                            <button type="button" class="btn btn-success" onclick="agregarFila()">Agregar</button>
                            <button type="button" class="btn btn-warning" id="edit" onclick="editarFila(<%=modulo.getIdModulo()%>)">Editar</button>
                            <button type="button" class="btn btn-danger" id="delete" onclick="eliminarFila(<%=modulo.getIdModulo()%>)">Eliminar</button>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>
        </div>

        <div>
            <div>
                <div>
                    <form>

                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>            
    </body>
</html>
