
package interfaces;

import java.util.List;
import modelos.Area;

public interface crudArea {
    public List listar();
    public Area list (int id);
    public boolean insertar(Area area);
    public boolean modificar(Area area);
    public void eliminar(Area area);
    public List busqueda(String parametro, String opcion);
}
