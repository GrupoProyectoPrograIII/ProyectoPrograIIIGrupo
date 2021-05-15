<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    /*response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);*/

    //String nom = (String) session.getAttribute("nombre");
    //String ape = (String) session.getAttribute("apellido");
    String usuario = (String) session.getAttribute("usuario");
    String ver = (String)session.getAttribute("rol");
    int rol = Integer.parseInt(ver);

    if (usuario == null) {
        //response.setHeader("Cache-Control", "no-cache");
        //response.setHeader("Cache-Control", "no-store");
        //response.setHeader("Pragma", "no-cache");
        //response.setDateHeader("Expires", 0);
        response.sendRedirect("index.jsp");
        
    } else if (rol == 1) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!----Mejor no usemos este tipo de bootstrap, no es compatible con codigo que tenemos------>
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">-->
        <link href="Styles/Site.css" rel="stylesheet" type="text/css"/>
        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
        <script src="Scripts/Retroceso.js" type="text/javascript"></script>
        <title>Administracion</title>
    </head>
    <body>
        <nav class="navbar navbar-default" role="navigation" >
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>                    
                </div>
                <!---------->
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Inicio</a>
                </div>
                <!---------->
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <!-----Lista de Mantenimientos(Inactivo)----->
                        <li id="Li2" class="dropdown" >
                            <a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Mantenimientos<b class="caret"></b></a>
                            <ul id="Ul2" class="dropdown-menu" >
                                <li id="Li2" class="dropdown" >
                                    <a href="controllerModulo?accion=read" id="A2">Areas</a>
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
                        </li>
                        <!-----Procesos (Inactivo)----->
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
                        <!------Pedidos (Inactivo)---->
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
                        <!-----Reportes (Inactivo)----->
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
                        <!-----Seguridad  (Usar este metodo de dropdown en los demas)----->

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
                        <!---------->
                    </ul>
                    <!--<ul class="nav navbar-nav navbar-right">
                        <li><a href="controllerValidar?accion=cerrar">Cerrar Sesion</a></li>
                    </ul>-->
                    <!-----Esto es solo para los datos del usuario----->
                    <ul class="nav navbar-nav navbar-right">
                        <li id="Li2" class="dropdown" >
                            <a class="dropdown-toggle" data-toggle="dropdown"  id="A1">Usuario logeado: <%= usuario%>
                                <b class="caret"></b></a>
                            <!--a class="dropdown-toggle" data-toggle="dropdown"  id="A1">Usuario logeado:<><b class="caret"></b></a-->
                            <ul id="Ul2" class="dropdown-menu">
                                <li id="Li2" class="dropdown"><a id="Li2" class="dropdown">
                                        <img src="img/admin.png" alt="40" width="60"/>
                                    </a></li>
                                <li id="Li2" class="dropdown"><a id="Li2" class="dropdown"><%= usuario%></a></li>
                                <li id="Li2" class="dropdown"><a >usuario@gmail.com</a></li>
                                <form action="controllerValidar" method="POST">
                                    <li><button name="accionL" value="Salir" class="dropdown-item" href="#">Salir</button></li>
                                </form>                 
                            </ul>
                        </li>
                    </ul>
                    <!---------->       
                </div>
            </div>
        </nav>
        <!--<div class="m-4" style="height: 550px">
            <iframe name="myFrame" style="height: 100%; width: 100%; border: none"></iframe>
        </div>-->
        <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>-->   
    </body>
