
package dao;

import interfaces.crudProducto;
import java.util.List;
import modelos.Producto;
import configuracion.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DaoProducto implements crudProducto{
    
    Producto producto= new Producto();
    String sql = "";
    Conexion con = new Conexion();
    ResultSet rs = null;
    boolean resp = false;

    @Override
    public List listar() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        ArrayList<Producto> lstProducto = new ArrayList<>();
        try {
            sql = "SELECT * FROM PRODUCTO";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                producto = new Producto();
                producto.setIdProducto(rs.getInt("ID_PRODUCTO"));
                producto.setNombre(rs.getString("NOMBRE"));
                producto.setPrecio(rs.getFloat("PRECIO"));
                producto.setUnidad(rs.getString("UNIDAD"));
                producto.setIdProveedor(rs.getInt("ID_PROVEEDOR"));
                producto.setStock(rs.getInt("STOCK"));
                producto.setIdTipoProducto(rs.getInt("ID_TIPO_PRODUCTO"));
                lstProducto.add(producto);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoProducto.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DaoProducto.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstProducto;
    }

    @Override
    public Producto list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean insertar(Producto producto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean modificar(Producto producto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Producto producto) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List busqueda(String parametro, String opcion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
