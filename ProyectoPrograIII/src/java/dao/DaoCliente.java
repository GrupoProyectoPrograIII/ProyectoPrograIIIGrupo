
package dao;

import configuracion.Conexion;
import interfaces.crudCliente;
import java.util.List;
import modelos.Cliente;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoCliente implements crudCliente{
    
    Cliente cliente = null;
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
        List<Cliente> lstCliente = new ArrayList<>();
        try {
            sql = "SELECT * FROM CLIENTE";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                cliente = new Cliente();
                cliente.setIdCliente(rs.getInt("ID_CLIENTE"));
                cliente.setNombre(rs.getString("NOMBRE"));
                cliente.setNit(rs.getString("NIT"));
                cliente.setNickname(rs.getString("NICKNAME"));
                cliente.setDireccion(rs.getString("DIRECCION"));
                cliente.setTelefono(rs.getString("TELEFONO"));
                
                lstCliente.add(cliente);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoCliente.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DaoCliente.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstCliente;
    }

    @Override
    public Cliente list(int id) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "SELECT * FROM CLIENTE WHERE ID_CLIENTE="+ id;
        try {
            con.open();
            rs = con.executeQuery(sql);
            while(rs.next()){
                cliente.setIdCliente(rs.getInt("ID_CLIENTE"));
                cliente.setNombre(rs.getString("NOMBRE"));
                cliente.setNit(rs.getString("NIT"));
                cliente.setNickname(rs.getString("NICKNAME"));
                cliente.setDireccion(rs.getString("DIRECCION"));
                cliente.setTelefono(rs.getString("TELEFONO"));
            }
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return cliente;
    }

    @Override
    public boolean insertar(Cliente cliente) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "INSERT INTO CLIENTE (ID_CLIENTE, NOMBRE, NIT, NICKNAME, DIRECCION, TELEFONO) "
                +"VALUES((SELECT ISNULL(MAX(ID_CLIENTE),0) + 1 FROM CLIENTE),'"
                +cliente.getNombre()+"','"
                +cliente.getNit()+"','"
                +cliente.getNickname()+"','"                
                +cliente.getDireccion()+"','"
                +cliente.getTelefono()+"')";
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
    public boolean modificar(Cliente cliente) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "UPDATE CLIENTE SET ID_CLIENTE="+cliente.getIdCliente()
                +", NOMBRE= '"+cliente.getNombre()
                +"', NIT='"+cliente.getNit()
                +"', NICKNAME='"+cliente.getNickname()
                +"', DIRECCION='"+cliente.getDireccion()
                +"', TELEFONO='"+cliente.getTelefono()
                +"' WHERE ID_CLIENTE="+cliente.getIdCliente();
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
    public void eliminar(Cliente cliente) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "DELETE FROM CLIENTE WHERE ID_CLIENTE= "+cliente.getIdCliente();
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
