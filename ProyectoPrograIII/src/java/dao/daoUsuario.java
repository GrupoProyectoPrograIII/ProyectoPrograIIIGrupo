package dao;

import configuracion.conexion;
import interfaces.crudUsuario;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Usuario;

public class daoUsuario implements crudUsuario {

    Usuario user = new Usuario();
    String sql = "";
    conexion con = new conexion();
    ResultSet rs = null;
    boolean resp = false;

    public Usuario validar(String usr, String pass) {

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
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println(ex);
        } catch (Exception ex) {
            System.out.println(ex);
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

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
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstUsuario;
    }

    @Override
    public Usuario list(int id) {
        sql = "SELECT * FROM USUARIO WHERE ID_USUARIO=" + id;
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
                user.setRol(rs.getString("ROL"));
                user.setIsActivo(rs.getInt("ACTIVO"));
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }

    @Override
    public boolean insertar(Usuario user) {
        sql = "INSERT INTO USUARIO (ID_USUARIO, NOMBRE, APELLIDO, USUARIO, "
                + "PASSW, ID_ROL,ACTIVO) VALUES((SELECT ISNULL(MAX(ID_USUARIO),0) +"
                + " 1 FROM USUARIO),'" + user.getNombre() + "','" + user.getApellido() + "','"
                + user.getUser() + "','" + user.getPass() + "'," + user.getIdRol() + "," + user.getIsActivo() + ")";
        System.out.println(sql);
        try {
            con.open();
            resp = con.executeSql(sql);
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;
    }

    @Override
    public boolean modificar(Usuario user) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "UPDATE USUARIO SET "
                + "NOMBRE='" + user.getNombre() + "', "
                + "APELLIDO='" + user.getApellido() + "', "
                + "USUARIO='" + user.getUser() + "', "
                + "PASSW='" + user.getPass() + "', "
                + "ID_ROL=" + user.getIdRol() + ", "
                + "ACTIVO=" + user.getIsActivo() + " "
                + "WHERE ID_USUARIO=" + user.getIdUser();
        System.out.println(sql);
        try {
            con.open();
            resp = con.executeSql(sql);
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (Exception ex) {
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;
    }

    @Override
    public boolean eliminar(Usuario user) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        try {
            sql = "DELETE FROM USUARIO WHERE ID_USUARIO=" + user.getIdUser();
            System.out.println(sql);
            con.open();
            resp = con.executeSql(sql);
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (Exception ex) {
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;
    }

    @Override
    public List busqueda(String parametro, String opcion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
