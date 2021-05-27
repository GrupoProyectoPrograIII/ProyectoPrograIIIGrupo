package controladores;

import dao.DaoInventario;
import dao.DaoModulo;
import dao.DaoPermiso;
import dao.DaoRol;
import dao.DaoUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Inventario;
import modelos.Modulo;
import modelos.Permiso;
import modelos.Rol;
import modelos.Usuario;

@WebServlet(name = "controllerReporte", urlPatterns = {"/controllerReporte"})
public class controllerReporte extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //RequestDispatcher vista = request.getRequestDispatcher("index.jsp"); //invoca de modo directo un recurso web
        //vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String listar = "Reportes/";
        String acceso = "";
        String action = request.getParameter("accion");

        DaoUsuario daoUsuario = new DaoUsuario();
        DaoRol daoRol = new DaoRol();
        DaoPermiso daoPermiso = new DaoPermiso();
        DaoModulo daoModulo = new DaoModulo();
        DaoInventario daoInventario = new DaoInventario();

        Usuario user = new Usuario();
        Permiso permiso = new Permiso();
        Modulo modulo = new Modulo();
        Rol rol = new Rol();
        Inventario inv = new Inventario();

        List<Usuario> lstUsuario = daoUsuario.listar();
        List<Modulo> lstModulo = daoModulo.listar();
        List<Rol> lstRol = daoRol.listar();
        List<Permiso> lstPermiso = daoPermiso.listar();

        switch (action) {
             case "readIG":
                acceso = listar + "InventarioGeneral.jsp";
                break;
            case "readIP":
                acceso = listar + "InventarioParcial.jsp";
                break;
            case "readC":
                acceso = listar + "Cierre.jsp";
                break;
            case "readMC":
                acceso = listar + "MonitorCaja.jsp";
                break;
            case "agregarIG":
                acceso = listar + "InventarioGeneral.jsp";
                break;
            case "insertarInventario":
                inv = new Inventario();
                inv.setCantidad(Double.parseDouble(request.getParameter("txtcantidad")));
                inv.setCosto_uni(Double.parseDouble(request.getParameter("txtcosto")));
                inv.setId_categoria(Integer.parseInt(request.getParameter("txtidcat")));
                inv.setDescripcion(request.getParameter("txtdescripcion"));
                inv.setProveedor(request.getParameter("txtproveedor"));
                inv.setStock(Integer.parseInt(request.getParameter("txtstock")));
                inv.setUnidad(request.getParameter("txtunidad"));
                
                if("".equals(inv.getCantidad()) || "".equals(inv.getCodigo_pro()) || "".equals(inv.getCosto_uni()) || "".equals(inv.getDescripcion()) || "".equals(inv.getId_categoria()) || "".equals(inv.getProveedor()) || "".equals(inv.getStock()) || "".equals(inv.getUnidad())){
                    request.setAttribute("vacio", 1);
                }else{
                    if (daoInventario.insertar_general(inv) && daoInventario.insertar_detalle(inv)) {
                        request.setAttribute("guardar", 1);
                    } else {
                        request.setAttribute("guardar", 0);
                    }
                }
                
                acceso = listar + "InventarioGeneral.jsp";
                break;
            case "agregarC":
                acceso = listar + "Cierre.jsp";
                break;
            case "agregarMC":
                acceso = listar + "MonitorCaja.jsp";
                break;
            case "editarIG":
                request.setAttribute("codigo", request.getParameter("codigo_pro"));
                acceso = listar + "AddInventario.jsp";
                break;
            case "modificarInventario":
                inv = new Inventario();
                inv.setCodigo_pro(Integer.parseInt(request.getParameter("txtcodigo")));
                inv.setCantidad(Double.parseDouble(request.getParameter("txtcantidad")));
                inv.setCosto_uni(Double.parseDouble(request.getParameter("txtcosto")));
                inv.setId_categoria(Integer.parseInt(request.getParameter("txtidcat")));
                inv.setDescripcion(request.getParameter("txtdescripcion"));
                inv.setProveedor(request.getParameter("txtproveedor"));
                inv.setStock(Integer.parseInt(request.getParameter("txtstock")));
                inv.setUnidad(request.getParameter("txtunidad"));
                
                if("".equals(inv.getCantidad()) || "".equals(inv.getCodigo_pro()) || "".equals(inv.getCosto_uni()) || "".equals(inv.getDescripcion()) || "".equals(inv.getId_categoria()) || "".equals(inv.getProveedor()) || "".equals(inv.getStock()) || "".equals(inv.getUnidad())){
                    request.setAttribute("vacio", 1);
                }else{
                    if (daoInventario.insertar_general(inv) && daoInventario.insertar_detalle(inv)) {
                        request.setAttribute("modificar", 1);
                    } else {
                        request.setAttribute("modificar", 0);
                    }
                }
                
                acceso = listar + "InventarioGeneral.jsp";
                break;
            case "editarC":
                acceso = listar + "Cierre.jsp";
                break;
            case "editarMC":
                acceso = listar + "MonitorCaja.jsp";
                break;
            case "eliminarIG":
                inv = new Inventario();
                inv.setCodigo_pro(Integer.parseInt(request.getParameter("codigo")));
                
                if(daoInventario.eliminar(inv)){
                    request.setAttribute("eliminar", 1);
                }else{
                    request.setAttribute("eliminar", 0);
                }
                acceso = listar + "InventarioGeneral.jsp";
                break;
            case "eliminarC":
                acceso = listar + "Cierre.jsp";
                break;
            case "eliminarMC":
                acceso = listar + "MonitorCaja.jsp";
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
