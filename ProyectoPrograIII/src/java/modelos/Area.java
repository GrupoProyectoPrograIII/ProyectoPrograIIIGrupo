package modelos;

public class Area {
    private int idArea;
    private String nombre;
    private int Estado;

    public Area() {
    }

    public Area(int idArea, String nombre, int Estado) {
        this.idArea = idArea;
        this.nombre = nombre;
        this.Estado = Estado;
    }

    public int getIdArea() {
        return idArea;
    }

    public void setIdArea(int idArea) {
        this.idArea = idArea;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEstado() {
        return Estado;
    }

    public void setEstado(int Estado) {
        this.Estado = Estado;
    }
    
}
