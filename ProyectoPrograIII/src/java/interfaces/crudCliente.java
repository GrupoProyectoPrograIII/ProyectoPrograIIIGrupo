
package interfaces;

import java.util.List;
import modelos.Cliente;

public interface crudCliente {
    public List listar();
    public Cliente list (int id);
    public boolean insertar(Cliente cliente);
    public boolean modificar(Cliente cliente);
    public void eliminar(Cliente cliente);
    public List busqueda(String parametro, String opcion);
}
