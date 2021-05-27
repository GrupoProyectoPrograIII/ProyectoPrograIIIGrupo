<%@page import="modelos.Inventario"%>
<%@page import="dao.DaoInventario"%>
<%@page import="modelos.Rol"%>
<%@page import="java.util.Iterator"%>
<%@page import="modelos.Usuario"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<jsp:include page="../plantilla.jsp"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inventario General</title>

    </head>
    <body style="padding-bottom: 50px">
        <div class="container"> 
            <h1>Inventario General</h1>        
            <table border="1" width="1" cellspacing="1" class="table table-hover" id="myTable">
                <thead>
                    <tr>
                        <th class="text-center">Codigo Producto</th>
                        <th class="text-center">Producto</th>
                        <th class="text-center">Categoria</th>
                        <th class="text-center">Stock</th>
                        <th class="text-center">Acciones</th>
                    </tr>
                </thead>
                <%
                    DaoInventario daoInv = new DaoInventario();
                    List<Inventario> listInv = daoInv.listar_inv_general();
                    Iterator<Inventario> iteraInv = listInv.iterator();
                    Inventario inv = null;

                    while (iteraInv.hasNext()) {
                        inv = iteraInv.next();
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= inv.getCodigo_pro()%></td>
                        <td class="text-center"><%= inv.getDescripcion()%></td>
                        <td class="text-center"><%= inv.getDesc_categoria()%></td>
                        <td class="text-center"><%= inv.getStock()%></td>
                        <td class="text-center">
                            <form action="controllerReporte?accion=editarIG&codigo=<%= inv.getCodigo_pro()%>" method="POST"><button class="btn btn-warning" type="submit">Modificar</button></form>
                            <form action="controllerReporte?accion=eliminarIG&codigo=<%= inv.getCodigo_pro()%>" method="POST"><button class="btn btn-danger" type="submit">Eliminar</button></form>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
        </div>
    </body>
    <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
