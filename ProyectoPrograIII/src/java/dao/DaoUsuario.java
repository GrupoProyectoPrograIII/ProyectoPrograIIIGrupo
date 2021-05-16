package dao;

import configuracion.Conexion;
import interfaces.crudUsuario;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Usuario;

public class DaoUsuario implements crudUsuario{
    Usuario user= new Usuario();
    String sql = "";
    Conexion con = new Conexion();
    ResultSet rs = null;
    boolean resp = false;
    
    @Override
    public List listar() {
        ArrayList<Usuario> lstUsuario = new ArrayList<>();
        try {
            sql = "SELECT dbo.USUARIO.ID_USUARIO, dbo.USUARIO.NOMBRE, "
                    + " dbo.USUARIO.APELLIDO, dbo.USUARIO.USUARIO,dbo.USUARIO.PASSW,"
                    + "dbo.USUARIO.ID_ROL,dbo.ROL.NOMBRE as 'ROL',dbo.USUARIO.ACTIVO"
                    + " from dbo.USUARIO join dbo.ROL on dbo.USUARIO.ID_ROL=dbo.ROL.ID_ROL";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                user = new Usuario();
                user.setIdUser(rs.getInt("ID_USUARIO"));
                user.setIdRol(rs.getInt("ID_ROL"));
                user.setNombre(rs.getString("NOMBRE"));
                user.setApellido(rs.getString("APELLIDO"));
                user.setUser(rs.getString("USUARIO"));
                user.setPass(rs.getString("PASSW"));
                user.setRol(rs.getString("ROL"));
                user.setIsActivo(rs.getInt("ACTIVO"));
                lstUsuario.add(user);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstUsuario;
    }

    @Override
    public Usuario list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean insertar(Usuario user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean modificar(Usuario user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Usuario user) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List busqueda(String parametro, String opcion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public Usuario validar(String usr, String pass) {
        Usuario user = new Usuario();
        sql = "SELECT dbo.USUARIO.ID_USUARIO, dbo.USUARIO.NOMBRE AS 'NOMBRE', dbo.USUARIO.APELLIDO, dbo.USUARIO.USUARIO, dbo.USUARIO.PASSW, dbo.USUARIO.ID_ROL, dbo.USUARIO.ACTIVO AS 'ACTIVO', dbo.ROL.NOMBRE AS 'ROL'\n"
                + "FROM dbo.USUARIO INNER JOIN\n"
                + "dbo.ROL ON dbo.USUARIO.ID_ROL = dbo.ROL.ID_ROL WHERE USUARIO = '" + usr + "' AND PASSW = '" + pass + "'";
        try {
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                user.setIdUser(rs.getInt("ID_USUARIO"));
                user.setIdRol(rs.getInt("ID_ROL"));
                user.setNombre(rs.getString("NOMBRE"));
                user.setApellido(rs.getString("APELLIDO"));
                user.setUser(rs.getString("USUARIO"));
                user.setPass(rs.getString("PASSW"));
                user.setIsActivo(rs.getInt("ACTIVO"));
                user.setRol(rs.getString("ROL"));
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        } catch (Exception ex) {
            System.out.println(ex);
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }
}
