
package dao;

import configuracion.Conexion;
import interfaces.crudArea;
import java.util.List;
import modelos.Area;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoArea implements crudArea {
    
    Area area = null;
    String sql = "";
    Conexion con = new Conexion();
    Connection cnn;
    PreparedStatement ps;
    ResultSet rs = null;
    boolean resp = false;
    int r;

    @Override
    public List listar() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        List<Area> lstArea = new ArrayList<>();
        try {
            sql = "SELECT * FROM AREA";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                area = new Area();
                area.setIdArea(rs.getInt("ID_AREA"));
                area.setNombre(rs.getString("DESCRIPCION"));
                area.setEstado(rs.getInt("ESTADO"));
                lstArea.add(area);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoArea.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DaoArea.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstArea;
    }

    @Override
    public Area list(int id) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "SELECT * FROM AREA WHERE ID_AREA="+ id;
        try {
            con.open();
            rs = con.executeQuery(sql);
            while(rs.next()){
                area.setIdArea(rs.getInt("ID_AREA"));
                area.setNombre(rs.getString("DESCRIPCION"));
                area.setEstado(rs.getInt("ESTADO"));
            }
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return area;
    }

    @Override
    public boolean insertar(Area area) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "INSERT INTO AREA (ID_AREA, DESCRIPCION, ESTADO) "
                +"VALUES((SELECT ISNULL(MAX(ID_AREA),0) + 1 FROM AREA),'"
                +area.getNombre()+"','"
                +area.getEstado()+"')";
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
    public boolean modificar(Area area) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "UPDATE AREA SET ID_AREA="+area.getIdArea()
                +", DESCRIPCION='"+area.getNombre()
                +"', ESTADO="+area.getEstado()
                +" WHERE ID_AREA="+area.getIdArea();
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
    public void eliminar(Area area) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "DELETE FROM AREA WHERE ID_AREA= "+area.getIdArea();
        System.out.println(sql);
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
