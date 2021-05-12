<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta http-equiv='cache-control' content='no-cache'>
<META HTTP-EQUIV="Cache-Control" CONTENT="no-store">
<meta http-equiv='expires' content='0'>
<meta http-equiv='pragma' content='no-cache'>

<%
    if (request.getParameter("cerrar") != null) {
        session.invalidate();
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
        <title>Autenticacion</title>        
    </head>
    <body>
    <c:if test="${success == 0}">
        <p id="error"><script type="text/javascript">
            alert("Usuario o Contraseña incorrecto");
            </script></p>
    </c:if>
    <div class="container mt-4 col-lg-4">
        <div class="card col-sm-10">
            <div class="card-body">
                <form class="form-sign" action="controllerValidar" method="POST" autocomplete="off">
                    <div class="form-group text-center">
                        <h3>Login</h3>
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
</body>
</html>
