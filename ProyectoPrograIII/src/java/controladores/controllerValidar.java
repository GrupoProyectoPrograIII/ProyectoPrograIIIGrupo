package controladores;

import dao.daoEmpleado;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.daoUsuario;
import modelos.Empleado;
import modelos.Usuario;

public class controllerValidar extends HttpServlet {

    daoUsuario duser = new daoUsuario();
    Usuario usr = new Usuario();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet controllerValidar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet controllerValidar at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("accion");

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
                } else if (usr.getIdRol()== 1) {
                    request.getSession().setAttribute("verificar", usr.getUser());
                    request.setAttribute("usuario", usr);
                    request.getRequestDispatcher("plantillaAdm.jsp").forward(request, response);
                } else if ("2".equals(usr.getIdRol())) {
                    request.getSession().setAttribute("verificar", usr.getUser());
                    request.setAttribute("usuario", usr);
                    request.getRequestDispatcher("plantillaGfe.jsp").forward(request, response);
                } else if ("3".equals(usr.getIdRol())) {
                    request.getSession().setAttribute("verificar", usr.getUser());
                    request.setAttribute("usuario", usr);
                    request.getRequestDispatcher("plantillaEmp.jsp").forward(request, response);
                } else {
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                System.out.println(usr.getIdRol());
                System.out.println("User:" + usr.getUser() + "nombre:" + usr.getNombre() + "Apellido:" + usr.getApellido() + " Password:" + usr.getPass() + " Rol:" + usr.getIdRol() + " Activo:" + usr.getIsActivo());
            }

        } else if (action.equalsIgnoreCase("salir")) {
            request.removeAttribute("usuario");
            request.getSession().removeAttribute("verificar");
            request.getSession().invalidate();
            response.sendRedirect("index.jsp");
        }
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
