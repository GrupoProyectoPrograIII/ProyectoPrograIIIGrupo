<%@page import="java.util.Iterator"%>
<%@page import="modelos.Permiso"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoPermiso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="icon" type="text/css" href="img/icono_logo.ico">
<%
    String nom = (String) session.getAttribute("nombre");
    String ape = (String) session.getAttribute("apellido");
    String usuarios = (String) session.getAttribute("usuario");
    String roles = (String) session.getAttribute("roles");

    if (usuarios == null) {
        //response.setHeader("Cache-Control", "no-cache");
        //response.setHeader("Cache-Control", "no-store");
        //response.setHeader("Pragma", "no-cache");
        //response.setDateHeader("Expires", 0);
        response.sendRedirect("index.jsp");
    }
    int nivel = 0;
    DaoPermiso daoP = new DaoPermiso();
    List<Permiso> lstPermiso = daoP.listar();
    Iterator<Permiso> iterPermiso = lstPermiso.iterator();
    Permiso permiso = new Permiso();
    int i = 0, j = 0;
    Boolean seguridad = false, mantenimientos = false, procesos = false, pedidos = false, Reportes = false;//Nivel 1
    Boolean modulos = false, permisos = false, users = false, rols = false, SelectMesa = false, AnularPedido = false, Area = false, Clientes = false, Mesa = false;
    Boolean Monitor = false, ProductoCombinado = false, Productos = false, Proveedores = false, TipoProducto = false, DescargaInventario = false, FacturasCredito = false;
    Boolean PagoPedido = false, CorteCaja = false, ElegirMonitor = false, InventarioGeneral = false, InventarioParcial = false, Cierre = false, MonitorCaja = false;//nivel 2
    while (iterPermiso.hasNext()) {
        permiso = iterPermiso.next();
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("SEGURIDAD")) {seguridad = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Modulos")) {modulos = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Permisos")) {permisos = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Usuarios")) {users = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Roles")) {rols = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Mantenimientos")) {mantenimientos = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Areas")) {Area = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Clientes")) {Clientes = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Mesa")) {Mesa = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Monitor")) {Monitor = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Producto Combinado")) {ProductoCombinado = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Productos")) {Productos = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Proveedores")) {Proveedores = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Tipo Producto")) {TipoProducto = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Procesos")) {procesos = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Descarga Inventario")) {DescargaInventario = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Facturas al Credito")) {FacturasCredito = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Pago de Pedido")) {PagoPedido = true;}        
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Corte de Caja")) {CorteCaja = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Pedidos")) {pedidos = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Seleccionar Mesa")) {SelectMesa = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Anular")) {AnularPedido = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Elegir Monitor")) {ElegirMonitor = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Reportes")) {Reportes = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Inventario General")) {InventarioGeneral = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Inventario Parcial")) {InventarioParcial = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Cierre")) {Cierre = true;}
        if (permiso.getRol().equalsIgnoreCase(roles) && permiso.getModulo().equalsIgnoreCase("Monitor de Caja")) {MonitorCaja = true;}
        i++;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Content/Styles/Site.css" rel="stylesheet" type="text/css"/>
        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="Content/Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="Content/Scripts/bootstrap.min.js" type="text/javascript"></script>
        <script src="Content/Scripts/Retroceso.js" type="text/javascript"></script>
        <title>Inicio</title>
    </head>
    <body>
        <nav class="navbar navbar-default" role="navigation" >
            <div class="container">
                <!------------>
                <div class="navbar-header">
                    <a class="navbar-brand" href="plantilla.jsp">Inicio</a>
                </div>
                <!------------>
                <div class="collapse navbar-collapse"> 
                    <ul class="nav navbar-nav">
                        <!-----Mantenimientos (Usar este metodo de dropdown en los demas)----->
                        <li id="Li2" class="dropdown" >
                            <%if (mantenimientos) {%><a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Mantenimientos<b class="caret"></b></a><%}%>
                            <div class="formularios">
                                <form style="display: none" action="controllerMantenimiento?accion=readA" method="post"><button type="submit" id="Area"> </button></form>
                                <form style="display: none" action="controllerMantenimiento?accion=readC" method="post"><button type="submit" id="Clientes"> </button></form>
                                <form style="display: none" action="controllerMantenimiento?accion=readM" method="post"><button type="submit" id="Mesa"> </button></form>
                                <form style="display: none" action="controllerMantenimiento?accion=readMon" method="post"><button type="submit" id="Monitor"> </button></form>
                                <form style="display: none" action="controllerMantenimiento?accion=readPC" method="post"><button type="submit" id="ProductoCombinado"> </button></form>
                                <form style="display: none" action="controllerMantenimiento?accion=readProd" method="post"><button type="submit" id="Productos"> </button></form>
                                <form style="display: none" action="controllerMantenimiento?accion=readPro" method="post"><button type="submit" id="Proveedores"> </button></form>
                                <form style="display: none" action="controllerMantenimiento?accion=readTP" method="post"><button type="submit" id="TipoProducto"> </button></form>
                            </div>
                            <ul id="Ul2" class="dropdown-menu" >
                                <%if (Area) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="Area">Area</label></a></li><%}%>
                                <%if (Clientes) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="Clientes">Clientes</label></a></li><%}%>
                                <%if (Mesa) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="Mesa">Mesa</label></a></li><%}%>
                                <%if (Monitor) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="Monitor">Monitor</label></a></li><%}%>
                                <%if (ProductoCombinado) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="ProductoCombinado">Producto Combinado</label></a></li><%}%>
                                <%if (Productos) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="Productos">Productos</label></a></li><%}%>
                                <%if (Proveedores) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="Proveedores">Proveedores</label></a></li><%}%>
                                <%if (TipoProducto) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="TipoProducto">Tipo Producto</label></a></li><%}%>   
                            </ul>
                        </li>
                        <!-----Procesos (Usar este metodo de dropdown en los demas)----->
                        <li id="Li2" class="dropdown" >
                            <%if (procesos) {%><a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Procesos<b class="caret"></b></a><%}%>
                            <div class="formularios">
                                <form style="display: none" action="controllerProceso?accion=readDI" method="post"><button type="submit" id="DescargaInventario"> </button></form>
                                <form style="display: none" action="controllerProceso?accion=readFC" method="post"><button type="submit" id="FacturasCredito"> </button></form>
                                <form style="display: none" action="controllerProceso?accion=readPP" method="post"><button type="submit" id="PagoPedido"></button></form>
                                <form style="display: none" action="controllerProceso?accion=readCC" method="post"><button type="submit" id="CorteCaja"></button></form>
                            </div>
                            <ul id="Ul2" class="dropdown-menu" >
                                <%if (DescargaInventario) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="DescargaInventario">Descarga Inventario</label></a></li><%}%>
                                <%if (FacturasCredito) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="FacturasCredito">Facturas al Credito</label></a></li><%}%>   
                                <%if (PagoPedido) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="PagoPedido">Pago de Pedido</label></a></li><%}%>                                
                                <%if (CorteCaja) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="CorteCaja">Corte de Caja</label></a></li><%}%>
                            </ul>
                        </li>
                        <!-----Pedidos (Usar este metodo de dropdown en los demas)----->
                        <li id="Li2" class="dropdown" >
                            <%if (pedidos) {%><a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Pedidos<b class="caret"></b></a><%}%>
                            <div class="formularios">
                                <form style="display: none" action="controllerPedido?accion=readSM" method="post"><button type="submit" id="SelectMesa"> </button></form>
                                <form style="display: none" action="controllerPedido?accion=readAP" method="post"><button type="submit" id="AnularPedido"> </button></form>
                                <form style="display: none" action="controllerPedido?accion=readEM" method="post"><button type="submit" id="ElegirMonitor"></button></form>
                            </div>
                            <ul id="Ul2" class="dropdown-menu" >
                                <%if (SelectMesa) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="SelectMesa">Seleccionar Mesa</label></a></li><%}%> 
                                <%if (AnularPedido) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="AnularPedido">Anular Pedido</label></a></li><%}%>
                                <%if (ElegirMonitor) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="ElegirMonitor">Elegir Monitor</label></a></li><%}%>
                            </ul>
                        </li>
                        <!-----Reportes (Usar este metodo de dropdown en los demas)----->
                        <li id="Li2" class="dropdown" >
                            <%if (Reportes) {%><a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Reportes<b class="caret"></b></a><%}%>
                            <div class="formularios">
                                <form style="display: none" action="controllerReporte?accion=readIG" method="post"><button type="submit" id="InventarioGeneral"> </button></form>
                                <form style="display: none" action="controllerReporte?accion=readIP" method="post"><button type="submit" id="InventarioParcial"> </button></form>
                                <form style="display: none" action="controllerReporte?accion=readC" method="post"><button type="submit" id="Cierre"></button></form>
                                <form style="display: none" action="controllerReporte?accion=readMC" method="post"><button type="submit" id="MonitorCaja"></button></form>
                            </div>
                            <ul id="Ul2" class="dropdown-menu" >
                                <%if (InventarioGeneral) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="InventarioGeneral">Inventario General</label></a></li><%}%> 
                                <%if (InventarioParcial) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="InventarioParcial">Inventario Parcial</label></a></li><%}%>
                                <%if (Cierre) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="Cierre">Cierre</label></a></li><%}%>
                                <%if (MonitorCaja) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="MonitorCaja">Monitor de Caja</label></a></li><%}%>
                            </ul>
                        </li>
                        <!-----Seguridad (Usar este metodo de dropdown en los demas)----->
                        <li id="Li2" class="dropdown" >
                            <%if (seguridad) {%><a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Seguridad<b class="caret"></b></a><%}%>
                            <div class="formularios">
                                <form style="display: none" action="controllerSeguridad?accion=readM" method="post"><button type="submit" id="Modulos"> </button></form>
                                <form style="display: none" action="controllerSeguridad?accion=readP" method="post"><button type="submit" id="Permisos"> </button></form>
                                <form style="display: none" action="controllerSeguridad?accion=readR" method="post"><button type="submit" id="Roles"></button></form>
                                <form style="display: none" action="controllerSeguridad?accion=readU" method="post"><button type="submit" id="Usuarios"></button></form>
                            </div>
                            <ul id="Ul2" class="dropdown-menu" >
                                <%if (modulos) {%><li id="Li2" class="dropdown"><a id="A2"><label for="Modulos">Modulos</label></a></li><%}%>
                                <%if (permisos) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="Permisos">Permisos</label></a></li><%}%> 
                                <%if (rols) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="Roles">Roles</label></a></li><%}%>
                                <%if (users) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="Usuarios">Usuarios</label></a></li><%}%>
                            </ul>
                        </li>
                        <!---------->
                    </ul>
                    <!-----Esto es solo para los datos del usuario----->
                    <ul class="nav navbar-nav navbar-right">
                        <li id="Li2" class="dropdown" >
                            <a class="dropdown-toggle" data-toggle="dropdown"  id="A1">Usuario: <%= ape + "," + nom%>
                                <b class="caret"></b></a>

                            <ul id="Ul2" class="dropdown-menu">
                                <li id="Li2" class="dropdown"><a id="Li2" class="dropdown">
                                        <img src="img/user.png" alt="40" width="60"/>
                                    </a></li>
                                <li id="a2" class="dropdown"><a id="a2" class="dropdown">User: <%=usuarios%></a></li>
                                <li id="Li2" class="dropdown"><a id="Li2" class="dropdown">Rol: <%=roles%></a></li>
                                <form style="display: none" action="controllerValidar" method="post">
                                    <button type="submit" name="accionL" value="salir" id="salir"> </button>
                                </form>
                                <li id="Li2" class="dropdown">
                                    <a id="A2"><label for="salir">Salir</label></a>
                                </li>                   
                            </ul>
                        </li>
                    </ul>
                    <!---------->
                </div>
            </div>
        </nav>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </body>
    <c:if test="${mensaje == 1}">
        <script type="text/javascript">
            swal.fire({
                title: "!Bienvenid@: <%= usuarios %>!",
                icon: 'success', //warning,info,question,error,success
                timer: 3000,
                showConfirmButton: false
            });
        </script>
        <%
            request.getSession().removeAttribute("mensaje");
        %>
    </c:if>
</html>
