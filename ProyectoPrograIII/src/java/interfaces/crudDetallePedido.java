
package interfaces;

import java.util.List;
import modelos.DetallePedido;

public interface crudDetallePedido {
    public List listar();
    public DetallePedido list (int id);
    public boolean insertar(DetallePedido detallePedido);
    public boolean modificar(DetallePedido detallePedido);
    public void eliminar(DetallePedido detallePedido);
    public List busqueda(String parametro, String opcion);
}
