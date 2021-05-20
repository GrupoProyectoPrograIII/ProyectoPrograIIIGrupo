package modelos;

public class Pedido {
    private int idPedido;
    private int idMesa;
    private int idUsuario;
    private int idCliente;
    private float Total;
    private String Observacion;
    private int Estado;

    public Pedido() {
    }

    public Pedido(int idPedido, int idMesa, int idUsuario, int idCliente, float Total, String Observacion, int Estado) {
        this.idPedido = idPedido;
        this.idMesa = idMesa;
        this.idUsuario = idUsuario;
        this.idCliente = idCliente;
        this.Total = Total;
        this.Observacion = Observacion;
        this.Estado = Estado;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public int getIdMesa() {
        return idMesa;
    }

    public void setIdMesa(int idMesa) {
        this.idMesa = idMesa;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public float getTotal() {
        return Total;
    }

    public void setTotal(float Total) {
        this.Total = Total;
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
