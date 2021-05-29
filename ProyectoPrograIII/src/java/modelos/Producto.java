package modelos;

public class Producto {
    private int idProducto;
    private String nombre;
    private double precio;
    private String unidad;
    private int idProveedor;
    //private String proveedor;
    private int stock;
    private int idTipoProducto;
   // private String tipoProducto;

    public Producto() {
    }
    
    
    public Producto(int idProducto, String nombre, double precio, String unidad, int idProveedor, int stock, int idTipoProducto) {
        this.idProducto = idProducto;
        this.nombre = nombre;
        this.precio = precio;
        this.unidad = unidad;
        this.idProveedor = idProveedor;
        //this.proveedor = proveedor;
        this.stock = stock;
        this.idTipoProducto = idTipoProducto;
        //this.tipoProducto = tipoProducto;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    public int getIdProveedor() {
        return idProveedor;
    }

    public void setIdProveedor(int idProveedor) {
        this.idProveedor = idProveedor;
    }

   

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getIdTipoProducto() {
        return idTipoProducto;
    }

    public void setIdTipoProducto(int idTipoProducto) {
        this.idTipoProducto = idTipoProducto;
    }

    
    
}
