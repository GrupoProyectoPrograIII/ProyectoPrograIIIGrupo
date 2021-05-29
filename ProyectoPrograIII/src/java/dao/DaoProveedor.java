/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import configuracion.Conexion;
import interfaces.crudProveedor;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.*;
import modelos.Proveedor;

/**
 *
 * @author JAVIER OSORIO
 */
public class DaoProveedor implements crudProveedor {

    String sql = "";
    Conexion con = new Conexion();
    ResultSet rs = null;
    boolean resp = false;
    Proveedor provee = new Proveedor();

    @Override
    public List listar() {
        ArrayList<Proveedor> lstProvee = new ArrayList<>();
        try {
            sql = "SELECT  ID_PROVEEDOR, NOMBRE_PROVEEDOR, TELEFONO, DIRECCION\n"
                    + "FROM            dbo.PROVEEDOR";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                provee = new Proveedor();
                provee.setId_proveedor(rs.getInt("ID_PROVEEDOR"));
                provee.setNombre_proveedor(rs.getString("NOMBRE_PROVEEDOR"));
                provee.setTelefono(rs.getString("TELEFONO"));
                provee.setDireccion(rs.getString("DIRECCION"));
                lstProvee.add(provee);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DaoUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstProvee;
    }

    @Override
    public Proveedor list(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean insertar(Proveedor prove) {
        sql = "INSERT INTO PROVEEDOR(ID_PROVEEDOR,NOMBRE_PROVEEDOR,TELEFONO,DIRECCION) VALUES((SELECT ISNULL(MAX(ID_PROVEEDOR),0) + 1 FROM PROVEEDOR),"
                + "'"+ prove.getNombre_proveedor() +"',"
                + "'"+ prove.getTelefono() +"',"
                + "'"+ prove.getDireccion() +"')";
        try {
            con.open();
            resp = con.executeSql(sql);
            con.close();
        } catch (Exception e) {
            System.err.println(e);
        }
        return resp;
    }

    @Override
    public boolean modificar(Proveedor prove) {
        sql = "UPDATE PROVEEDOR SET "
                + "NOMBRE_PROVEEDOR = '"+ prove.getNombre_proveedor() +"', "
                + "TELEFONO = '"+ prove.getTelefono() +"', "
                + "DIRECCION = '"+ prove.getDireccion() +"' "
                + "WHERE ID_PROVEEDOR = '"+ prove.getId_proveedor() +"'";
        try {
            con.open();
            resp = con.executeSql(sql);
            con.close();
        } catch (Exception e) {
            System.err.println(e);
        }
        return resp;
    }

    @Override
    public boolean eliminar(Proveedor prove) {
        sql = "DELETE FROM PROVEEDOR WHERE ID_PROVEEDOR = " + prove.getId_proveedor();
        try {
            con.open();
            resp = con.executeSql(sql);
            con.close();
        } catch (Exception e) {
            System.err.println(e);
        }
        return resp;
    }

    @Override
    public List busqueda(String parametro, String opcion) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
