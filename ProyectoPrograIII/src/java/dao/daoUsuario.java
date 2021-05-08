package dao;

import configuracion.conexion;
import interfaces.crudUsuario;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Usuario;

public class daoUsuario implements crudUsuario{

    Usuario user = new Usuario();
    String sql = "";
    conexion con = new conexion();
    ResultSet rs = null;
    boolean resp = false;
    
    
    @Override
    public List listar() {
        ArrayList<Usuario> lstUsuario = new ArrayList<>();
        try {
            sql = "SELECT * FROM USUARIO";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                user.setIdUser(rs.getInt("ID_USUARIO"));
                user.setIdUser(rs.getInt("ID_ROL"));
                user.setNombre(rs.getString("NOMBRE"));
                user.setApellido(rs.getString("APELLIDO"));
                user.setUser(rs.getString("USUARIO"));
                user.setPass(rs.getString("PASSW"));
                user.setRol(rs.getString("ROL"));
                user.setIsActivo(rs.getInt("ACTIVO"));
                user.setFechaCrear(rs.getString("FECHA_CREA"));
                user.setFechaMod(rs.getString("FECHA_MOD"));
                user.setUserCrear(rs.getString("USUARIO_CREA"));
                user.setUserMod(rs.getString("USUARIO_MOD"));
                user.setCodigo(rs.getString("CODIGO"));
                lstUsuario.add(user);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstUsuario;
    }

    @Override
    public Usuario list(int id) {
        sql = "SELECT * FROM USUARIO WHERE ID_USUARIO="+ id;
        try {
            con.open();
            rs = con.executeQuery(sql);
            while(rs.next()){
                user.setIdUser(rs.getInt("ID_USUARIO"));
                user.setIdUser(rs.getInt("ID_ROL"));
                user.setNombre(rs.getString("NOMBRE"));
                user.setApellido(rs.getString("APELLIDO"));
                user.setUser(rs.getString("USUARIO"));
                user.setPass(rs.getString("PASSW"));
                user.setRol(rs.getString("ROL"));
                user.setIsActivo(rs.getInt("ACTIVO"));
                user.setFechaCrear(rs.getString("FECHA_CREA"));
                user.setFechaMod(rs.getString("FECHA_MOD"));
                user.setUserCrear(rs.getString("USUARIO_CREA"));
                user.setUserMod(rs.getString("USUARIO_MOD"));
                user.setCodigo(rs.getString("CODIGO"));
            }
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return user;
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
    
}
