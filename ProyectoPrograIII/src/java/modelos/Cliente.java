package modelos;

public class Cliente {
    private int idCliente;
    private String Nombre;
    private String Nit;
    private String Nickname;
    private String Direccion;
    private String Telefono;

    public Cliente() {
    }

    public Cliente(int idCliente, String Nombre, String Nit, String Nickname, String Direccion, String Telefono) {
        this.idCliente = idCliente;
        this.Nombre = Nombre;
        this.Nit = Nit;
        this.Nickname = Nickname;
        this.Direccion = Direccion;
        this.Telefono = Telefono;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getNit() {
        return Nit;
    }

    public void setNit(String Nit) {
        this.Nit = Nit;
    }

    public String getNickname() {
        return Nickname;
    }

    public void setNickname(String Nickname) {
        this.Nickname = Nickname;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public String getTelefono() {
        return Telefono;
    }

    public void setTelefono(String Telefono) {
        this.Telefono = Telefono;
    }
    
}
