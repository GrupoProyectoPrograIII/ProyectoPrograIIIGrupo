/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import configuracion.Conexion;
import interfaces.crudMonitores;
import java.util.List;
import modelos.Monitor;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.*;

/**
 *
 * @author JAVIER OSORIO
 */
public class DaoMonitor implements crudMonitores{

    Conexion con = new Conexion();
    String sql = "";
    Monitor mon = new Monitor();
    PreparedStatement ps;
    ResultSet rs = null;
    
    @Override
    public List listar() {
        List<Monitor> lstMon = new ArrayList<>();
        try {
            sql = "SELECT * FROM MONITORES";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                mon = new Monitor();
                mon.setCod_monitor(rs.getInt("CODIGO"));
                mon.setDescripcion_monitor(rs.getString("DESCRIPCION"));
                lstMon.add(mon);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoArea.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DaoArea.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstMon;
    }
    
}
