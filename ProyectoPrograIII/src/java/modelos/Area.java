package modelos;

public class Area {
    private int idArea;
    private String Descripcion;
    private int Estado;

    public Area() {
    }

    public Area(int idArea, String Descripcion, int Estado) {
        this.idArea = idArea;
        this.Descripcion = Descripcion;
        this.Estado = Estado;
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

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }
    
}
