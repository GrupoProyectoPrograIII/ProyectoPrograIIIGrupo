package interfaces;

import java.util.List;
import modelos.Modulo;

public interface crudModulo {
    
    public List listar();
    public Modulo list (int id);
    public boolean insertar(Modulo modulo);
    public boolean modificar(Modulo modulo);
    public boolean eliminar(Modulo modulo);
    public List busqueda(String parametro, String opcion);
}
