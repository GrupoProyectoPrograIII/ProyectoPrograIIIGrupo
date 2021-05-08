package modelos;

public class Modulo {
    private int idModulo;
    private String nombre;
    private String descripcion;
    private String path;
    private int nivel;
    private String orden;
    private int idModuloPadre;
    private String fechaCrear;
    private String fechaMod;
    private String userCrear; //esto fue marcado como int en DB
    private String userMod; //esto fue marcado como int en DB
    private int isActivo;

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

    public String getOrden() {
        return orden;
    }

    public void setOrden(String orden) {
        this.orden = orden;
    }

    public int getIdModuloPadre() {
        return idModuloPadre;
    }

    public void setIdModuloPadre(int idModuloPadre) {
        this.idModuloPadre = idModuloPadre;
    }

    public String getFechaCrear() {
        return fechaCrear;
    }

    public void setFechaCrear(String fechaCrear) {
        this.fechaCrear = fechaCrear;
    }

    public String getFechaMod() {
        return fechaMod;
    }

    public void setFechaMod(String fechaMod) {
        this.fechaMod = fechaMod;
    }

    public String getUserCrear() {
        return userCrear;
    }

    public void setUserCrear(String userCrear) {
        this.userCrear = userCrear;
    }

    public String getUserMod() {
        return userMod;
    }

    public void setUserMod(String userMod) {
        this.userMod = userMod;
    }

    public int getIsActivo() {
        return isActivo;
    }

    public void setIsActivo(int isActivo) {
        this.isActivo = isActivo;
    }
    
    
    
}
