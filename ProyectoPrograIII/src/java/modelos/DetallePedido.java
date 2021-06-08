package modelos;

public class DetallePedido {
    private int idDetalle;
    private int idPedido;
    private int idCombo;
    private String Combo;
    private int Cantidad;
    private float Precio;
    private float totalLinea;
    private int idEstado;

    public DetallePedido() {
    }

    public DetallePedido(int idDetalle, int idPedido, int idCombo, String Combo, int Cantidad, float Precio, float totalLinea, int idEstado) {
        this.idDetalle = idDetalle;
        this.idPedido = idPedido;
        this.idCombo = idCombo;
        this.Combo = Combo;
        this.Cantidad = Cantidad;
        this.Precio = Precio;
        this.totalLinea = totalLinea;
        this.idEstado = idEstado;
    }

    public int getIdDetalle() {
        return idDetalle;
    }

    public void setIdDetalle(int idDetalle) {
        this.idDetalle = idDetalle;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public int getIdCombo() {
        return idCombo;
    }

    public void setIdCombo(int idCombo) {
        this.idCombo = idCombo;
    }

    public String getCombo() {
        return Combo;
    }

    public void setCombo(String Combo) {
        this.Combo = Combo;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    public float getPrecio() {
        return Precio;
    }

    public void setPrecio(float Precio) {
        this.Precio = Precio;
    }

    public float getTotalLinea() {
        return totalLinea;
    }

    public void setTotalLinea(float totalLinea) {
        this.totalLinea = totalLinea;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }
    
}
