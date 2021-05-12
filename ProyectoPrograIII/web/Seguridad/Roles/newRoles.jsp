<%-- 
    Document   : newRoles
    Created on : May 11, 2021, 11:04:17 PM
    Author     : family.user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
        <title>Roles</title>
    </head>
    <body>
        <h1>Roles de usuario</h1>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="NewControlador?menu=rol" method="POST">
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" value="" name="txtNombre" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Descripción</label>
                            <input type="text" value="" name="txtDescrip" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Estado</label>
                            <input type="text" value="" name="txtEstado" class="form-control">
                        </div>

                        <br><br>
                        <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                        <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                    </form>
                </div>            
            </div>
            <div class="col-sm-8">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <td>ID</td>                            
                            <th>NOMBRES</th>
                            <th>DESCRIPCION</th>
                            <th>ESTADO</th>                               
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="rol" items="${roles}">
                        <tr>
                            <td>${rol.getIdRol()}</td>                            
                            <td>${rol.getNombre()}</td>
                            <td>${rol.getDescripcion()}</td>
                            <td>${rol.getIsActivo()}</td>                            
                            <td>
                                <a class="btn btn-warning" href="NewControlador?menu=rol&accion=editar&id=${rol.getIdRol()}">Editar</a>
                                <a class="btn btn-danger" href="NewControlador?menu=rol&accion=eliminar&id=${rol.getIdRol()}">Borrar</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>
    </body>
</html>
