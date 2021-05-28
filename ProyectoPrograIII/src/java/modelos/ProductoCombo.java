package modelos;

public class ProductoCombo {
    private int idCombo;
    private String tipoCombo;
    private String nombre;
    private double precio;

    public ProductoCombo() {
    }

    public ProductoCombo(int idCombo, String tipoCombo, String nombre, double precio) {
        this.idCombo = idCombo;
        this.tipoCombo = tipoCombo;
        this.nombre = nombre;
        this.precio = precio;
    }

    public int getIdCombo() {
        return idCombo;
    }

    public void setIdCombo(int idCombo) {
        this.idCombo = idCombo;
    }

    public String getTipoCombo() {
        return tipoCombo;
    }

    public void setTipoCombo(String tipoCombo) {
        this.tipoCombo = tipoCombo;
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
    
}
