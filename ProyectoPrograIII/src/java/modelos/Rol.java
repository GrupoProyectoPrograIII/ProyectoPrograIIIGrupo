package modelos;

public class Rol {
    private int idRol;
    private String nombre;
    private String descripcion;
    private int isActivo;
    private String userCrear; //aparece en BD como int
    private String userMod; //aparece en BD como int
    private String fechaCrear;
    private String fechaMod;

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
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

    public int getIsActivo() {
        return isActivo;
    }

    public void setIsActivo(int isActivo) {
        this.isActivo = isActivo;
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
    
}
