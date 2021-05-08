<%-- 
    Document   : consultaPermisos
    Created on : May 3, 2021, 7:25:00 AM
    Author     : javie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">            
            <table border="1" width="1" cellspacing="1" class="table table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center">Id</th>
                            <th class="text-center">Nombre</th>
                            <th class="text-center">Apellido</th>
                            <th class="text-center">NIT</th>
                            <th class="text-center">Telefono</th>
                            <th class="text-center">Direccion</th>
                            <th class="text-center">Acciones</th>
                        </tr>
                    </thead>
                    <%
                        daoModulo daoModulo = new daoModulo();
                        List<Modulo> lstClientes = daoModulo.listar();
                        Iterator<Modulo> iteratorClientes = lstClientes.iterator();
                        Modulo clientes = null;
                        while (iteratorClientes.hasNext()) {
                            clientes = iteratorClientes.next();
                    %>

                    <tbody>
                        <tr>
                            <td class="text-center"><%=clientes.getIdModulo()%></td>
                            <td class="text-center"><%=clientes.getNombre()%></td>
                            <td class="text-center"><%=clientes.getDescripcion()%></td>
                            <td class="text-center"><%=clientes.getPath()%></td>
                            <td class="text-center"><%=clientes.getNivel()%></td>
                            <td class="text-center"><%=clientes.getIsActivo()%></td>
                            <td class="text-center">                                
                                <a class="btn btn-warning" href="ControllerClientes?accion=editar&id=<%=clientes.getIdModulo()%>">Editar</a>
                                <a class="btn btn-danger" href="ControllerClientes?accion=delete&id=<%=clientes.getIdModulo()%>">Eliminar</a>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
        </div>
    </body>
</html>
