package controladores;

import dao.DaoModulo;
import dao.DaoPermiso;
import dao.DaoRol;
import dao.DaoUsuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Modulo;
import modelos.Permiso;
import modelos.Rol;
import modelos.Usuario;

@WebServlet(name = "controllerSeguridad", urlPatterns = {"/controllerSeguridad"})
public class controllerSeguridad extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher vista = request.getRequestDispatcher("index.jsp"); //invoca de modo directo un recurso web
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String listar = "Seguridad/";
        String acceso = "";
        String action = request.getParameter("accion");

        DaoUsuario daoUsuario = new DaoUsuario();
        DaoRol daoRol = new DaoRol();
        DaoPermiso daoPermiso = new DaoPermiso();
        DaoModulo daoModulo = new DaoModulo();

        Usuario user = new Usuario();
        Permiso permiso = new Permiso();
        Modulo modulo = new Modulo();
        Rol rol = new Rol();

        List<Usuario> lstUsuario = daoUsuario.listar();
        List<Modulo> lstModulo = daoModulo.listar();
        List<Rol> lstRol = daoRol.listar();
        List<Permiso> lstPermiso = daoPermiso.listar();

        switch (action) {
            case "readU":

                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Usuarios.jsp";
                break;

            case "agregarU":

                user = new Usuario();
                user.setUser(request.getParameter("Auser"));
                user.setNombre(request.getParameter("Anombre"));
                user.setApellido(request.getParameter("Aapellido"));
                user.setPass(request.getParameter("Apassword"));
                user.setIdRol(Integer.parseInt(request.getParameter("Arole")));

                if ("".equals(user.getNombre()) || "".equals(user.getApellido()) || "".equals(user.getUser()) || "".equals(user.getPass()) || "".equals(user.getRol())){
                    request.setAttribute("vacio", 1);
                } else {
                    if (daoUsuario.insertar(user)) {
                        request.setAttribute("guardar", 1);
                    } else {
                        request.setAttribute("guardar", 0);
                    }
                }

                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Usuarios.jsp";

                break;
            case "editarU":

                user = new Usuario();
                user.setIdUser(Integer.parseInt(request.getParameter("Eiduser")));
                user.setUser(request.getParameter("Euser"));
                user.setNombre(request.getParameter("Enombre"));
                user.setApellido(request.getParameter("Eapellido"));
                user.setPass(request.getParameter("Epassword"));
                user.setIdRol(Integer.parseInt(request.getParameter("Erole")));

                if ("".equals(user.getNombre()) || "".equals(user.getApellido()) || "".equals(user.getUser()) || "".equals(user.getPass()) || "".equals(user.getRol())) {
                    request.setAttribute("vacio", 1);
                } else {
                    if (daoUsuario.modificar(user)) {
                        request.setAttribute("modificar", 1);
                    } else {
                        request.setAttribute("modificar", 0);
                    }
                }

                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Usuarios.jsp";
                break;

            case "eliminarU":

                user = new Usuario();
                user.setIdUser(Integer.parseInt(request.getParameter("Diduser")));

                if (daoUsuario.eliminar(user)) {
                    request.setAttribute("eliminar", 1);
                } else {
                    request.setAttribute("eliminar", 0);
                }

                lstRol = daoRol.listar();
                lstUsuario = daoUsuario.listar();
                request.setAttribute("rol", lstRol);
                request.setAttribute("user", lstUsuario);
                acceso = listar + "Usuarios.jsp";
                break;

            case "readR":

                lstRol = daoRol.listar();
                request.setAttribute("rol", lstRol);
                acceso = listar + "Roles.jsp";
                break;

            case "agregarR":
                rol = new Rol();
                rol.setNombre(request.getParameter("Anombre"));
                rol.setDescripcion(request.getParameter("Adescripcion"));
                
                if ("".equals(rol.getNombre()) || "".equals(rol.getDescripcion())) {
                    request.setAttribute("vacio", 1);
                } else {
                    if (daoRol.insertar(rol)) {
                        request.setAttribute("guardar", 1);
                    } else {
                        request.setAttribute("guardar", 0);
                    }
                }

                lstRol = daoRol.listar();
                request.setAttribute("rol", lstRol);
                acceso = listar + "Roles.jsp";
                break;
            case "editarR":
                rol = new Rol();
                rol.setIdRol(Integer.parseInt(request.getParameter("Eidrol")));
                rol.setNombre(request.getParameter("Enombre"));
                rol.setDescripcion(request.getParameter("Edescripcion"));

                if ("".equals(rol.getNombre()) || "".equals(rol.getDescripcion())){
                    request.setAttribute("vacio", 1);
                } else {
                    if (daoRol.modificar(rol)) {
                        request.setAttribute("modificar", 1);
                    } else {
                        request.setAttribute("modificar", 0);
                    }
                }

                lstRol = daoRol.listar();
                request.setAttribute("rol", lstRol);
                acceso = listar + "Roles.jsp";
                break;
            case "eliminarR":
                rol.setIdRol(Integer.parseInt(request.getParameter("Didrol")));

                if (daoRol.eliminar(rol)) {
                    request.setAttribute("eliminar", 1);
                } else {
                    request.setAttribute("eliminar", 0);
                }

                lstRol = daoRol.listar();
                request.setAttribute("rol", lstRol);
                acceso = listar + "Roles.jsp";
                break;
            case "readP":
                lstRol = daoRol.listar();
                lstModulo = daoModulo.listar();
                lstPermiso = daoPermiso.listar();
                request.setAttribute("permiso", lstPermiso);
                request.setAttribute("rol", lstRol);
                request.setAttribute("modulo", lstModulo);
                acceso = listar + "Permisos.jsp";
                break;
            case "agregarP":
                permiso = new Permiso();
                permiso.setIdModulo(Integer.parseInt(request.getParameter("Amodulo")));
                permiso.setIdRol(Integer.parseInt(request.getParameter("Arol")));

                if ("".equals(permiso.getIdModulo()) || "".equals(permiso.getIdRol())) {
                    request.setAttribute("vacio", 1);
                } else {
                    if (daoPermiso.insertar(permiso)) {
                        request.setAttribute("guardar", 1);
                    } else {
                        request.setAttribute("guardar", 0);
                    }
                }

                lstRol = daoRol.listar();
                lstModulo = daoModulo.listar();
                lstPermiso = daoPermiso.listar();
                request.setAttribute("permiso", lstPermiso);
                request.setAttribute("rol", lstRol);
                request.setAttribute("modulo", lstModulo);
                acceso = listar + "Permisos.jsp";
                break;
            case "editarP":
                permiso = new Permiso();
                permiso.setIdPermiso(Integer.parseInt(request.getParameter("Eidpermiso")));
                permiso.setIdModulo(Integer.parseInt(request.getParameter("Emodulo")));
                permiso.setIdRol(Integer.parseInt(request.getParameter("Erol")));

                if ("".equals(permiso.getIdModulo()) || "".equals(permiso.getIdRol())){
                    request.setAttribute("vacio", 1);
                } else {
                    if (daoPermiso.modificar(permiso)) {
                        request.setAttribute("modificar", 1);
                    } else {
                        request.setAttribute("modificar", 0);
                    }
                }

                lstRol = daoRol.listar();
                lstModulo = daoModulo.listar();
                lstPermiso = daoPermiso.listar();
                request.setAttribute("permiso", lstPermiso);
                request.setAttribute("rol", lstRol);
                request.setAttribute("modulo", lstModulo);
                acceso = listar + "Permisos.jsp";
                break;
            case "eliminarP":
                permiso = new Permiso();
                permiso.setIdPermiso(Integer.parseInt(request.getParameter("Didpermiso")));

                if (daoPermiso.eliminar(permiso)) {
                    request.setAttribute("eliminar", 1);
                } else {
                    request.setAttribute("eliminar", 0);
                }

                lstRol = daoRol.listar();
                lstModulo = daoModulo.listar();
                lstPermiso = daoPermiso.listar();
                request.setAttribute("permiso", lstPermiso);
                request.setAttribute("rol", lstRol);
                request.setAttribute("modulo", lstModulo);
                acceso = listar + "Permisos.jsp";
                break;
            case "readM":
                lstModulo = daoModulo.listar();
                request.setAttribute("modulo", lstModulo);
                acceso = listar + "Modulos.jsp";
                break;
            case "agregarM":
                modulo = new Modulo();
                modulo.setNombre(request.getParameter("Anombre"));
                modulo.setDescripcion(request.getParameter("Adescripcion"));
                modulo.setPath(request.getParameter("Apath"));
                modulo.setNivel(Integer.parseInt(request.getParameter("Anivel")));
                modulo.setOrden(Integer.parseInt(request.getParameter("Aorden")));
                modulo.setIdModuloPadre(Integer.parseInt(request.getParameter("AmoduloPadre")));

                if ("".equals(modulo.getNombre()) || "".equals(modulo.getDescripcion()) || "".equals(modulo.getPath()) || "".equals(modulo.getOrden()) || "".equals(modulo.getNivel()) || "".equals(modulo.getIdModuloPadre())) {
                    request.setAttribute("vacio", 1);
                } else {
                    if (daoModulo.insertar(modulo)) {
                        request.setAttribute("guardar", 1);
                    } else {
                        request.setAttribute("guardar", 0);
                    }
                }

                lstModulo = daoModulo.listar();
                request.setAttribute("modulo", lstModulo);
                acceso = listar + "Modulos.jsp";
                break;
            case "editarM":
                modulo = new Modulo();
                modulo.setIdModulo(Integer.parseInt(request.getParameter("Eidmodulo")));
                modulo.setNombre(request.getParameter("Enombre"));
                modulo.setDescripcion(request.getParameter("Edescripcion"));
                modulo.setPath(request.getParameter("Epath"));
                modulo.setNivel(Integer.parseInt(request.getParameter("Enivel")));
                modulo.setOrden(Integer.parseInt(request.getParameter("Eorden")));
                modulo.setIdModuloPadre(Integer.parseInt(request.getParameter("EmoduloPadre")));

                if ("".equals(modulo.getNombre()) || "".equals(modulo.getDescripcion()) || "".equals(modulo.getPath()) || "".equals(modulo.getOrden()) || "".equals(modulo.getNivel()) || "".equals(modulo.getIdModuloPadre())) {
                    request.setAttribute("vacio", 1);
                } else {
                    if (daoModulo.modificar(modulo)) {
                        request.setAttribute("modificar", 1);
                    } else {
                        request.setAttribute("modificar", 0);
                    }
                }

                lstModulo = daoModulo.listar();
                request.setAttribute("modulo", lstModulo);
                acceso = listar + "Modulos.jsp";
                break;
            case "eliminarM":
                modulo = new Modulo();
                modulo.setIdModulo(Integer.parseInt(request.getParameter("Didmodulo")));
                
                if (daoModulo.eliminar(modulo)) {
                    request.setAttribute("eliminar", 1);
                } else {
                    request.setAttribute("eliminar", 0);
                }

                lstModulo = daoModulo.listar();
                request.setAttribute("modulo", lstModulo);
                acceso = listar + "Modulos.jsp";
                break;
        }
        RequestDispatcher vista = request.getRequestDispatcher(acceso); //invoca de modo directo un recurso web
        vista.forward(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
