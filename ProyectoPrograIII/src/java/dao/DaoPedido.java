package dao;

import configuracion.Conexion;
import interfaces.crudPedido;
import java.util.List;
import modelos.Pedido;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoPedido implements crudPedido{
    
    Pedido pedido = null;
    String sql = "";
    Conexion con = new Conexion();
    ResultSet rs = null;
    boolean resp = false;

    @Override
    public List listar() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        ArrayList<Pedido> lstPedido = new ArrayList<>();
        try {
            sql = "SELECT PEDIDO.ID_PEDIDO, MESA.DESCRIPCION AS MESA, USUARIO.USUARIO, "
                    +"CLIENTE.NOMBRE, PEDIDO.TOTAL, PEDIDO.OBSERVACION, PEDIDO.ESTADO "
                    +"FROM PEDIDO INNER JOIN MESA ON PEDIDO.ID_MESA = MESA.ID_MESA "
                    +"INNER JOIN USUARIO ON PEDIDO.ID_USUARIO = USUARIO.ID_USUARIO "
                    +"INNER JOIN CLIENTE ON PEDIDO.ID_CLIENTE = CLIENTE.ID_CLIENTE";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                pedido = new Pedido();
                pedido.setIdPedido(rs.getInt("ID_PEDIDO"));
                pedido.setIdMesa(rs.getInt("ID_MESA"));
                pedido.setIdUsuario(rs.getInt("ID_USUARIO"));
                pedido.setIdCliente(rs.getInt("ID_CLIENTE"));
                pedido.setTotal(rs.getFloat("TOTAL"));
                pedido.setObservacion("OBSERVACION");
                pedido.setEstado(rs.getInt("ESTADO"));
                lstPedido.add(pedido);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoPedido.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DaoPedido.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstPedido;
    }

    @Override
    public Pedido list(int id) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "SELECT PEDIDO.ID_PEDIDO, MESA.DESCRIPCION AS MESA, USUARIO.USUARIO, "
                    +"CLIENTE.NOMBRE, PEDIDO.TOTAL, PEDIDO.OBSERVACION, PEDIDO.ESTADO "
                    +"FROM PEDIDO INNER JOIN MESA ON PEDIDO.ID_MESA = MESA.ID_MESA "
                    +"INNER JOIN USUARIO ON PEDIDO.ID_USUARIO = USUARIO.ID_USUARIO "
                    +"INNER JOIN CLIENTE ON PEDIDO.ID_CLIENTE = CLIENTE.ID_CLIENTE WHERE ID_ROL=" + id;
        try {
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                pedido.setIdPedido(rs.getInt("ID_PEDIDO"));
                pedido.setIdMesa(rs.getInt("ID_MESA"));
                pedido.setIdUsuario(rs.getInt("ID_USUARIO"));
                pedido.setIdCliente(rs.getInt("ID_CLIENTE"));
                pedido.setTotal(rs.getFloat("TOTAL"));
                pedido.setObservacion(rs.getString("OBSERVACION"));
                pedido.setEstado(rs.getInt("ESTADO"));
            }
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return pedido;
    }

    @Override
    public boolean insertar(Pedido pedido) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "INSERT INTO PERMISO(ID_PERMISO,ID_MODULO,ID_ROL,ACTIVO) \n"
                + "  VALUES((SELECT ISNULL(MAX(ID_PERMISO),0)+ 1 FROM PERMISO),"
                + "'"+ pedido.getIdModulo() +"',"
                + "'"+ pedido.getIdRol() +"',"
                + "'"+ pedido.getIsActivo() +"')";
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
    public boolean modificar(Pedido pedido) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "UPDATE PERMISO SET ID_MODULO= '"+ pedido.getIdModulo() +"', "
                + "ID_ROL= '"+ pedido.getIdRol() +"', "
                + "ACTIVO= '"+ pedido.getIsActivo() +"'"
                + "WHERE ID_PERMISO= '"+ pedido.getIdPedido() +"'";
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
    public void eliminar(Pedido pedido) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "DELETE FROM PEDIDO WHERE ID_PEDIDO=" + pedido.getIdPedido();
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
