package dao;

import configuracion.Conexion;
import interfaces.crudRol;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Rol;

public class DaoRol implements crudRol{
    
    Rol rol = null;
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
        List<Rol> lstRol = new ArrayList<>();
        try {
            sql = "SELECT * FROM ROL";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                rol = new Rol();
                rol.setIdRol(rs.getInt("ID_ROL"));
                rol.setNombre(rs.getString("NOMBRE"));
                rol.setDescripcion(rs.getString("DESCRIPCION"));
                rol.setIsActivo(rs.getInt("ACTIVO"));
                lstRol.add(rol);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoRol.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DaoRol.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstRol;
    }

    @Override
    public Rol list(int id) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "SELECT * FROM ROL WHERE ID_ROL="+ id;
        try {
            con.open();
            rs = con.executeQuery(sql);
            while(rs.next()){
                rol.setIdRol(rs.getInt("ID_ROL"));
                rol.setNombre(rs.getString("NOMBRE"));
                rol.setDescripcion(rs.getString("DESCRIPCION"));
                rol.setIsActivo(rs.getInt("ACTIVO"));
            }
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return rol;
    }

    @Override
    public boolean insertar(Rol rol) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "INSERT INTO ROL (ID_ROL, NOMBRE, DESCRIPCION, ACTIVO) "
                +"VALUES((SELECT ISNULL(MAX(ID_ROL),0) + 1 FROM ROL),'"+rol.getNombre()+"','"+rol.getDescripcion()+"','"+rol.getIsActivo()+"')";
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
    public boolean modificar(Rol rol) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "UPDATE ROL SET ID_ROL="+rol.getIdRol()+", NOMBRE= '"+rol.getNombre()+"', DESCRIPCION='"+rol.getDescripcion()+"', ACTIVO="+rol.getIsActivo()+" WHERE ID_ROL="+rol.getIdRol();
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
    public void eliminar(Rol rol) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "DELETE FROM ROL WHERE ID_ROL= "+rol.getIdRol();
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
