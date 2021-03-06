/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;
import modelos.Inventario;

/**
 *
 * @author JAVIER OSORIO
 */
public interface crudInventario {
    public List listar_categoria();
    public List listar_inv_general();
    public List listar_inv_detalle();
    public Inventario list(int id);
    public boolean insertar_general(Inventario inv);
    public boolean insertar_detalle(Inventario inv);
    public boolean modificar_general(Inventario inv);
    public boolean modificar_detalle(Inventario inv);
    public boolean eliminar(Inventario inv);
    public List busqueda(String parametro, String opcion);
}
