/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controladores;

import dao.DaoModulo;
import dao.DaoMonitor;
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
import modelos.Modulo;
import modelos.Monitor;
import modelos.Permiso;
import modelos.Rol;
import modelos.Usuario;

@WebServlet(name = "controllerProceso", urlPatterns = {"/controllerProceso"})
public class controllerProceso extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //RequestDispatcher vista = request.getRequestDispatcher("index.jsp"); //invoca de modo directo un recurso web
        //vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String listar = "Procesos/";
        String acceso = "";
        String action = request.getParameter("accion");

        DaoUsuario daoUsuario = new DaoUsuario();
        DaoRol daoRol = new DaoRol();
        DaoPermiso daoPermiso = new DaoPermiso();
        DaoModulo daoModulo = new DaoModulo();
        DaoMonitor daoMonitor = new DaoMonitor();

        Usuario user = new Usuario();
        Permiso permiso = new Permiso();
        Modulo modulo = new Modulo();
        Rol rol = new Rol();
        Monitor mon = new Monitor();

        List<Usuario> lstUsuario = daoUsuario.listar();
        List<Modulo> lstModulo = daoModulo.listar();
        List<Rol> lstRol = daoRol.listar();
        List<Permiso> lstPermiso = daoPermiso.listar();
        List<Monitor> lstMonitor = daoMonitor.listar();

        switch (action) {
            case "readDI":
                acceso = listar + "DescargaInventario.jsp";
                break;
            case "readFC":
                acceso = listar + "FacturasCredito.jsp";
                break;
            case "readPP":
                acceso = listar + "PagoPedido.jsp";
                break;
            case "readCC":
                acceso = listar + "CorteCaja.jsp";
                break;
            case "agregarDI":
                acceso = listar + "DescargaInventario.jsp";
                break;
            case "agregarFC":
                acceso = listar + "FacturasCredito.jsp";
                break;
            case "agregarPP":
                acceso = listar + "PagoPedido.jsp";
                break;
            case "agregarCC":
                acceso = listar + "CorteCaja.jsp";
                break;
            case "editarDI":
                acceso = listar + "DescargaInventario.jsp";
                break;
            case "editarFC":
                acceso = listar + "FacturasCredito.jsp";
                break;
            case "editarPP":
                acceso = listar + "PagoPedido.jsp";
                break;
            case "editarCC":
                acceso = listar + "CorteCaja.jsp";
                break;
            case "eliminarDI":
                acceso = listar + "DescargaInventario.jsp";
                break;
            case "eliminarFC":
                acceso = listar + "FacturasCredito.jsp";
                break;
            case "eliminarPP":
                acceso = listar + "PagoPedido.jsp";
                break;
            case "eliminarCC":
                acceso = listar + "CorteCaja.jsp";
                break;
            case "seleccionarMon":
                mon = new Monitor();
                mon.setIdMonitor(Integer.parseInt(request.getParameter("codigo")));
                int ver = mon.getIdMonitor();
                String convertir = String.valueOf(ver);
                request.setAttribute("sele", convertir);
                acceso = listar + "Monitores.jsp";
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
