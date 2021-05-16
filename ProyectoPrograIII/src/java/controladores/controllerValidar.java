package controladores;

import dao.DaoUsuario;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modelos.Usuario;

public class controllerValidar extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("plantilla.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
        String action = request.getParameter("accionL");
        DaoUsuario duser = new DaoUsuario();
        Usuario usr = new Usuario();
        if (action.equalsIgnoreCase("ingresar")) {
            String user = request.getParameter("txtuser");
            String pass = request.getParameter("txtpass");
            if ("".equals(user) || "".equals(pass)) {
                request.setAttribute("success", 1);
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                usr = duser.validar(user, pass);
                if (usr.getUser() == null) {
                    request.setAttribute("success", 0);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else if (usr.getUser() != null) {
                    request.getSession().setAttribute("usuario", usr.getUser());
                    request.getSession().setAttribute("nombre", usr.getNombre());
                    request.getSession().setAttribute("apellido", usr.getApellido());
                    int idrol = usr.getIdRol();
                    String ver = String.valueOf(idrol);
                    request.getSession().setAttribute("rol", ver);
                    request.getSession().setAttribute("roles", usr.getRol());
                    //request.getRequestDispatcher("newPlantilla.jsp").forward(request, response);
                    request.getRequestDispatcher("plantilla.jsp").forward(request, response);
                    //request.setAttribute("usuario", usr);
                }
            }

        } else if (action.equalsIgnoreCase("salir")) {
            //request.removeAttribute("usuario");
            request.getSession().removeAttribute("nombre");
            request.getSession().removeAttribute("apellido");
            request.getSession().removeAttribute("usuario");
            request.getSession().invalidate();

            response.setHeader("Cache-Control", "no-cache");
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Pragma", "no-cache");
            response.setDateHeader("Expires", 0);

            response.sendRedirect("index.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
