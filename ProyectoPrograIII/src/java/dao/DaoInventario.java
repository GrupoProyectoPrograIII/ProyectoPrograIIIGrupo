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
        try {
            sql = "SELECT dbo.INVENTARIO_GENERAL.CODIGO_PRODUCTO, dbo.INVENTARIO_GENERAL.DESCRIPCION, dbo.INVENTARIO_GENERAL.CATEGORIA, dbo.CATEGORIA_PRODUCTO.DESCRIPCION AS 'CATEGORIA_PRODUCTO', \n"
                    + "                         dbo.INVENTARIO_GENERAL.STOCK, dbo.INVENTARIO_GENERAL.ID_DETALLE, dbo.INVENTARIO_DETALLE.PROVEEDOR, dbo.INVENTARIO_DETALLE.UNIDAD, dbo.INVENTARIO_DETALLE.COSTO_UNIDAD, dbo.INVENTARIO_DETALLE.CANTIDAD\n"
                    + "FROM  dbo.CATEGORIA_PRODUCTO INNER JOIN\n"
                    + "            dbo.INVENTARIO_GENERAL ON dbo.CATEGORIA_PRODUCTO.ID_CATEGORIA_PRODUCTO = dbo.INVENTARIO_GENERAL.CATEGORIA INNER JOIN\n"
                    + "			dbo.INVENTARIO_DETALLE\n"
                    + "			ON dbo.INVENTARIO_GENERAL.ID_DETALLE = dbo.INVENTARIO_DETALLE.ID_DETALLE AND dbo.INVENTARIO_GENERAL.ID_DETALLE = dbo.INVENTARIO_DETALLE.ID_DETALLE WHERE CODIGO_PRODUCTO = " + id;
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                inven = new Inventario();
                inven.setCodigo_pro(rs.getInt("CODIGO_PRODUCTO"));
                inven.setDescripcion(rs.getString("DESCRIPCION"));
                inven.setDesc_categoria(rs.getString("CATEGORIA_PRODUCTO"));
                inven.setId_categoria(rs.getInt("CATEGORIA"));
                inven.setStock(rs.getInt("STOCK"));
                inven.setDescripcion(rs.getString("DESCRIPCION"));
                inven.setProveedor(rs.getString("PROVEEDOR"));
                inven.setUnidad(rs.getString("UNIDAD"));
                inven.setCosto_uni(rs.getDouble("COSTO_UNIDAD"));
                inven.setCantidad(rs.getDouble("CANTIDAD"));
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return inven;
    }

    @Override
    public boolean eliminar(Inventario inv) {
        sql = "DELETE FROM INVENTARIO_GENERAL WHERE CODIGO_PRODUCTO = " + inv.getCodigo_pro();
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

    @Override
    public boolean insertar_general(Inventario inv) {
        sql = "INSERT INTO INVENTARIO_GENERAL (CODIGO_PRODUCTO, DESCRIPCION, CATEGORIA, STOCK,ID_DETALLE)\n"
                + "  VALUES ((SELECT ISNULL(MAX(CODIGO_PRODUCTO),0) + 1 FROM INVENTARIO_GENERAL),"
                + "'" + inv.getDescripcion() + "',"
                + "'" + inv.getId_categoria() + "',"
                + "'" + inv.getStock() + "',"
                + "(SELECT ISNULL(MAX(ID_DETALLE),0) + 1 FROM INVENTARIO_GENERAL))";
        try {
            con.open();
            resp = con.executeSql(sql);
            con.close();
        } catch (Exception e) {
            System.err.println(e);
        }
        return resp;
    }

    @Override
    public boolean insertar_detalle(Inventario inv) {
        sql = "INSERT INTO INVENTARIO_DETALLE (ID_DETALLE,PROVEEDOR, UNIDAD, COSTO_UNIDAD, CANTIDAD)\n"
                + "  VALUES ((SELECT ISNULL(MAX(ID_DETALLE),0) + 1 FROM INVENTARIO_DETALLE),"
                + "'" + inv.getProveedor() + "',"
                + "'" + inv.getUnidad() + "',"
                + "'" + inv.getCosto_uni() + "',"
                + "'" + inv.getCantidad() + "')";
        try {
            con.open();
            resp = con.executeSql(sql);
            con.close();
        } catch (Exception e) {
            System.err.println(e);
        }
        return resp;
    }

    @Override
    public boolean modificar_general(Inventario inv) {
        sql = "UPDATE INVENTARIO_GENERAL SET "
                + "DESCRIPCION = '" + inv.getDescripcion() + "', "
                + "CATEGORIA = '" + inv.getId_categoria() + "', "
                + "STOCK = '" + inv.getStock() + "' "
                + "WHERE CODIGO_PRODUCTO = '" + inv.getCodigo_pro() + "'";
        try {
            con.open();
            resp = con.executeSql(sql);
            con.close();
        } catch (Exception e) {
            System.err.println(e);
        }
        return resp;
    }

    @Override
    public boolean modificar_detalle(Inventario inv) {
        sql = "UPDATE INVENTARIO_DETALLE SET "
                + "PROVEEDOR = '" + inv.getProveedor() + "', "
                + "UNIDAD = '" + inv.getUnidad() + "', "
                + "COSTO_UNIDAD = '" + inv.getCosto_uni() + "', "
                + "CANTIDAD = '" + inv.getCantidad() + "' "
                + "WHERE ID_DETALLE = '" + inv.getCodigo_pro() + "'";
        try {
            con.open();
            resp = con.executeSql(sql);
            con.close();
        } catch (Exception e) {
            System.err.println(e);
        }
        return resp;
    }

}
