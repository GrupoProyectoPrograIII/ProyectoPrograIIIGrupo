<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Aplicación Web</title>
        <link href="Styles/Site.css" rel="stylesheet" type="text/css"/>
        <link href="Content/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="Scripts/jquery-1.9.1.min.js" type="text/javascript"></script>
        <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
    </head>
    <body>
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

                    <div class="navbar-header" style=" align: center;">
                        <a class="navbar-brand" href="index.jsp">Inicio</a>
                        <ul class="nav navbar-nav">                    
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
                                <a href="login.jsp" id="A2">Login</a>
                            </li>   
                        </ul>  
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

