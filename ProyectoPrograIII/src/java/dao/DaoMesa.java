
package dao;

import configuracion.Conexion;
import interfaces.crudMesa;
import java.util.List;
import modelos.Mesa;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoMesa implements crudMesa{
    
    Mesa mesa = null;
    String sql = "";
    Conexion con = new Conexion();
    ResultSet rs = null;
    boolean resp = false;

    @Override
    public List listar() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        ArrayList<Mesa> lstMesa = new ArrayList<>();
        try {
            sql = "SELECT MESA.ID_MESA, MESA.ID_AREA, MESA.DESCRIPCION AS 'MESA', AREA.DESCRIPCION AS 'AREA',"
                    + " MESA.ASIENTOS, MESA.ID_ESTADO FROM MESA JOIN AREA ON MESA.ID_AREA=AREA.ID_AREA;";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                mesa = new Mesa();
                mesa.setIdMesa(rs.getInt("ID_MESA"));                
                mesa.setMesa(rs.getString("MESA"));
                mesa.setIdArea(rs.getInt("ID_AREA"));
                mesa.setArea(rs.getString("AREA"));
                mesa.setAsientos(rs.getInt("ASIENTOS"));
                mesa.setIdEstado(rs.getInt("ID_ESTADO"));                
                lstMesa.add(mesa);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoMesa.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DaoMesa.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstMesa;
    }

    @Override
    public Mesa list(int id) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "SELECT MESA.ID_MESA, MESA.ID_AREA, MESA.DESCRIPCION AS 'MESA', AREA.DESCRIPCION AS 'AREA',"
                + " MESA.ASIENTOS, MESA.ID_ESTADO FROM MESA JOIN AREA ON MESA.ID_AREA=AREA.ID_AREA WHERE ID_MESA=" + id;
        try {
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                mesa.setIdMesa(rs.getInt("ID_MESA"));                
                mesa.setMesa(rs.getString("MESA"));
                mesa.setIdArea(rs.getInt("ID_AREA"));
                mesa.setArea(rs.getString("AREA"));
                mesa.setAsientos(rs.getInt("ASIENTOS"));
                mesa.setIdEstado(rs.getInt("ID_ESTADO"));                 
            }
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return mesa;
    }

    @Override
    public boolean insertar(Mesa mesa) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "INSERT INTO MESA(ID_MESA,ID_AREA,DESCRIPCION,ASIENTOS,ID_ESTADO) "
                + "VALUES((SELECT ISNULL(MAX(ID_MESA),0)+ 1 FROM MESA),"
                + " "+ mesa.getIdArea() +","
                + "'"+ mesa.getMesa() +"',"
                + " "+ mesa.getAsientos() +","
                + " "+ mesa.getIdEstado() +")";
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
    public boolean modificar(Mesa mesa) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "UPDATE MESA SET ID_MESA="+ mesa.getIdMesa() +", "
                + "ID_AREA="+ mesa.getIdArea() +", "
                + "DESCRICPCION='"+ mesa.getMesa() +"' "
                + "ASIENTOS="+ mesa.getAsientos() +" "
                + "ID_ESTADO="+ mesa.getIdEstado() +" "
                + "WHERE ID_MESA="+ mesa.getIdMesa() +"";
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
    public void eliminar(Mesa mesa) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "DELETE FROM MESA WHERE ID_MESA=" + mesa.getIdMesa();
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
