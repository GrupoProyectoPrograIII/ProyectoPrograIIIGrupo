<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="text/css" href="img/icono_logo.ico">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
        <title>Ingresos</title>
    </head>
    <body background="img/fondo2_index.jpg">
        <div class="container mt-4 col-lg-4">
            <div class="card col-sm-10">
                <div class="card-body">
                    <form class="form-sign" action="controllerValidar" method="POST" autocomplete="off">
                        <div class="form-group text-center">
                            <img src="img/diner-restaurant-logo.jpg" alt="70" width="170"/>
                            <br><label>Bienvenido al sistema</label>
                        </div>
                        <div class="form-group">
                            <label>Usuario: </label>
                            <input type="text" name="txtuser" class="form-control">
                        </div>
                        <br>
                        <div class="form-group">
                            <label>Contraseña: </label>
                            <input type="password" name="txtpass" class="form-control">
                        </div>
                        <div>
                            <br><input type="submit" name="accionL" value="ingresar" class="btn btn-primary btn-block">
                        </div>  
                    </form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-p34f1UUtsS3wqzfto5wAAmdvj+osOnFyQFpp4Ua3gs/ZVWx6oOypYoCJhGGScy+8" crossorigin="anonymous"></script>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </body>
    <c:if test="${success == 0}">
        <script type="text/javascript">
            swal.fire({
                title: "¡Error!",
                text: "Los datos ingresados no existen o son incorrectos",
                icon: 'error', //warning,info,question,error,success
                confirmButtonText: "Aceptar",
                footer: "¡Intentelo nuevamente o contacte al administrador!"
            });
        </script>
    </c:if>
    <c:if test="${success == 1}">
        <script type="text/javascript">
            swal.fire({
                title: "¡Advertencia!",
                text: "Debe llenar los campos solicitados",
                icon: 'warning', //warning,info,question,error,success
                confirmButtonText: "Aceptar"
            });
        </script>
    </c:if>
</html>