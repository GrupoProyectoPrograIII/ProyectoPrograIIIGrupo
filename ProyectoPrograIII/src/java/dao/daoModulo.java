package dao;

import configuracion.conexion;
import interfaces.crudModulo;
import java.sql.ResultSet;
import java.sql.SQLException;
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
                modulo.setOrden(rs.getString("ORDEN"));
                modulo.setIdModuloPadre(rs.getInt("ID_MODULO_PADRE"));
                modulo.setFechaCrear(rs.getString("FECHA_CREA"));
                modulo.setFechaMod(rs.getString("FECHA_MOD"));
                modulo.setUserCrear(rs.getString("USUARIO_CREA"));
                modulo.setUserMod(rs.getString("USUARIO_MOD"));
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
                modulo.setOrden(rs.getString("ORDEN"));
                modulo.setIdModuloPadre(rs.getInt("ID_MODULO_PADRE"));
                modulo.setFechaCrear(rs.getString("FECHA_CREA"));
                modulo.setFechaMod(rs.getString("FECHA_MOD"));
                modulo.setUserCrear(rs.getString("USUARIO_CREA"));
                modulo.setUserMod(rs.getString("USUARIO_MOD"));
                modulo.setIsActivo(rs.getInt("ACTIVO"));
            }
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return modulo;
    }

    @Override
    public boolean insertar(Modulo modulo) {
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
    public boolean modificar(Modulo modulo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean eliminar(Modulo modulo) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List busqueda(String parametro, String opcion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
