
package controladores;

import dao.daoRol;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Rol;


public class NewControlador extends HttpServlet {

    Rol rl = new Rol();
    daoRol drol = new daoRol();
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //response.setContentType("text/html;charset=UTF-8");
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if(menu.equals("Principal")){
            request.getRequestDispatcher("newPlantilla.jsp").forward(request, response);
        }
        if(menu.equals("rol")){
            switch (accion){
                case "listar":
                    List lista = drol.listar();
                    request.setAttribute("roles", lista);
                    break;
                case "agregar":
                    break;
                case "editar":
                    break;
                case "eliminar":
                    break;                
                default:
                    throw new AssertionError();
            }
            request.getRequestDispatcher("Seguridad/Roles/newRoles.jsp").forward(request, response);
        }
        /*
        switch (accion){
            case "Principal":
                request.getRequestDispatcher("newPlantilla.jsp").forward(request, response);
                break;
            case "rol":
                request.getRequestDispatcher("Seguridad/Roles/newRoles.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
        }*/
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
