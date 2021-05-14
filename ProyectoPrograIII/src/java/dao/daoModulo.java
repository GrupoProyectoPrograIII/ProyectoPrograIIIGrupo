package dao;

import configuracion.conexion;
import interfaces.crudModulo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Modulo;

public class daoModulo implements crudModulo {

    Modulo modulo = new Modulo();
    String sql = "";
    conexion con = new conexion();
    ResultSet rs = null;
    boolean resp = false;

    @Override
    public List listar() {
        ArrayList<Modulo> lstModulo = new ArrayList<>();
        try {
            sql = "SELECT * FROM MODULO";
            con.open();
            rs = con.executeQuery(sql);
            while(rs.next()){
                modulo.setIdModulo(rs.getInt("ID_MODULO"));
                modulo.setNombre(rs.getString("NOMBRE"));
                modulo.setDescripcion(rs.getString("DESCRIPCION"));
                modulo.setPath(rs.getString("PATH"));
                modulo.setNivel(rs.getInt("NIVEL"));
                modulo.setOrden(rs.getInt("ORDEN"));
                modulo.setIdModuloPadre(rs.getInt("ID_MODULO_PADRE"));
                modulo.setIsActivo(rs.getInt("ACTIVO"));
                lstModulo.add(modulo);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(daoModulo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(daoModulo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstModulo;
    }

    @Override
    public Modulo list(int id) {
           sql = "SELECT * FROM MODULO WHERE ID_MODULO=" + id;
        try {
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                modulo.setIdModulo(rs.getInt("ID_MODULO"));
                modulo.setNombre(rs.getString("NOMBRE"));
                modulo.setDescripcion(rs.getString("DESCRIPCION"));
                modulo.setPath(rs.getString("PATH"));
                modulo.setNivel(rs.getInt("NIVEL"));
                modulo.setOrden(rs.getInt("ORDEN"));
                modulo.setIdModuloPadre(rs.getInt("ID_MODULO_PADRE"));
                modulo.setIsActivo(rs.getInt("ACTIVO"));
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(daoModulo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(daoModulo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return modulo;
    }

    @Override
    public boolean insertar(Modulo modulo) {
        sql = "INSERT INTO MODULO (ID_MODULO, NOMBRE, DESCRIPCION, "
                +"PATH, NIVEL, ORDEN, ID_MODULO_PADRE, ACTIVO) "
                +"VALUES((SELECT ISNULL(MAX(ID_MODULO),0) + 1 FROM "
                +"MODULO),'"+modulo.getNombre()+"','"+modulo.getDescripcion()
                +"','"+modulo.getPath()+"',"+modulo.getNivel()+","+modulo.getOrden()
                +","+modulo.getIdModuloPadre()+","+modulo.getIsActivo()+")";
        try {
            con.open();            
            resp = con.executeSql(sql);            
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(daoModulo.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(daoModulo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return resp;
    }

    @Override
    public boolean modificar(Modulo modulo) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "UPDATE MODULO SET ID_MODULO="+modulo.getIdModulo()+", "
                +"NOMBRE='"+modulo.getNombre()+"', "
                +"DESCRIPCION='"+modulo.getDescripcion()+"', "
                +"PATH='"+modulo.getPath()+"', "
                +"NIVEL="+modulo.getNivel()+", "
                +"ORDEN="+modulo.getOrden()+", "
                +"ID_MODULO_PADRE="+modulo.getIdModuloPadre()+", "
                +"ACTIVO="+modulo.getIsActivo()+" "
                +"WHERE ID_MODULO="+modulo.getIdModulo();
        try {           
            con.open();            
            resp = con.executeSql(sql);            
            con.close();             
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);     
            return false;
        } catch(Exception ex){
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);            
        }
        return resp;
    }

    @Override
    public boolean eliminar(Modulo modulo) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        try { 
            sql = "DELETE FROM MODULO WHERE ID_MODULO=" + modulo.getIdModulo();
            con.open();            
            resp = con.executeSql(sql);            
            con.close();             
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);     
            return false;
        } catch(Exception ex){
            Logger.getLogger(daoUsuario.class.getName()).log(Level.SEVERE, null, ex);            
        }
        return resp;
    }

    @Override
    public List busqueda(String parametro, String opcion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
