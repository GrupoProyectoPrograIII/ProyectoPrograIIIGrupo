package dao;

import configuracion.Conexion;
import interfaces.crudPermiso;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Permiso;

public class DaoPermiso implements crudPermiso{
    
    Permiso permisos = null;
    String sql = "";
    Conexion con = new Conexion();
    ResultSet rs = null;
    boolean resp = false;
    
    @Override
    public List listar() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        ArrayList<Permiso> lstPermiso = new ArrayList<>();
        try {
            sql = "SELECT dbo.PERMISO.ID_PERMISO,  dbo.PERMISO.ID_MODULO, dbo.MODULO.NOMBRE as 'MODULO', dbo.PERMISO.ID_ROL,dbo.ROL.NOMBRE as 'ROL', dbo.PERMISO.ACTIVO from dbo.PERMISO join dbo.MODULO on dbo.PERMISO.ID_MODULO=dbo.MODULO.ID_MODULO join dbo.ROL on dbo.PERMISO.ID_ROL= dbo.ROL.ID_ROL";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                permisos = new Permiso();
                permisos.setIdPermiso(rs.getInt("ID_PERMISO"));
                permisos.setIdModulo(rs.getInt("ID_MODULO"));
                permisos.setIdRol(rs.getInt("ID_ROL"));
                permisos.setModulo(rs.getString("MODULO"));
                permisos.setRol(rs.getString("ROL"));
                permisos.setIsActivo(rs.getInt("ACTIVO"));
                lstPermiso.add(permisos);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoPermiso.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DaoPermiso.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstPermiso;
    }

    @Override
    public Permiso list(int id) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "SELECT dbo.PERMISO.ID_PERMISO,  dbo.MODULO.NOMBRE as 'MODULO', dbo.ROL.NOMBRE as 'ROL', dbo.PERMISO.ACTIVO from dbo.PERMISO join dbo.MODULO on dbo.PERMISO.ID_MODULO=dbo.MODULO.ID_MODULO join dbo.ROL on dbo.PERMISO.ID_ROL= dbo.ROL.ID_ROL WHERE ID_ROL=" + id;
        try {
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                permisos.setIdPermiso(rs.getInt("ID_PERMISO"));
                permisos.setIdModulo(rs.getInt("ID_MODULO"));
                permisos.setIdRol(rs.getInt("ID_ROL"));
                permisos.setModulo(rs.getString("MODULO"));
                permisos.setRol(rs.getString("ROL"));
                permisos.setIsActivo(rs.getInt("ACTIVO"));
            }
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return permisos;
    }

    @Override
    public boolean insertar(Permiso permiso) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "INSERT INTO PERMISO(ID_PERMISO,ID_MODULO,ID_ROL,ACTIVO) \n"
                + "  VALUES((SELECT ISNULL(MAX(ID_PERMISO),0)+ 1 FROM PERMISO),"
                + "'"+ permiso.getIdModulo() +"',"
                + "'"+ permiso.getIdRol() +"',"
                + "'"+ permiso.getIsActivo() +"')";
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
    public boolean modificar(Permiso permiso) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "UPDATE PERMISO SET ID_MODULO= '"+ permiso.getIdModulo() +"', "
                + "ID_ROL= '"+ permiso.getIdRol() +"', "
                + "ACTIVO= '"+ permiso.getIsActivo() +"'"
                + "WHERE ID_PERMISO= '"+ permiso.getIdPermiso() +"'";
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
    public boolean eliminar(Permiso permiso) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "DELETE FROM PERMISO WHERE ID_PERMISO=" + permiso.getIdPermiso();
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
    public List busqueda(String parametro, String opcion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
