/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import configuracion.conexion;
import java.sql.*;
import modelos.Empleado;

/**
 *
 * @author family.user
 */
public class daoEmpleado {
    conexion cnn=new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public Empleado validar(String user, String pass){
        Empleado em = new Empleado();
        String sql = "SELECT * FROM EMPLEADO WHERE USERNAME=? AND DPI=?";
        try {
            con = cnn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();          
            while(rs.next()){
                em.setIdEmpleado(rs.getInt("ID_EMPLEADO"));
                em.setUsername(rs.getString("USERNAME"));
                em.setDpi(rs.getString("DPI"));
                em.setNombre(rs.getString("NOMBRE"));
            }
            con.close();
            rs.close();
        } catch (Exception e) {
        }
        return em;
        
    }
}
