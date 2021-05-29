
package interfaces;

import java.util.List;
import modelos.Despacho;


public interface crudDespacho {
    public List listar();
    public Despacho list(int id);
    public boolean insertar(Despacho despacho);
    public boolean modificar(Despacho despacho);
    public boolean eliminar(Despacho despacho);
    public List busqueda(String parametro, String opcion);
}
