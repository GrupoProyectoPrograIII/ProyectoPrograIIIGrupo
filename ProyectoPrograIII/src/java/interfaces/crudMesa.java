
package interfaces;

import java.util.List;
import modelos.Mesa;

public interface crudMesa {
    public List listar();
    public Mesa list (int id);
    public boolean insertar(Mesa mesa);
    public boolean modificar(Mesa mesa);
    public void eliminar(Mesa mesa);
    public List busqueda(String parametro, String opcion);
}
