/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import configuracion.Conexion;
import interfaces.crudInventario;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.*;
import modelos.Inventario;

/**
 *
 * @author JAVIER OSORIO
 */
public class DaoInventario implements crudInventario {

    String sql = "";
    Conexion con = new Conexion();
    ResultSet rs = null;
    boolean resp = false;
    Inventario inven = new Inventario();

    @Override
    public List listar_categoria() {
        ArrayList<Inventario> lstCast = new ArrayList<>();
        try {
            sql = "SELECT        ID_CATEGORIA_PRODUCTO, DESCRIPCION\n"
                    + "FROM            dbo.CATEGORIA_PRODUCTO";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                inven = new Inventario();
                inven.setId_categoria(rs.getInt("ID_CATEGORIA_PRODUCTO"));
                inven.setDesc_categoria(rs.getString("DESCRIPCION"));
                lstCast.add(inven);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstCast;
    }

    @Override
    public List listar_inv_general() {
        ArrayList<Inventario> lstInv_gene = new ArrayList<>();
        try {
            sql = "SELECT        dbo.INVENTARIO_GENERAL.CODIGO_PRODUCTO, dbo.INVENTARIO_GENERAL.DESCRIPCION, dbo.CATEGORIA_PRODUCTO.DESCRIPCION AS 'CATEGORIA_PRODUCTO', dbo.INVENTARIO_GENERAL.CATEGORIA, \n"
                    + "                         dbo.INVENTARIO_GENERAL.STOCK\n"
                    + "FROM            dbo.CATEGORIA_PRODUCTO INNER JOIN\n"
                    + "                         dbo.INVENTARIO_GENERAL ON dbo.CATEGORIA_PRODUCTO.ID_CATEGORIA_PRODUCTO = dbo.INVENTARIO_GENERAL.CATEGORIA";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                inven = new Inventario();
                inven.setCodigo_pro(rs.getInt("CODIGO_PRODUCTO"));
                inven.setDescripcion(rs.getString("DESCRIPCION"));
                inven.setDesc_categoria(rs.getString("CATEGORIA_PRODUCTO"));
                inven.setId_categoria(rs.getInt("CATEGORIA"));
                inven.setStock(rs.getInt("STOCK"));
                lstInv_gene.add(inven);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstInv_gene;
    }

    @Override
    public List listar_inv_detalle() {
        ArrayList<Inventario> lstInv_deta = new ArrayList<>();
        try {
            sql = "SELECT        dbo.INVENTARIO_GENERAL.CODIGO_PRODUCTO, dbo.INVENTARIO_GENERAL.DESCRIPCION, dbo.INVENTARIO_DETALLE.PROVEEDOR, \n"
                    + "dbo.INVENTARIO_DETALLE.UNIDAD, dbo.INVENTARIO_DETALLE.COSTO_UNIDAD, \n"
                    + "                         dbo.INVENTARIO_DETALLE.CANTIDAD\n"
                    + "FROM            dbo.INVENTARIO_DETALLE INNER JOIN\n"
                    + "                         dbo.INVENTARIO_GENERAL ON dbo.INVENTARIO_DETALLE.ID_DETALLE = dbo.INVENTARIO_GENERAL.ID_DETALLE";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                inven = new Inventario();
                inven.setCodigo_pro(rs.getInt("CODIGO_PRODUCTO"));
                inven.setDescripcion(rs.getString("DESCRIPCION"));
                inven.setProveedor(rs.getString("PROVEEDOR"));
                inven.setUnidad(rs.getString("UNIDAD"));
                inven.setCosto_uni(rs.getDouble("COSTO_UNIDAD"));
                inven.setCantidad(rs.getDouble("CANTIDAD"));
                lstInv_deta.add(inven);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstInv_deta;
    }

    @Override
    public Inventario list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean insertar(Inventario inv) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean modificar(Inventario inv) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Inventario inv) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List busqueda(String parametro, String opcion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
