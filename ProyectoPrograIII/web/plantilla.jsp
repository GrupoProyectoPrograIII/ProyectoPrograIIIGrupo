<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv="Expires" content="0" />
<meta http-equiv="Pragma" content="no-cache" />
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
    <body onload="nobackbutton();">
        <form id="Form1" >
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
                        <a class="navbar-brand" href="plantilla.jsp">Inicio</a>
                    </div>
                    <div class="collapse navbar-collapse">
                        <ul class="nav navbar-nav">
                            <li id="Li2" class="dropdown" >
                                <a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Mantenimientos<b class="caret"></b></a>
                                <ul id="Ul2" class="dropdown-menu" >
                                    <li id="Li2" class="dropdown" >
                                        <a href="controllerModulo?accion=read" id="A2">Area</a>
                                    </li>
                                    <li id="Li2" class="dropdown" >
                                        <a href="controllerModulo?accion=read" id="A2">Clientes</a>
                                    </li>
                                    <li id="Li2" class="dropdown" >
                                        <a href="controllerModulo?accion=read" id="A2">Mesa</a>
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
                            </li><li id="Li2" class="dropdown" >
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
                                <ul id="Ul2" class="dropdown-menu" >
                                    <li id="Li2" class="dropdown" >
                                        <a href="controllerModulo?accion=read" id="A2">Modulos</a>
                                    </li>   
                                    <li id="Li2" class="dropdown" >
                                        <a href="controllerPermiso?accion=read" id="A2">Permisos</a>
                                    </li>   
                                    <li id="Li2" class="dropdown" >
                                        <a href="controllerRol?accion=read" id="A2">Roles</a>
                                    </li>
                                    <li id="Li2" class="dropdown" >
                                        <a href="controllerUsuario?accion=read" id="A2">Usuarios</a>
                                    </li>
                                    <li id="Li2" class="dropdown" >
                                    </li> 
                                </ul>
                            </li>

                            <li></li> 
                        </ul>
                        <ul class="navbar-brand navbar-nav navbar-right">
                            <li><a href="index.jsp"> Salir</a></li>
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
        </form>   

    </body>
</html>

