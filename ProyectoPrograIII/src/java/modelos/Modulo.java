package modelos;

public class Modulo {
    private int idModulo;
    private String nombre;
    private String descripcion;
    private String path;
    private int nivel;
    private int orden;
    private int idModuloPadre;

    public Modulo() {
    }

    public Modulo(int idModulo, String nombre, String descripcion, String path, int nivel, int orden, int idModuloPadre) {
        this.idModulo = idModulo;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.path = path;
        this.nivel = nivel;
        this.orden = orden;
        this.idModuloPadre = idModuloPadre;
    }
    
    public int getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(int idModulo) {
        this.idModulo = idModulo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public int getNivel() {
        return nivel;
    }

    public void setNivel(int nivel) {
        this.nivel = nivel;
    }

    public int getOrden() {
        return orden;
    }

    public void setOrden(int orden) {
        this.orden = orden;
    }

    public int getIdModuloPadre() {
        return idModuloPadre;
    }

    public void setIdModuloPadre(int idModuloPadre) {
        this.idModuloPadre = idModuloPadre;
    }
    
}
