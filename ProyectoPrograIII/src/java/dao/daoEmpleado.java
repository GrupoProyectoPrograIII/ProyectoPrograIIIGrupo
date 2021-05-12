
package dao;

import configuracion.conexion;
import java.sql.*;
import modelos.Empleado;


public class daoEmpleado {
    conexion cnn=new conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    
    public Empleado validar(String user, String pass){
        Empleado em = new Empleado();
        String sql = "SELECT * FROM EMPLEADO WHERE USERNAME=? AND CLAVE=?";
        try {
            con = cnn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, pass);
            rs = ps.executeQuery();          
            while(rs.next()){
                em.setIdEmpleado(rs.getInt("ID_EMPLEADO"));
                em.setUsername(rs.getString("USERNAME"));
                em.setClave(rs.getString("CLAVE"));
                em.setNombre(rs.getString("NOMBRE"));
            }
            con.close();
            rs.close();
        } catch (SQLException e) {
            System.err.println(e.toString());
        }
        return em;
        
    }
}
