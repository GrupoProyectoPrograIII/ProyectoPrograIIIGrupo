package modelos;

public class ProductoCombo {

    private int idCombo;
    private int idTipoCombo;
    private String nombre;
    private double precio;
    private int estado;

    public ProductoCombo() {
    }

    public ProductoCombo(int idCombo, int idTipoCombo, String nombre, double precio, int estado) {
        this.idCombo = idCombo;
        this.idTipoCombo = idTipoCombo;
        this.nombre = nombre;
        this.precio = precio;
        this.estado = estado;
    }

    public int getIdCombo() {
        return idCombo;
    }

    public void setIdCombo(int idCombo) {
        this.idCombo = idCombo;
    }

    public int getIdTipoCombo() {
        return idTipoCombo;
    }

    public void setIdTipoCombo(int idTipoCombo) {
        this.idTipoCombo = idTipoCombo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }
    
    
}