</html>
<%
    } else if (rol == 2) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!----Mejor no usemos este tipo de bootstrap, no es compatible con codigo que tenemos------>
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">-->
        <link href="Styles/Site.css" rel="stylesheet" type="text/css"/>
        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
        <script src="Scripts/Retroceso.js" type="text/javascript"></script>
        <title>Administracion</title>
    </head>
    <body>
        <nav class="navbar navbar-default" role="navigation" >
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>                    
                </div>
                <!---------->
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Inicio</a>
                </div>
                <!---------->
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <!-----Procesos (Inactivo)----->
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
                        <!------Pedidos (Inactivo)---->
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
                        <!-----Reportes (Inactivo)----->
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
                       
                        <!---------->
                    </ul>
                    <!--<ul class="nav navbar-nav navbar-right">
                        <li><a href="controllerValidar?accion=cerrar">Cerrar Sesion</a></li>
                    </ul>-->
                    <!-----Esto es solo para los datos del usuario----->
                    <ul class="nav navbar-nav navbar-right">
                        <li id="Li2" class="dropdown" >
                            <a class="dropdown-toggle" data-toggle="dropdown"  id="A1">Usuario logeado: <%= usuario%>
                                <b class="caret"></b></a>
                            <!--a class="dropdown-toggle" data-toggle="dropdown"  id="A1">Usuario logeado:<><b class="caret"></b></a-->
                            <ul id="Ul2" class="dropdown-menu">
                                <li id="Li2" class="dropdown"><a id="Li2" class="dropdown">
                                        <img src="img/gerente.png" alt="40" width="60"/>
                                    </a></li>
                                <li id="Li2" class="dropdown"><a id="Li2" class="dropdown"><%= usuario%></a></li>
                                <li id="Li2" class="dropdown"><a >usuario@gmail.com</a></li>
                                <form action="controllerValidar" method="POST">
                                    <li><button name="accionL" value="Salir" class="dropdown-item" href="#">Salir</button></li>
                                </form>                 
                            </ul>
                        </li>
                    </ul>
                    <!---------->       
                </div>
            </div>
        </nav>
        <!--<div class="m-4" style="height: 550px">
            <iframe name="myFrame" style="height: 100%; width: 100%; border: none"></iframe>
        </div>-->
        <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>-->   
    </body>
</html>
<%
    } else if (rol == 3) {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!----Mejor no usemos este tipo de bootstrap, no es compatible con codigo que tenemos------>
        <!--<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">-->
        <link href="Styles/Site.css" rel="stylesheet" type="text/css"/>
        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
        <script src="Scripts/Retroceso.js" type="text/javascript"></script>
        <title>Administracion</title>
    </head>
    <body>
        <nav class="navbar navbar-default" role="navigation" >
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>                    
                </div>
                <!---------->
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Inicio</a>
                </div>
                <!---------->
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <!------Pedidos (Inactivo)---->
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
                        <!---------->
                    </ul>
                    <!--<ul class="nav navbar-nav navbar-right">
                        <li><a href="controllerValidar?accion=cerrar">Cerrar Sesion</a></li>
                    </ul>-->
                    <!-----Esto es solo para los datos del usuario----->
                    <ul class="nav navbar-nav navbar-right">
                        <li id="Li2" class="dropdown" >
                            <a class="dropdown-toggle" data-toggle="dropdown"  id="A1">Usuario logeado: <%= usuario%>
                                <b class="caret"></b></a>
                            <!--a class="dropdown-toggle" data-toggle="dropdown"  id="A1">Usuario logeado:<><b class="caret"></b></a-->
                            <ul id="Ul2" class="dropdown-menu">
                                <li id="Li2" class="dropdown"><a id="Li2" class="dropdown">
                                        <img src="img/empleado.png" alt="40" width="60"/>
                                    </a></li>
                                <li id="Li2" class="dropdown"><a id="Li2" class="dropdown"><%= usuario%></a></li>
                                <li id="Li2" class="dropdown"><a >usuario@gmail.com</a></li>
                                <form action="controllerValidar" method="POST">
                                    <li><button name="accionL" value="Salir" class="dropdown-item" href="#">Salir</button></li>
                                </form>                 
                            </ul>
                        </li>
                    </ul>
                    <!---------->       
                </div>
            </div>
        </nav>
        <!--<div class="m-4" style="height: 550px">
            <iframe name="myFrame" style="height: 100%; width: 100%; border: none"></iframe>
        </div>-->
        <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>-->   
    </body>
</html>
<% } %>