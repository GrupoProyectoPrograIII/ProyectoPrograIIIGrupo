/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import configuracion.Conexion;
import interfaces.crudDespacho;
import java.sql.*;
import java.util.List;
import modelos.Despacho;

/**
 *
 * @author JAVIER OSORIO
 */
public class DaoDespacho implements crudDespacho{

    Despacho despacho = null;
    String sql = "";
    Conexion con = new Conexion();
    ResultSet rs = null;
    boolean resp = false;
    
    @Override
    public List listar() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Despacho list(int id) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "SELECT * FROM DESPACHO WHERE ID_DESPACHO="+ id;
        try {
            con.open();
            rs = con.executeQuery(sql);
            while(rs.next()){
                despacho.setId_despacho(rs.getInt("ID_DESPACHO"));
                despacho.setPedido(rs.getInt("PEDIDO"));
                despacho.setDescripcion(rs.getString("DESCRIPCION"));
                despacho.setArea(rs.getString("AREA"));
                despacho.setMesa(rs.getString("MESA"));                
            }
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return despacho;
    }

    @Override
    public boolean insertar(Despacho despacho) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean modificar(Despacho despacho) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Despacho despacho) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List busqueda(String parametro, String opcion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
