package dao;

import configuracion.conexion;
import interfaces.crudRol;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import modelos.Rol;

public class daoRol implements crudRol {

    Rol rol = new Rol();
    String sql = "";
    conexion con = new conexion();
    ResultSet rs = null;
    boolean resp = false;

    @Override
    public List listar() {
        ArrayList<Rol> lstRol = new ArrayList<>();
        try {
            sql = "SELECT * FROM ROL";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                rol.setIdRol(rs.getInt("ID_ROL"));
                rol.setNombre(rs.getString("NOMBRE"));
                rol.setDescripcion(rs.getString("DESCRIPCION"));
                rol.setIsActivo(rs.getInt("ACTIVO"));
                rol.setUserCrear(rs.getString("USUARIO_CREA"));
                rol.setUserMod(rs.getString("USUARIO_MOD"));
                rol.setFechaCrear(rs.getString("FECHA_CREA"));
                rol.setFechaMod(rs.getString("FECHA_MOD"));
                lstRol.add(rol);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(daoRol.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(daoRol.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstRol;
    }

    @Override
    public Rol list(int id) {
        sql = "SELECT * FROM ROL WHERE ID_ROL="+ id;
        try {
            con.open();
            rs = con.executeQuery(sql);
            while(rs.next()){
                rol.setIdRol(rs.getInt("ID_ROL"));
                rol.setNombre(rs.getString("NOMBRE"));
                rol.setDescripcion(rs.getString("DESCRIPCION"));
                rol.setIsActivo(rs.getInt("ACTIVO"));
                rol.setUserCrear(rs.getString("USUARIO_CREA"));
                rol.setUserMod(rs.getString("USUARIO_MOD"));
                rol.setFechaCrear(rs.getString("FECHA_CREA"));
                rol.setFechaMod(rs.getString("FECHA_MOD"));
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
        sql = "INSERT INTO CLIENTE (ID_CLIENTE, NOMBRE, APELLIDO, NIT, TELEFONO, DIRECCION) VALUES((SELECT ISNULL(MAX(ID_CLIENTE),0) + 1 FROM CLIENTE)";
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
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Rol rol) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List busqueda(String parametro, String opcion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}