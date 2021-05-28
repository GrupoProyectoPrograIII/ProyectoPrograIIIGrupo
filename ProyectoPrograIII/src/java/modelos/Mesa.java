package modelos;

public class Mesa {
    private int idMesa;
    private int idArea;
    private String area;
    private String mesa;
    private int Asientos;
    private int idEstado;

    public Mesa() {
    }

    public Mesa(int idMesa, int idArea, String mesa, String area, int Asientos, int idEstado) {
        this.idMesa = idMesa;
        this.idArea = idArea;
        this.mesa = mesa;
        this.area = area;
        this.Asientos = Asientos;
        this.idEstado = idEstado;
    }

    public int getIdMesa() {
        return idMesa;
    }

    public void setIdMesa(int idMesa) {
        this.idMesa = idMesa;
    }

    public int getIdArea() {
        return idArea;
    }

    public void setIdArea(int idArea) {
        this.idArea = idArea;
    }

    public String getMesa() {
        return mesa;
    }

    public void setMesa(String mesa) {
        this.mesa = mesa;
    }
    
    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public int getAsientos() {
        return Asientos;
    }

    public void setAsientos(int Asientos) {
        this.Asientos = Asientos;
    }

    public int getIdEstado() {
        return idEstado;
    }

    public void setIdEstado(int idEstado) {
        this.idEstado = idEstado;
    }
    
}
