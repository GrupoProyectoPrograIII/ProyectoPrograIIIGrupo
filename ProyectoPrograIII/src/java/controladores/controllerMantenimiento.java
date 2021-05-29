package controladores;

import dao.DaoArea;
import dao.DaoCliente;
import dao.DaoDetallePedido;
import dao.DaoMesa;
import dao.DaoModulo;
import dao.DaoMonitor;
import dao.DaoPedido;
import dao.DaoPermiso;
import dao.DaoProducto;
import dao.DaoProductoCombo;
import dao.DaoProveedor;
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
import modelos.Area;
import modelos.Cliente;
import modelos.DetallePedido;
import modelos.Mesa;
import modelos.Modulo;
import modelos.Monitor;
import modelos.Pedido;
import modelos.Permiso;
import modelos.Producto;
import modelos.ProductoCombo;
import modelos.Proveedor;
import modelos.Rol;
import modelos.Usuario;

@WebServlet(name = "controllerMantenimiento", urlPatterns = {"/controllerMantenimiento"})
public class controllerMantenimiento extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher vista = request.getRequestDispatcher("index.jsp"); //invoca de modo directo un recurso web
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String listar = "Mantenimientos/";
        String acceso = "";
        String action = request.getParameter("accion");

        DaoUsuario daoUsuario = new DaoUsuario();
        DaoRol daoRol = new DaoRol();
        DaoPermiso daoPermiso = new DaoPermiso();
        DaoModulo daoModulo = new DaoModulo();
        DaoArea daoArea = new DaoArea();
        DaoMesa daoMesa = new DaoMesa();
        DaoCliente daoCliente = new DaoCliente();
        DaoMonitor daoMonitor = new DaoMonitor();
        DaoDetallePedido daoDp = new DaoDetallePedido();
        DaoPedido daoPedido = new DaoPedido();
        DaoProductoCombo daoProductoCombo = new DaoProductoCombo();
        DaoProveedor daoProveedor = new DaoProveedor();
        DaoProducto daoProducto = new DaoProducto();
        

        Usuario user = new Usuario();
        Permiso permiso = new Permiso();
        Modulo modulo = new Modulo();
        Rol rol = new Rol();
        Mesa mesa = new Mesa();
        Area area = new Area();
        Cliente cliente = new Cliente();
        Monitor monitor = new Monitor();
        DetallePedido dp = new DetallePedido();
        Pedido pedido = new Pedido();
        Producto producto = new Producto();
        ProductoCombo productoCombo = new ProductoCombo();
        Proveedor proveedor = new Proveedor();

        List<Usuario> lstUsuario = daoUsuario.listar();
        List<Modulo> lstModulo = daoModulo.listar();
        List<Rol> lstRol = daoRol.listar();
        List<Permiso> lstPermiso = daoPermiso.listar();
        List<Area> lstArea = daoArea.listar();
        List<Mesa> lstMesa = daoMesa.listar();
        List<Cliente> lstCliente = daoCliente.listar();
        List<Monitor> lstMonitor = daoMonitor.listar();
        List<DetallePedido> lstDp = daoDp.listar();
        List<Pedido> lstPedido = daoPedido.listar();
        List<ProductoCombo> lstProductoCombo = daoProductoCombo.listar();
        List<Proveedor> lstProveedor = daoProveedor.listar();
        List<Producto> lstProducto = daoProducto.listar();
        
        

        switch(action){
        //--------- CRUD AREAS  --------------------------------  
            case "readA":
                lstArea = daoArea.listar();
                request.setAttribute("area", lstArea);
                acceso = listar + "Areas.jsp";
                break;
                
             case "agregarA":
                area = new Area();
                area.setNombre(request.getParameter("Aarea"));
                area.setEstado(Integer.parseInt(request.getParameter("Aactivo")));
                daoArea.insertar(area);
                lstArea = daoArea.listar();
                request.setAttribute("area", lstArea);
                acceso = listar + "Areas.jsp";
                break;
                
            case "editarA":
                area = new Area();
                area.setIdArea(Integer.parseInt(request.getParameter("Eidarea")));
                area.setNombre(request.getParameter("Earea"));
                area.setEstado(Integer.parseInt(request.getParameter("Eactivo")));
                daoArea.modificar(area);
                lstArea = daoArea.listar();
                request.setAttribute("area", lstArea);                
                acceso = listar + "Areas.jsp";
                break;
                
            case "eliminarA":
                area = new Area();
                area.setIdArea(Integer.parseInt(request.getParameter("Didarea")));
                daoArea.eliminar(area);
                lstArea = daoArea.listar();                
                request.setAttribute("area", lstArea);
                acceso = listar + "Areas.jsp";
                break;                
            
        //------- CRUD MESAS -------------------------------------
                
            case "readM":
                lstArea = daoArea.listar();
                lstMesa = daoMesa.listar();
                request.setAttribute("lstArea", lstArea);
                request.setAttribute("lstMesa", lstMesa);
                acceso = listar + "Mesas.jsp";
                break;
                
            case "agregarM":
                mesa = new Mesa();
                mesa.setIdArea(Integer.parseInt(request.getParameter("Aarea")));
                mesa.setMesa(request.getParameter("Amesa"));
                mesa.setAsientos(Integer.parseInt(request.getParameter("Aasiento")));
                mesa.setIdEstado(Integer.parseInt(request.getParameter("Aactivo")));
                daoMesa.insertar(mesa);
                lstArea = daoArea.listar();
                lstMesa = daoMesa.listar();
                request.setAttribute("lstArea", lstArea);
                request.setAttribute("lstMesa", lstMesa);
                acceso = listar + "Mesas.jsp";
                break;
                
            case "editarM":
                mesa = new Mesa();
                mesa.setIdMesa(Integer.parseInt(request.getParameter("Eidmesa")));
                mesa.setIdArea(Integer.parseInt(request.getParameter("Earea")));
                mesa.setArea(request.getParameter("Edescripcion"));
                //mesa.setAreaDescrip(request.getParameter("Eareadescripcion"));
                mesa.setAsientos(Integer.parseInt(request.getParameter("Easiento")));
                mesa.setIdEstado(Integer.parseInt(request.getParameter("Eestado")));
                daoMesa.modificar(mesa);
                lstArea = daoArea.listar();
                lstMesa = daoMesa.listar();
                request.setAttribute("lstArea", lstArea);
                request.setAttribute("lstMesa", lstMesa);              
                acceso = listar + "Mesas.jsp";
                break;
                
            case "eliminarM":
                mesa = new Mesa();
                mesa.setIdMesa(Integer.parseInt(request.getParameter("Eidmesa")));
                daoMesa.eliminar(mesa);
                lstArea = daoArea.listar();
                lstMesa = daoMesa.listar();
                request.setAttribute("lstArea", lstArea);
                request.setAttribute("lstMesa", lstMesa);               
                acceso = listar + "Mesas.jsp";
                break;
                
        //-------- CRUD CLIENTE
                                     
            case "readC":
                lstCliente = daoCliente.listar();
                request.setAttribute("cliente", lstCliente);                
                acceso = listar + "Clientes.jsp";
                break;
                
            case "agregarC":
                cliente = new Cliente();
                cliente.setNombre(request.getParameter("Anombre"));
                cliente.setNit(request.getParameter("Anit"));
                cliente.setNickname(request.getParameter("Anick"));
                cliente.setDireccion(request.getParameter("Adireccion"));
                cliente.setTelefono(request.getParameter("Atelefono"));
                daoCliente.insertar(cliente);
                lstCliente = daoCliente.listar();                
                request.setAttribute("cliente", lstCliente);                
                acceso = listar + "Clientes.jsp";
                break;
                
            case "editarC":
                cliente = new Cliente();
                cliente.setIdCliente(Integer.parseInt(request.getParameter("Eidcliente")));
                cliente.setNombre(request.getParameter("Enombre"));
                cliente.setNit(request.getParameter("Enit"));
                cliente.setNickname(request.getParameter("Enick"));
                cliente.setDireccion(request.getParameter("Edireccion"));
                cliente.setTelefono(request.getParameter("Etelefono"));
                daoCliente.modificar(cliente);
                lstCliente = daoCliente.listar();                
                request.setAttribute("cliente", lstCliente);
                acceso = listar + "Clientes.jsp";
                break;
                
            case "eliminarC":
                cliente = new Cliente();
                cliente.setIdCliente(Integer.parseInt(request.getParameter("Didcliente")));
                daoCliente.eliminar(cliente);
                lstCliente = daoCliente.listar();                
                request.setAttribute("cliente", lstCliente);
                acceso = listar + "Clientes.jsp";
                break;
                
        //------ CRUD MONITOR  ---------------------------------             
            
            case "readMon":
                lstMonitor = daoMonitor.listar();                
                request.setAttribute("monitor", lstMonitor);                
                acceso = listar + "Monitor.jsp";
                break;
                
        //------- CRUD PRODUCTO COMBO -------------------------
                
            case "readPC":
                lstProducto = daoProducto.listar();
                lstProductoCombo = daoProductoCombo.listar();                
                request.setAttribute("lstProductoCombo", lstProductoCombo);                
                request.setAttribute("lstProducto", lstProducto);                
                acceso = listar + "ProductoCombinado.jsp";
                break;
                
            case "agregarPC":
                productoCombo = new ProductoCombo();
                productoCombo.setIdTipoCombo(Integer.parseInt(request.getParameter("Atc")));
                productoCombo.setNombre(request.getParameter("Adesc1")+request.getParameter("Adesc2"));
                productoCombo.setPrecio(Double.parseDouble(request.getParameter("Aprecio")));
                productoCombo.setEstado(Integer.parseInt(request.getParameter("Aestado")));
                daoProductoCombo.insertar(productoCombo);
                
                lstProducto = daoProducto.listar();
                lstProductoCombo = daoProductoCombo.listar();                
                request.setAttribute("lstProductoCombo", lstProductoCombo);                
                request.setAttribute("lstProducto", lstProducto);                
                acceso = listar + "ProductoCombinado.jsp";
                break;
                
            case "editarPC":
                productoCombo = new ProductoCombo();
                productoCombo.setIdCombo(Integer.parseInt(request.getParameter("Eidpc")));
                productoCombo.setIdTipoCombo(Integer.parseInt(request.getParameter("Etc")));
                productoCombo.setNombre(request.getParameter("Edesc1")+"+"+request.getParameter("Edesc2"));
                productoCombo.setPrecio(Float.parseFloat(request.getParameter("Eprecio")));
                productoCombo.setEstado(Integer.parseInt(request.getParameter("Eestado")));
                daoProductoCombo.modificar(productoCombo);
                
                lstProducto = daoProducto.listar();
                lstProductoCombo = daoProductoCombo.listar();                
                request.setAttribute("lstProductoCombo", lstProductoCombo);                
                request.setAttribute("lstProducto", lstProducto);                
                acceso = listar + "ProductoCombinado.jsp";
                break;
                
            case "eliminarPC":
                productoCombo = new ProductoCombo();
                productoCombo.setIdCombo(Integer.parseInt(request.getParameter("Didpc")));
                daoProductoCombo.eliminar(productoCombo);
                
                lstProducto = daoProducto.listar();
                lstProductoCombo = daoProductoCombo.listar();                
                request.setAttribute("lstProductoCombo", lstProductoCombo);                
                request.setAttribute("lstProducto", lstProducto);                
                acceso = listar + "ProductoCombinado.jsp";
                break;
                
        //------- CRUD PRODUCTO ---------------------------------
                
            case "readProd":
                lstProducto = daoProducto.listar();                
                request.setAttribute("producto", lstProducto);               
                acceso = listar + "Productos.jsp";
                break;
                
            case "agregarProd":
                producto = new Producto();
                producto.setNombre(request.getParameter("Anombre"));
                producto.setPrecio(Float.parseFloat(request.getParameter("Aprecio")));
                producto.setUnidad(request.getParameter("Aunidad"));
                producto.setIdProveedor(Integer.parseInt(request.getParameter("AidProveedor")));
                producto.setStock(Integer.parseInt(request.getParameter("Astock")));
                producto.setIdTipoProducto(Integer.parseInt(request.getParameter("AidTipo")));
                
                if ("".equals(producto.getNombre()) || "".equals(producto.getPrecio()) || "".equals(producto.getUnidad()) || "".equals(producto.getStock()) ){
                    request.setAttribute("vacio", 1);
                } else {
                    if (daoProducto.insertar(producto)) {
                        request.setAttribute("guardar", 1);
                    } else {
                        request.setAttribute("guardar", 0);
                    }
                }
                
                lstProducto = daoProducto.listar();                
                request.setAttribute("producto", lstProducto);               
                acceso = listar + "Productos.jsp";
                break;
                
            case "editarProd":
                producto = new Producto();
                producto.setIdProducto(Integer.parseInt(request.getParameter("Eidproducto")));
                producto.setNombre(request.getParameter("Enombre"));
                producto.setPrecio(Float.parseFloat(request.getParameter("Eprecio")));
                producto.setUnidad(request.getParameter("Eunidad"));
                producto.setIdProveedor(Integer.parseInt("EidProveedor"));
                producto.setStock(Integer.parseInt(request.getParameter("Estock")));
                producto.setIdTipoProducto(Integer.parseInt(request.getParameter("EidTipo")));
                
                if ("".equals(producto.getNombre()) || "".equals(producto.getPrecio()) || "".equals(producto.getUnidad()) || "".equals(producto.getStock())) {
                    request.setAttribute("vacio", 1);
                } else {
                    if (daoProducto.modificar(producto)) {
                        request.setAttribute("modificar", 1);
                    } else {
                        request.setAttribute("modificar", 0);
                    }
                }
                
                lstProducto = daoProducto.listar();                
                request.setAttribute("producto", lstProducto);                
                acceso = listar + "Productos.jsp";
                break;
                
            case "eliminarProd":
                producto = new Producto();
                producto.setIdProducto(Integer.parseInt(request.getParameter("Didproducto")));
                
                if (daoProducto.eliminar(producto)) {
                    request.setAttribute("eliminar", 1);
                } else {
                    request.setAttribute("eliminar", 0);
                }
                
                lstProducto = daoProducto.listar();                
                request.setAttribute("producto", lstProducto);                
                acceso = listar + "Productos.jsp";
                break;
                
            //CRUD PROVEEDOR
                
            case "readPro":
                lstProveedor = daoProveedor.listar();
                request.setAttribute("proveedor", lstProveedor);
                acceso = listar + "Proveedores.jsp";
                break;
           
            case "agregarPro":
                lstProveedor = daoProveedor.listar();
                request.setAttribute("proveedor", lstProveedor);
                acceso = listar + "Proveedores.jsp";
                break;        
            
            case "editarPro":
                lstProveedor = daoProveedor.listar();
                request.setAttribute("proveedor", lstProveedor);
                acceso = listar + "Proveedores.jsp";
                break;         
            
            case "eliminarPro":
                lstProveedor = daoProveedor.listar();
                request.setAttribute("proveedor", lstProveedor);
                acceso = listar + "Proveedores.jsp";
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
