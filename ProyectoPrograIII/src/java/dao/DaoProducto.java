
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
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "SELECT * FROM PRODUCTO WHERE ID_PRODUCTO="+ id;
        try {
            con.open();
            rs = con.executeQuery(sql);
            while(rs.next()){
                producto.setIdProducto(rs.getInt("ID_PRODUCTO"));
                producto.setNombre(rs.getString("NOMBRE"));
                producto.setPrecio(rs.getFloat("PRECIO"));
                producto.setUnidad(rs.getString("UNIDAD"));
                producto.setIdProveedor(rs.getInt("ID_PROVEEDOR"));
                producto.setStock(rs.getInt("STOCK"));
                producto.setIdTipoProducto(rs.getInt("ID_TIPO_PRODUCTO"));
            }
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return producto;
    }

    @Override
    public boolean insertar(Producto producto) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "INSERT INTO PRODUCTO (ID_PRODUCTO, NOMBRE, PRECIO, UNIDAD, "
                +"ID_PROVEEDOR, STOCK, ID_TIPO_PRODUCTO) "
                +"VALUES((SELECT ISNULL(MAX(ID_PRODUCTO),0) + 1 FROM PRODUCTO),'"
                +producto.getNombre()
                +"',"+producto.getPrecio()
                +",'"+producto.getUnidad()
                +"',"+producto.getIdProveedor()
                +","+producto.getStock()
                +","+producto.getIdTipoProducto()+")";
        try {
            con.open();
            resp = con.executeSql(sql);
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return resp;
    }

    @Override
    public boolean modificar(Producto producto) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "UPDATE PRODUCTO SET ID_PRODUCTO="+producto.getIdProducto()
                +", NOMBRE='"+producto.getNombre()
                +"', PRECIO="+producto.getPrecio()
                +", UNIDAD='"+producto.getUnidad()
                +"', ID_PROVEEDOR="+producto.getIdProveedor()
                +", STOCK="+producto.getStock()
                +",ID_TIPO_PRODUCTO="+producto.getIdTipoProducto()
                +"' WHERE ID_PRODUCTO="+producto.getIdProducto();
        System.out.println(sql);
        try {
            con.open();
            resp = con.executeSql(sql);
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return resp;
    }

    @Override
    public boolean eliminar(Producto producto) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "DELETE FROM PRODUCTO WHERE ID_PRODUCTO= "+producto.getIdProducto();
        System.out.println(sql);
        try {
            con.open();
            resp = con.executeSql(sql);
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return resp;
    }

    @Override
    public List busqueda(String parametro, String opcion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
