package modelos;

public class Usuario {
    private int idUser;
    private int idRol;
    private String nombre;
    private String apellido;
    private String user;
    private String pass;
    private String rol;
    private int isActivo;
    public Usuario() {
    }

    public Usuario(int idUser, int idRol, String nombre, String apellido, String user, String pass, String rol, int isActivo) {
        this.idUser = idUser;
        this.idRol = idRol;
        this.nombre = nombre;
        this.apellido = apellido;
        this.user = user;
        this.pass = pass;
        this.rol = rol;
        this.isActivo = isActivo;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

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

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public int getIsActivo() {
        return isActivo;
    }

    public void setIsActivo(int isActivo) {
        this.isActivo = isActivo;
    }    
}
