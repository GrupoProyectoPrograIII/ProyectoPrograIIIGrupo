<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="modelos.Modulo"%>
<%@page import="dao.daoModulo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proyecto Programacion III</title>
        <link href="Styles/Site.css" rel="stylesheet" type="text/css"/>
        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>

    </head>
    <body>
        <form class="form-group" >
            <div class="container" >  
                <h1 style="text-align: center">Login</h1>
                <a href="index.jsp">Index page</a>
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
        </form>
    </body>
</html>
