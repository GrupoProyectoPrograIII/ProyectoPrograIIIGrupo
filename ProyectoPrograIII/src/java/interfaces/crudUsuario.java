
package interfaces;

import java.util.List;
import modelos.Usuario;

public interface crudUsuario{
    public List listar();
    public Usuario list (int id);
    public boolean insertar(Usuario user);
    public boolean modificar(Usuario user);
    public boolean eliminar(Usuario user);
    public List busqueda(String parametro, String opcion);
}
