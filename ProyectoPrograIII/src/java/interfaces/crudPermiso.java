package interfaces;

import java.util.List;
import modelos.Permiso;

public interface crudPermiso {
    
    public List listar();
    public Permiso list (int id);
    public boolean insertar(Permiso permiso);
    public boolean modificar(Permiso permiso);
    public boolean eliminar(Permiso permiso);
    public List busqueda(String parametro, String opcion);
}
