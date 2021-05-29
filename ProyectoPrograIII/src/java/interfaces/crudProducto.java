
package interfaces;

import java.util.List;
import modelos.Producto;


public interface crudProducto {
    public List listar();
    public Producto list(int id);
    public boolean insertar(Producto producto);
    public boolean modificar(Producto producto);
    public boolean eliminar(Producto producto);
    public List busqueda(String parametro, String opcion);
}
