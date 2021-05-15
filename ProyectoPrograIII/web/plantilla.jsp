
<%@page import="modelos.Permiso"%>
<%@page import="modelos.Rol"%>
<%@page import="modelos.Usuario"%>
<%@page import="modelos.Modulo"%>
<%@page import="java.util.List"%>
<%@page import="dao.daoUsuario"%>
<%@page import="dao.daoRol"%>
<%@page import="dao.daoModulo"%>
<%@page import="dao.daoPermiso"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    /*response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);*/

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
    daoPermiso daoP = new daoPermiso();
    //List<Usuario> lstUsuario = (List) request.getAttribute("user");
    //List<Rol> lstRol = (List) request.getSession().getAttribute("rol");
    //List<Modulo> lstModulo = (List) request.getAttribute("modulo");
    List<Permiso> lstPermiso = daoP.listar();
    //Usuario user = new Usuario();
    Rol rol = new Rol();
    //Modulo modulo = new Modulo();
    //Permiso permiso = new Permiso();
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
                <!---------->
                <div class="navbar-header">
                    <a class="navbar-brand" href="plantilla.jsp">Inicio</a>
                </div>
                <!---------->


                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <%// for (Permiso permiso : lstPermiso) { %>
                        <!-----Mantenimientos (Usar este metodo de dropdown en los demas)----->
                        <li id="Li2" class="dropdown" >
                            <% for (Permiso permiso : lstPermiso) { %>
                            <%
                                if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Mantenimientos")) {
                            %>

                            <a href="" class="dropdown-toggle" data-toggle="dropdown"  id="A1">Mantenimientos<b class="caret"></b></a>
                            <%%><ul id="Li2" class="dropdown-menu">
                                <%if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Areas")) {
                                        System.out.println(roles + ":" + permiso.getRol() + "/" + permiso.getModulo());
                                    } else {%><li>
                                    <form style="display: none" action="controllerModulo?accion=read" method="post">
                                        <button type="submit" id="Areas"> </button>
                                    </form>
                                    <a id="A2"><label for="Areas">Areas</label></a></li>
                                    <%}%>
                                    <%if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Clientes")) {
                                            System.out.println(roles + ":" + permiso.getRol() + "/" + permiso.getModulo());
                                        } else {%><li>
                                    <form style="display: none" action="controllerModulo?accion=read" method="post">
                                        <button type="submit" id="Clientes"> </button>
                                    </form>
                                    <a id="A2"><label for="Clientes">Clientes</label></a></li>
                                    <%}%>
                                    <%if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Mesas")) {
                                            System.out.println(roles + ":" + permiso.getRol() + "/" + permiso.getModulo());
                                        } else {%><li>
                                    <form style="display: none" action="controllerModulo?accion=read" method="post">
                                        <button type="submit" id="Mesas"> </button>
                                    </form>
                                    <a id="A2"><label for="Mesas">Mesas</label></a></li>
                                    <%}%>
                                    <%if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Monitor")) {
                                            System.out.println(roles + ":" + permiso.getRol() + "/" + permiso.getModulo());
                                        } else {%><li>
                                    <form style="display: none" action="controllerModulo?accion=read" method="post">
                                        <button type="submit" id="Monitor"> </button>
                                    </form>
                                    <a id="A2"><label for="Monitor">Monitor</label></a></li>
                                    <%}%>
                                    <%if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Producto Combinado")) {
                                            System.out.println(roles + ":" + permiso.getRol() + "/" + permiso.getModulo());
                                        } else {%><li>
                                    <form style="display: none" action="controllerModulo?accion=read" method="post">
                                        <button type="submit" id="Producto Combinado"> </button>
                                    </form>
                                    <a id="A2"><label for="Producto Combinado">Producto Combinado</label></a></li>
                                    <%}%>
                                    <%if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Productos")) {
                                            System.out.println(roles + ":" + permiso.getRol() + "/" + permiso.getModulo());
                                        } else {%><li>
                                    <form style="display: none" action="controllerModulo?accion=read" method="post">
                                        <button type="submit" id="Productos"> </button>
                                    </form>
                                    <a id="A2"><label for="Productos">Productos</label></a></li>
                                    <%}%>
                                    <%if (permiso.getRol().equals(roles) && permiso.getModulo().equals("Proveedores")) {
                                            System.out.println(roles + ":" + permiso.getRol() + "/" + permiso.getModulo());
                                        } else {%><li>
                                    <form style="display: none" action="controllerModulo?accion=read" method="post">
                                        <button type="submit" id="Proveedores"> </button>
                                    </form>
                                    <a id="A2"><label for="Proveedores">Proveedores</label></a></li>
                                    <%}%>
                                    <%if (permiso.getRol().equals(roles) || permiso.getModulo().equals("Tipo Producto")) {
                                            System.out.println(roles + ":" + permiso.getRol() + "/" + permiso.getModulo());
                                    %>
                                <li>
                                    <form style="display: none" action="controllerModulo?accion=read" method="post">
                                        <button type="submit" id="Tipo Producto"> </button>
                                    </form>
                                    <a id="A2"><label for="Tipo Producto">Tipo Producto</label></a></li>
                                    <%} else {%>
                                    <%}%>
                            </ul>
                            <%} else {
                                    }
                                }
                            %>

                        </li>

//                        
                        <!---------->
                    </ul>

                    <!--<ul class="nav navbar-nav navbar-right">
                        <li><a href="controllerValidar?accion=cerrar">Cerrar Sesion</a></li>
                    </ul>-->


                    <!-----Esto es solo para los datos del usuario----->
                    <ul class="nav navbar-nav navbar-right">
                        <li id="Li2" class="dropdown" >
                            <a class="dropdown-toggle" data-toggle="dropdown"  id="A1">Usuario logeado: <%= nom + " " + ape%>
                                <b class="caret"></b></a>
                            <!--a class="dropdown-toggle" data-toggle="dropdown"  id="A1">Usuario logeado:<><b class="caret"></b></a-->
                            <ul id="Ul2" class="dropdown-menu">
                                <li id="Li2" class="dropdown"><a id="Li2" class="dropdown">
                                        <img src="img/user.png" alt="40" width="60"/>
                                    </a></li>
                                <li id="a2" class="dropdown"><a id="a2" class="dropdown"><%= usuarios%></a></li>
                                <li id="Li2" class="dropdown"><a id="Li2" class="dropdown"><%= roles%></a></li>
                                <li id="a2" class="dropdown"><a>usuario@gmail.com</a></li>
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
        <!--<div class="m-4" style="height: 550px">
            <iframe name="myFrame" style="height: 100%; width: 100%; border: none"></iframe>
        </div>-->
        <!--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>-->   
    </body>
</html>
