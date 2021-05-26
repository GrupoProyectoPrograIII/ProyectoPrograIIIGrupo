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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
    public List listar_ibv_detalle() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
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
