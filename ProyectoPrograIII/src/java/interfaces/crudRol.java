package interfaces;

import java.util.List;
import modelos.Rol;

public interface crudRol {
    public List listar();
    public Rol list (int id);
    public boolean insertar(Rol rol);
    public boolean modificar(Rol rol);
    public boolean eliminar(Rol rol);
    public List busqueda(String parametro, String opcion);
}
