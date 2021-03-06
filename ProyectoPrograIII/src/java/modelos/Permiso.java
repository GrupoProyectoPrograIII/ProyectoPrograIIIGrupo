
package modelos;

public class Permiso {
    private int idPermiso;
    private int idModulo;
    private int idRol;
    private String modulo;
    private String rol;

    public Permiso() {
    }

    
    public Permiso(int idPermiso, int idModulo, int idRol, String modulo, String rol) {
        this.idPermiso = idPermiso;
        this.idModulo = idModulo;
        this.idRol = idRol;
        this.modulo = modulo;
        this.rol = rol;
    }

    
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

}
