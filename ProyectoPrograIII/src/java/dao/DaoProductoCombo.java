
package dao;

import configuracion.Conexion;
import interfaces.crudProductoCombo;
import java.util.List;
import modelos.ProductoCombo;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoProductoCombo implements crudProductoCombo{
    
    ProductoCombo productoCombo = null;
    String sql = "";
    Conexion con = new Conexion();
    ResultSet rs = null;
    boolean resp = false;

    @Override
    public List listar() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        ArrayList<ProductoCombo> lstProductoCombo = new ArrayList<>();
        try {
            sql = "SELECT * FROM PRODUCTO_COMBO";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                productoCombo = new ProductoCombo();
                productoCombo.setIdCombo(rs.getInt("ID_COMBO"));
                productoCombo.setIdTipo(rs.getInt("ID_TIPO_COMBO"));
                productoCombo.setDescripcion(rs.getString("DESCRIPCION"));
                productoCombo.setPrecio(rs.getFloat("PRECIO"));                
                productoCombo.setEstado(rs.getInt("ESTADO"));
                lstProductoCombo.add(productoCombo);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoProductoCombo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DaoProductoCombo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstProductoCombo;
    }

    @Override
    public ProductoCombo list(int id) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "SELECT * FROM PRODUCTO_COMBO WHERE ID_COMBO=" + id;
        try {
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                productoCombo.setIdCombo(rs.getInt("ID_COMBO"));
                productoCombo.setIdTipo(rs.getInt("ID_TIPO_COMBO"));
                productoCombo.setDescripcion(rs.getString("DESCRIPCION"));
                productoCombo.setPrecio(rs.getFloat("PRECIO"));
                productoCombo.setEstado(rs.getInt("ESTADO"));
            }
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return productoCombo;
    }

    @Override
    public boolean insertar(ProductoCombo productoCombo) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "INSERT INTO PRODUCTO_COMBO(ID_COMBO,ID_TIPO_COMBO,DESCRIPCION,PRECIO,ESTADO)"
                + "  VALUES((SELECT ISNULL(MAX(ID_PRODUCTO_COMBO),0)+ 1 FROM PRODUCTO_COMBO),"
                + " "+ productoCombo.getIdTipo() +","
                + " '"+ productoCombo.getDescripcion() +"',"
                + " "+ productoCombo.getPrecio() +","                
                + " "+ productoCombo.getEstado() +")";
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
    public boolean modificar(ProductoCombo productoCombo) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "UPDATE PRODUCTO_COMBO SET ID_COMBO="+ productoCombo.getIdCombo() +", "
                + "ID_TIPO_COMBO="+ productoCombo.getIdTipo() +", "
                + "DESCRIPCION='"+ productoCombo.getDescripcion() +"', "
                + "PRECIO="+ productoCombo.getPrecio() +", "
                + "ESTADO="+ productoCombo.getEstado() +" "
                + "WHERE ID_COMBO="+ productoCombo.getIdCombo() +"";
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
    public void eliminar(ProductoCombo productoCombo) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "DELETE FROM PRODUCTO_COMBO WHERE ID_COMBO=" + productoCombo.getIdCombo();
        try {
            con.open();
            resp = con.executeSql(sql);
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    @Override
    public List busqueda(String parametro, String opcion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
