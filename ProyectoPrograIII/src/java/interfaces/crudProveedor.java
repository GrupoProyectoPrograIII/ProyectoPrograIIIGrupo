/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package interfaces;

import java.util.List;
import modelos.Proveedor;

/**
 *
 * @author JAVIER OSORIO
 */
public interface crudProveedor {
    public List listar();
    public Proveedor list (int id);
    public boolean insertar(Proveedor prove);
    public boolean modificar(Proveedor prove);
    public boolean eliminar(Proveedor prove);
    public List busqueda(String parametro, String opcion);
}
