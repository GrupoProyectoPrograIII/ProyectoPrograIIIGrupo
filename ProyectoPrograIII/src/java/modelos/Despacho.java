/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

/**
 *
 * @author JAVIER OSORIO
 */
public class Despacho {
    private int id_despacho;
    private int pedido;
    private String descripcion;
    private String area;
    private String mesa;

    public int getId_despacho() {
        return id_despacho;
    }

    public void setId_despacho(int id_despacho) {
        this.id_despacho = id_despacho;
    }

    public int getPedido() {
        return pedido;
    }

    public void setPedido(int pedido) {
        this.pedido = pedido;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getMesa() {
        return mesa;
    }

    public void setMesa(String mesa) {
        this.mesa = mesa;
    }
    
    
}
