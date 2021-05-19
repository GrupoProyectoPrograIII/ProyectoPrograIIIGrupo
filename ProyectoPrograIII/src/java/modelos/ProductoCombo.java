package modelos;

public class ProductoCombo {
    private int idCombo;
    private int idTipo;
    private String Descripcion;
    private float Precio;
    private int Estado;

    public ProductoCombo() {
    }

    public ProductoCombo(int idCombo, int idTipo, String Descripcion, float Precio, int Estado) {
        this.idCombo = idCombo;
        this.idTipo = idTipo;
        this.Descripcion = Descripcion;
        this.Precio = Precio;
        this.Estado = Estado;
    }

    public int getIdCombo() {
        return idCombo;
    }

    public void setIdCombo(int idCombo) {
        this.idCombo = idCombo;
    }

    public int getIdTipo() {
        return idTipo;
    }

    public void setIdTipo(int idTipo) {
        this.idTipo = idTipo;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public float getPrecio() {
        return Precio;
    }

    public void setPrecio(float Precio) {
        this.Precio = Precio;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }
    
}
