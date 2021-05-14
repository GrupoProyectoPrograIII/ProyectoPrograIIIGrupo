<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--meta http-equiv='cache-control' content='no-cache'>
<--META HTTP-EQUIV="Cache-Control" CONTENT="no-store">
<--meta http-equiv='expires' content='0'>
<--meta http-equiv='pragma' content='no-cache'-->
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

    String ver = (String) session.getAttribute("usuario");
    if (ver == null) {
        response.sendRedirect("index.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Aplicación Web</title>
        <link href="Styles/Site.css" rel="stylesheet" type="text/css"/>
        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
        <script src="Scripts/Retroceso.js" type="text/javascript"></script>

    </head>
    <body onload="">
        <nav class="navbar navbar-default" role="navigation" >
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>                    
                </div>

                <div class="navbar-header">
                    <a class="navbar-brand" href="plantillaAdm.jsp">Inicio</a>
                </div>

                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li id="Li2" class="dropdown" >
                            <a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Mantenimientos<b class="caret"></b></a>
                            <ul id="Ul2" class="dropdown-menu" >
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Area</a>
                                </li>
                                <li id="Li2">
                                    <a href="controllerModulo?accion=read" id="A2">Clientes</a>
                                </li>
                                <li id="Li2" class="dropdown" >
                                    <a disabled="disabled"href="controllerModulo?accion=read" id="A2">Mesa</a>
                                </li>
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Monitor</a>
                                </li>
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Producto Combinado</a>
                                </li>
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Productos</a>
                                </li>
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Proveedores</a>
                                </li>
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Tipo Producto</a>
                                </li>   
                            </ul>
                        </li>
                        <li id="Li2" class="dropdown" >
                            <a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Procesos<b class="caret"></b></a>
                            <ul id="Ul2" class="dropdown-menu" >
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Descarga Inventario</a>
                                </li>
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Facturas al Credito</a>
                                </li>   
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Pago de Pedido</a>
                                </li>
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Carga Inventario</a>
                                </li>
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Corte de Caja</a>
                                </li>
                            </ul>
                        </li>
                        <li id="Li2" class="dropdown" >
                            <a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Pedidos<b class="caret"></b></a>
                            <ul id="Ul2" class="dropdown-menu" >
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Seleccionar Mesa</a>
                                </li> 
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Anular Pedido</a>
                                </li>
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Elegir Monitor</a>
                                </li>  
                            </ul>
                        </li>
                        <li id="Li2" class="dropdown" >
                            <a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Reportes<b class="caret"></b></a>
                            <ul id="Ul2" class="dropdown-menu" >
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Inventario General</a>
                                </li>   
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Inventario Parcial</a>
                                </li>
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Cierre</a>
                                </li>
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Monitor de Caja</a>
                                </li>
                            </ul>
                        </li>
                        <li id="Li2" class="dropdown" >
                            <a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Seguridad<b class="caret"></b></a>
                            <div class="formularios">
                                <form style="display: none" action="controllerModulo?accion=read" method="post">
                                    <button type="submit" id="Modulos"> </button>
                                </form>
                                <form style="display: none" action="controllerPermiso?accion=read" method="post">
                                    <button type="submit" id="Permisos"> </button>
                                </form>
                                <form style="display: none" action="controllerRol?accion=read" method="post">
                                    <button type="submit" id="Roles"> </button>
                                </form>
                                <form style="display: none" action="controllerUsuario?accion=read" method="post">
                                    <button type="submit" id="Usuarios"> </button>
                                </form>
                            </div>
                            <ul id="Ul2" class="dropdown-menu" >
                                <li id="Li2" class="dropdown" >
                                    <a id="A2"><label for="Modulos">Modulos</label></a>
                                </li>
                                <li id="Li2" class="dropdown" >
                                    <a id="A2"><label for="Permisos">Permisos</label></a>
                                </li> 
                                <li id="Li2" class="dropdown" >
                                    <a id="A2"><label for="Roles">Roles</label></a>
                                </li>
                                <li id="Li2" class="dropdown" >
                                    <a id="A2"><label for="Usuarios">Usuarios</label></a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="controllerValidar?accion=cerrar">Cerrar Sesion</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container body-content">
            <div style=" float:right;">                    
            </div>
            <footer>
            </footer>
        </div>  

    </body>
</html>