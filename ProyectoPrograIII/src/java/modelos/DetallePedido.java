package modelos;

public class DetallePedido {
    private int idDetalle;
    private int idPedido;
    private int idCombo;
    private int Cantidad;
    private float Precio;
    private float totalLinea;
    private String Observacion;
    private int Estado;

    public DetallePedido() {
    }

    public DetallePedido(int idDetalle, int idPedido, int idCombo, int Cantidad, float Precio, float totalLinea, String Observacion, int Estado) {
        this.idDetalle = idDetalle;
        this.idPedido = idPedido;
        this.idCombo = idCombo;
        this.Cantidad = Cantidad;
        this.Precio = Precio;
        this.totalLinea = totalLinea;
        this.Observacion = Observacion;
        this.Estado = Estado;
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

    public String getObservacion() {
        return Observacion;
    }

    public void setObservacion(String Observacion) {
        this.Observacion = Observacion;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }
    
}
