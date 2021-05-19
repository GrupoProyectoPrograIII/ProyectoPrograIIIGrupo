
package interfaces;

import java.util.List;
import modelos.Pedido;

public interface crudPedido {
    public List listar();
    public Pedido list (int id);
    public boolean insertar(Pedido pedido);
    public boolean modificar(Pedido pedido);
    public void eliminar(Pedido pedido);
    public List busqueda(String parametro, String opcion);
}
