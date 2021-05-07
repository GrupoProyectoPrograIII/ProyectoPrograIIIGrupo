
package modelos;

public class Permiso {
    private int idPermiso;
    private int idModulo;
    private int idRol;
    private String modulo;
    private String rol;
    private String fechaCrear;
    private String fechaMod;
    private String userCrear; //aparece en BD como int
    private String userMod; //aparece en BD como int
    private int isActivo;

    public int getIdPermiso() {
        return idPermiso;
    }

    public void setIdPermiso(int idPermiso) {
        this.idPermiso = idPermiso;
    }

    public int getIdModulo() {
        return idModulo;
    }

    public void setIdModulo(int idModulo) {
        this.idModulo = idModulo;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public String getModulo() {
        return modulo;
    }

    public void setModulo(String modulo) {
        this.modulo = modulo;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
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
