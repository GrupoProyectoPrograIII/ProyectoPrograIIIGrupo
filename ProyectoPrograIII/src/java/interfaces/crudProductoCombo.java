
package interfaces;

import java.util.List;
import modelos.ProductoCombo;

public interface crudProductoCombo {
    public List listar();
    public ProductoCombo list (int id);
    public boolean insertar(ProductoCombo productoCombo);
    public boolean modificar(ProductoCombo productoCombo);
    public void eliminar(ProductoCombo productoCombo);
    public List busqueda(String parametro, String opcion);
}
