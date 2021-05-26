package modelos;

public class Mesa {
    private int idMesa;
    private int idArea;
    private String Descripcion;
    private String areaDescrip;
    private int Asientos;
    private int idEstado;

    public Mesa() {
    }

    public Mesa(int idMesa, int idArea, String Descripcion, String areaDescripcion, int Asientos, int idEstado) {
        this.idMesa = idMesa;
        this.idArea = idArea;
        this.Descripcion = Descripcion;
        this.areaDescrip = areaDescripcion;
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

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }
    
    public String getAreaDescrip() {
        return areaDescrip;
    }

    public void setAreaDescrip(String areaDescrip) {
        this.areaDescrip = areaDescrip;
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
