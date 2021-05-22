package configuracion;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexion {
    private PreparedStatement preparar = null;
    private Connection coneccion = null;
    private ResultSet resultado = null;
    Connection con;
    
    //Cadena de Conexion    
    //AQUI debe ir el nombre de su servidor SQL***
    String stringConnectionUrl = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;"
            + "databaseName=DB_PROYECTO_1;";
    //Driver o controlador JDBC
    String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    //
    private final String user = "sa";
    private final String pass= "1234";
    private boolean respuesta = false;

    public Connection open() throws ClassNotFoundException {
        try {
            Class.forName(driver);

            coneccion = DriverManager.getConnection(stringConnectionUrl, user, pass);
        } catch (SQLException e) {
            Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, e);
            System.err.println("Excepción: " + e.getMessage());
        }
        return coneccion;
    }
    
    public Connection Conexion(){
        
        try {
            Class.forName(driver);
            con = DriverManager.getConnection(stringConnectionUrl,user, pass);
        } catch (Exception e) {
            System.out.println("Excepción: " + e.getMessage());
        }
        return con;
    }
    
    public void close() throws Exception {
        //Connection coneccion = null;
        try {
            if (coneccion != null) {
                coneccion.clearWarnings();
                coneccion.close();
            }
        } catch (SQLException e) {
            coneccion = null;
            throw new Exception(e.getMessage());
        }

    }
    public boolean executeSql(String cmd) throws Exception {
        if (cmd != null) {
            try {
                this.coneccion.setAutoCommit(false);
                this.preparar = this.coneccion.prepareStatement(cmd);
                this.preparar.executeUpdate();
                this.coneccion.commit();
                this.coneccion.setAutoCommit(true);
                respuesta = true;
            } catch (SQLException e) {
                System.err.println("Error al ejecutar executeSql en Clase: Conexion: " + e.toString());
                this.coneccion.rollback();
            }
        } else {
            throw new Exception("El comando a ejecutar es nulo!");
        }
        return respuesta;
    }
    public ResultSet executeQuery(String strSQL) throws Exception {
        if (strSQL != null) {
            try {
                this.coneccion.setAutoCommit(false);
                preparar = coneccion.prepareStatement(strSQL);
                resultado = preparar.executeQuery();
                this.coneccion.commit();
                this.coneccion.setAutoCommit(true);
            } catch (SQLException e) {
                System.err.println("Error al ejecutar el query en Clase: Conexion: " + e.toString());
                this.coneccion.rollback();
                //Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        //close();
        return resultado;
    }
    
}
