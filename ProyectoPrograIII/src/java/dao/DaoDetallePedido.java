
package dao;

import configuracion.Conexion;
import interfaces.crudDetallePedido;
import java.util.List;
import modelos.DetallePedido;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DaoDetallePedido implements crudDetallePedido{
    
    DetallePedido detallePedido = null;
    String sql = "";
    Conexion con = new Conexion();
    ResultSet rs = null;
    boolean resp = false;

    @Override
    public List listar() {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        ArrayList<DetallePedido> lstDetallePedido = new ArrayList<>();
        try {
            sql = "SELECT DETALLE_PEDIDO.ID_DETALLE_PEDIDO AS ID, DETALLE_PEDIDO.ID_PEDIDO, "
                    +"PRODUCTO_COMBO.DESCRIPCION AS COMBO, DETALLE_PEDIDO.CANTIDAD, "
                    +"DETALLE_PEDIDO.PRECIO, DETALLE_PEDIDO.TOTAL_LINEA AS TOTAL, "
                    +"DETALLE_PEDIDO.ESTADO FROM DETALLE_PEDIDO "
                    +"INNER JOIN PEDIDO ON DETALLE_PEDIDO.ID_PEDIDO=PEDIDO.ID_PEDIDO "
                    +"INNER JOIN PRODUCTO_COMBO ON DETALLE_PEDIDO.ID_COMBO=PRODUCTO_COMBO.ID_COMBO";
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                detallePedido = new DetallePedido();
                detallePedido.setIdDetalle(rs.getInt("ID_DETALLE_PEDIDO"));
                detallePedido.setIdPedido(rs.getInt("ID_PEDIDO"));
                detallePedido.setIdCombo(rs.getInt("ID_COMBO"));
                detallePedido.setCombo(rs.getString("COMBO"));
                detallePedido.setCantidad(rs.getInt("CANTIDAD"));
                detallePedido.setPrecio(rs.getFloat("PRECIO"));
                detallePedido.setTotalLinea(rs.getFloat("TOTAL_LINEA"));
                lstDetallePedido.add(detallePedido);
            }
            rs.close();
            con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DaoDetallePedido.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(DaoDetallePedido.class.getName()).log(Level.SEVERE, null, ex);
        }
        return lstDetallePedido;
    }

    @Override
    public DetallePedido list(int id) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "SELECT DETALLE_PEDIDO.ID_DETALLE_PEDIDO AS ID, DETALLE_PEDIDO.ID_PEDIDO, "
                    +"PRODUCTO_COMBO.DESCRIPCION AS COMBO, DETALLE_PEDIDO.CANTIDAD, "
                    +"DETALLE_PEDIDO.PRECIO, DETALLE_PEDIDO.TOTAL_LINEA AS TOTAL, "
                    +"DETALLE_PEDIDO.OBSERVACION, DETALLE_PEDIDO.ESTADO FROM DETALLE_PEDIDO "
                    +"INNER JOIN PEDIDO ON DETALLE_PEDIDO.ID_PEDIDO=PEDIDO.ID_PEDIDO "
                    +"INNER JOIN PRODUCTO_COMBO ON DETALLE_PEDIDO.ID_COMBO=PRODUCTO_COMBO.ID_COMBO WHERE ID_DETALLE_PEDIDO=" + id;
        try {
            con.open();
            rs = con.executeQuery(sql);
            while (rs.next()) {
                detallePedido.setIdDetalle(rs.getInt("ID_DETALLE_PEDIDO"));
                detallePedido.setIdPedido(rs.getInt("ID_PEDIDO"));
                detallePedido.setIdCombo(rs.getInt("ID_COMBO"));
                detallePedido.setCombo(rs.getString("COMBO"));
                detallePedido.setCantidad(rs.getInt("CANTIDAD"));
                detallePedido.setPrecio(rs.getFloat("PRECIO"));
                detallePedido.setTotalLinea(rs.getFloat("TOTAL_LINEA"));
            }
            rs.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e);
        }
        return detallePedido;
    }

    @Override
    public boolean insertar(DetallePedido detallePedido) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "INSERT INTO DETALLE_PEDIDO(ID_DETALLE_PEDIDO,ID_COMBO,CANTIDAD,"
                +"PRECIO,TOTAL_LINEA,OBSERVACION,ESTADO) "
                + "  VALUES((SELECT ISNULL(MAX(ID_DETALLE_PEDIDO),0)+ 1 FROM DETALLE_PEDIDO),"
                + " "+ detallePedido.getIdPedido() +","
                + " "+ detallePedido.getIdCombo() +","
                + " "+ detallePedido.getCombo()+","
                + " "+ detallePedido.getCantidad() +","
                + " "+ detallePedido.getPrecio() +","
                + " "+ detallePedido.getTotalLinea() +")";
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
    public boolean modificar(DetallePedido detallePedido) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "UPDATE DETALLE_PEDIDO SET "
                + "ID_DETALLE_PEDIDO="+ detallePedido.getIdDetalle() +", "
                + "ID_PEDIDO="+ detallePedido.getIdPedido() +", "
                + "ID_COMBO="+ detallePedido.getIdCombo() +", "
                + "COMBO="+ detallePedido.getCombo() +", "
                + "CANTIDAD="+ detallePedido.getCantidad() +", "
                + "PRECIO="+ detallePedido.getPrecio() +", "
                + "TOTAL_LINEA="+ detallePedido.getTotalLinea() +" "
                + "WHERE ID_DETALLE_PEDIDO= '"+ detallePedido.getIdDetalle() +"'";
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
    public void eliminar(DetallePedido detallePedido) {
        //throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        sql = "DELETE FROM DETALLE_PEDIDO WHERE ID_DETALLE_PEDIDO=" + detallePedido.getIdDetalle();
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
