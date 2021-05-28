package modelos;

public class Inventario {

    private int codigo_pro;
    private String descripcion;
    private int id_categoria;
    private String desc_categoria;
    private int stock;
    private int detalle_pro;
    private String proveedor;
    private String unidad;
    private Double costo_uni;
    private Double cantidad;

    public int getCodigo_pro() {
        return codigo_pro;
    }

    public void setCodigo_pro(int codigo_pro) {
        this.codigo_pro = codigo_pro;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getDesc_categoria() {
        return desc_categoria;
    }

    public void setDesc_categoria(String desc_categoria) {
        this.desc_categoria = desc_categoria;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getDetalle_pro() {
        return detalle_pro;
    }

    public void setDetalle_pro(int detalle_pro) {
        this.detalle_pro = detalle_pro;
    }

    public String getProveedor() {
        return proveedor;
    }

    public void setProveedor(String proveedor) {
        this.proveedor = proveedor;
    }

    public String getUnidad() {
        return unidad;
    }

    public void setUnidad(String unidad) {
        this.unidad = unidad;
    }

    public Double getCosto_uni() {
        return costo_uni;
    }

    public void setCosto_uni(Double costo_uni) {
        this.costo_uni = costo_uni;
    }

    public Double getCantidad() {
        return cantidad;
    }

    public void setCantidad(Double cantidad) {
        this.cantidad = cantidad;
    }
}
