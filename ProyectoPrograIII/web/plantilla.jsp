<%@page import="java.util.Iterator"%>
<%@page import="modelos.Permiso"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoPermiso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    Boolean modulos = false, permisos = false, users = false, rols = false, SelectMesa = false, AnularPedido = false, Area=false,Clientes=false,Mesa=false;
    Boolean Monitor=false,ProductoCombinado=false,Productos=false,Proveedores=false,TipoProducto=false,SeleccionarMesa=false,DescargaInventario=false,FacturasCredito=false;
    Boolean PagoPedido=false,CargaInventario=false,CorteCaja=false,ElegirMonitor=false,InventarioGeneral=false,InventarioParcial=false,Cierre=false,MonitorCaja=false;//nivel 2
    while (iterPermiso.hasNext()) {
        permiso = iterPermiso.next();
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Seguridad")) { System.out.println(i + " " + permiso.getModulo() + " se consiguio!");seguridad = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Modulos")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");modulos = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Permisos")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");permisos = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Usuarios")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");users = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Roles")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");rols = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Mantenimientos")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");mantenimientos = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Area")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");Area= true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Clientes")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");Clientes = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Mesa")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");Mesa = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Monitor")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");Monitor = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Producto Combinado")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");ProductoCombinado = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Productos")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");Productos = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Proveedores")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");Proveedores = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Tipo Producto")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");TipoProducto = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Procesos")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");procesos = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Descarga Inventario")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");DescargaInventario = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Facturas al Credito")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");FacturasCredito = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Pago de Pedido")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");PagoPedido = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Carga Inventario")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");CargaInventario = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Corte de Caja")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");CorteCaja = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Pedidos")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");mantenimientos = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Seleccionar Mesa")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");SelectMesa = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Anular Pedido")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");AnularPedido = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Elegir Monitor")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");ElegirMonitor = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Reportes")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");Reportes = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Inventario General")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");InventarioGeneral = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Inventario Parcial")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");InventarioParcial = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Cierre")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");Cierre = true;}
        if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Monitor de Caja")) {System.out.println(i + " " + permiso.getModulo() + " se consiguio!");MonitorCaja = true;}
        i++;
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="Styles/Site.css" rel="stylesheet" type="text/css"/>
        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
        <script src="Scripts/Retroceso.js" type="text/javascript"></script>
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
                                <form style="display: none" action="controllerModulo?accion=read" method="post"><button type="submit" id="Area"> </button></form>
                                <form style="display: none" action="controllerPermiso?accion=read" method="post"><button type="submit" id="Clientes"> </button></form>
                                <form style="display: none" action="controllerRol?accion=read" method="post"><button type="submit" id="Mesa"> </button></form>
                                <form style="display: none" action="controllerUsuario?accion=read" method="post"><button type="submit" id="Monitor"> </button></form>
                                <form style="display: none" action="controllerRol?accion=read" method="post"><button type="submit" id="ProductoCombinado"> </button></form>
                                <form style="display: none" action="controllerRol?accion=read" method="post"><button type="submit" id="Productos"> </button></form>
                                <form style="display: none" action="controllerRol?accion=read" method="post"><button type="submit" id="Proveedores"> </button></form>
                                <form style="display: none" action="controllerRol?accion=read" method="post"><button type="submit" id="TipoProducto"> </button></form>
                                
                            </div>
                            <ul id="Ul2" class="dropdown-menu" >
                                <%if (Area){%><li id="Li2" class="dropdown" ><a id="A2"><label for="Area">Area</label></a></li><%}%>
                                <%if (Clientes){%><li id="Li2" class="dropdown" ><a id="A2"><label for="Clientes">Clientes</label></a></li><%}%>
                                <%if (Mesa){%><li id="Li2" class="dropdown" ><a id="A2"><label for="Permisos">Mesa</label></a></li><%}%>
                                <%if (Monitor){%><li id="Li2" class="dropdown" ><a id="A2"><label for="Monitor">Monitor</label></a></li><%}%>
                                <%if (ProductoCombinado){%><li id="Li2" class="dropdown" ><a id="A2"><label for="ProductoCombinado">Producto Combinado</label></a></li><%}%>
                                <%if (Productos){%><li id="Li2" class="dropdown" ><a id="A2"><label for="Productos">Productos</label></a></li><%}%>
                                <%if (Proveedores){%><li id="Li2" class="dropdown" ><a id="A2"><label for="Proveedores">Proveedores</label></a></li><%}%>
                                <%if (TipoProducto){%><li id="Li2" class="dropdown" ><a id="A2"><label for="TipoProducto">Tipo Producto</label></a></li><%}%>   
                            </ul>
                        </li>
                        <!-----Procesos (Usar este metodo de dropdown en los demas)----->
                        <li id="Li2" class="dropdown" >
                            <%if (procesos){%><a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Procesos<b class="caret"></b></a><%}%>
                            <div class="formularios">
                                <form style="display: none" action="controllerModulo?accion=read" method="post"><button type="submit" id="DescargaInventario"> </button></form>
                                <form style="display: none" action="controllerPermiso?accion=read" method="post"><button type="submit" id="FacturasCredito"> </button></form>
                                <form style="display: none" action="controllerRol?accion=read" method="post"><button type="submit" id="PagoPedido"></button></form>
                                <form style="display: none" action="controllerUsuario?accion=read" method="post"><button type="submit" id="CargaInventario"></button></form>
                                <form style="display: none" action="controllerUsuario?accion=read" method="post"><button type="submit" id="CorteCaja"></button></form>
                            </div>
                            <ul id="Ul2" class="dropdown-menu" >
                                <%if (DescargaInventario){%><li id="Li2" class="dropdown" ><a id="A2"><label for="DescargaInventario">Descarga Inventario</label></a></li><%}%>
                                <%if (FacturasCredito){%><li id="Li2" class="dropdown" ><a id="A2"><label for="FacturasCredito">Facturas al Credito</label></a></li><%}%>   
                                <%if (PagoPedido){%><li id="Li2" class="dropdown" ><a id="A2"><label for="PagoPedido">Pago de Pedido</label></a></li><%}%>
                                <%if (CargaInventario){%><li id="Li2" class="dropdown" ><a id="A2"><label for="CargaInventario">Carga Inventario</label></a></li><%}%>
                                <%if (CorteCaja){%><li id="Li2" class="dropdown" ><a id="A2"><label for="CorteCaja">Corte de Caja</label></a></li><%}%>
                            </ul>
                        </li>
                        <!-----Pedidos (Usar este metodo de dropdown en los demas)----->
                        <li id="Li2" class="dropdown" >
                            <%if(pedidos){%><a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Pedidos<b class="caret"></b></a><%}%>
                            <div class="formularios">
                                <form style="display: none" action="controllerModulo?accion=read" method="post"><button type="submit" id="SelectMesa"> </button></form>
                                <form style="display: none" action="controllerPermiso?accion=read" method="post"><button type="submit" id="AnularPedido"> </button></form>
                                <form style="display: none" action="controllerUsuario?accion=read" method="post"><button type="submit" id="ElegirMonitor"></button></form>
                            </div>
                            <ul id="Ul2" class="dropdown-menu" >
                                <%if (SelectMesa) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="SelectMesa">Seleccionar Mesa</label></a></li><%}%> 
                                <%if (AnularPedido) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="AnularPedido">Anular Pedido</label></a></li><%}%>
                                <%if (ElegirMonitor) {%><li id="Li2" class="dropdown" ><a id="A2"><label for="ElegirMonitor">Elegir Monitor</label></a></li><%}%>
                            </ul>
                        </li>
                        <!-----Reportes (Usar este metodo de dropdown en los demas)----->
                        <li id="Li2" class="dropdown" >
                            <%if (Reportes){%><a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Reportes<b class="caret"></b></a><%}%>
                            <div class="formularios">
                                <form style="display: none" action="controllerModulo?accion=read" method="post"><button type="submit" id="InventarioGeneral"> </button></form>
                                <form style="display: none" action="controllerPermiso?accion=read" method="post"><button type="submit" id="InventarioParcial"> </button></form>
                                <form style="display: none" action="controllerRol?accion=read" method="post"><button type="submit" id="Cierre"></button></form>
                                <form style="display: none" action="controllerUsuario?accion=read" method="post"><button type="submit" id="MonitorCaja"></button></form>
                            </div>
                            <ul id="Ul2" class="dropdown-menu" >
                                <%if (InventarioGeneral){%><li id="Li2" class="dropdown" ><a id="A2"><label for="InventarioGeneral">Inventario General</label></a></li><%}%> 
                                <%if (InventarioParcial){%><li id="Li2" class="dropdown" ><a id="A2"><label for="InventarioParcial">Inventario Parcial</label></a></li><%}%>
                                <%if (Cierre){%><li id="Li2" class="dropdown" ><a id="A2"><label for="Cierre">Cierre</label></a></li><%}%>
                                <%if (MonitorCaja){%><li id="Li2" class="dropdown" ><a id="A2"><label for="MonitorCaja">Monitor de Caja</label></a></li><%}%>
                            </ul>
                        </li>
                        <!-----Seguridad (Usar este metodo de dropdown en los demas)----->
                        <li id="Li2" class="dropdown" >
                            <%if (seguridad){%><a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Seguridad<b class="caret"></b></a><%}%>
                            <div class="formularios">
                                <form style="display: none" action="controllerModulo?accion=read" method="post"><button type="submit" id="Modulos"> </button></form>
                                <form style="display: none" action="controllerPermiso?accion=read" method="post"><button type="submit" id="Permisos"> </button></form>
                                <form style="display: none" action="controllerRol?accion=read" method="post"><button type="submit" id="Roles"></button></form>
                                <form style="display: none" action="controllerUsuario?accion=read" method="post"><button type="submit" id="Usuarios"></button></form>
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
                </div>
            </div>
        </nav>
    </body>
</html>
