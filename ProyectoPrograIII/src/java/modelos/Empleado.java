/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelos;

/**
 *
 * @author family.user
 */
public class Empleado {
    int idEmpleado;
    int idRol;
    //String dpi;
    String nombre;
    String username;
    //String telefono;
    String clave;
    int estado;

    public Empleado() {
    }

    public Empleado(int idEmpleado, int idRol, String nombre, String username, String clave, int estado) {
        this.idEmpleado = idEmpleado;
        this.idRol = idRol;
        this.nombre = nombre;
        this.username = username;
        this.clave = clave;
        this.estado = estado;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public int getEstado() {
        return estado;
    }

    public void setEstado(int estado) {
        this.estado = estado;
    }

    
    
}
