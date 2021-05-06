
package configuracion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class conexion {
    private PreparedStatement preparar = null;
    private Connection coneccion = null;
    private ResultSet resultado = null;
    //Cadena de Conexion    
    //Cambio de la cadena conexion pc escritorio: DESKTOP-O84DBVU\\SQLEXPRESS--> ANTONIO
    //AQUI debe ir el nombre de su servidor SQL***
    String stringConnectionUrl = "jdbc:sqlserver://DESKTOP-O84DBVU\\SQLEXPRESS:1433;"
            + "databaseName=PROYECTOGRUPOA;";
    //Driver o controlador JDBC
    String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
    //
    private boolean respuesta = false;

    public Connection open() throws ClassNotFoundException {
        try {
            Class.forName(driver);

            coneccion = DriverManager.getConnection(stringConnectionUrl, "sa", "Login2021");
        } catch (SQLException e) {
            Logger.getLogger(conexion.class.getName()).log(Level.SEVERE, null, e);
            System.out.println("Excepción: " + e.getMessage());
        }
        return coneccion;
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
                this.preparar = this.coneccion.prepareStatement(cmd);
                this.preparar.executeUpdate();
                respuesta = true;
            } catch (SQLException e) {
                throw new Exception(e.getMessage());
            }
        } else {
            throw new Exception("El comando a ejecutar es nulo!");
        }
        return respuesta;
    }

    public ResultSet executeQuery(String strSQL) {

        if (strSQL != null) {
            try {

                preparar = coneccion.prepareStatement(strSQL);
                resultado = preparar.executeQuery();
            } catch (SQLException e) {
                System.out.println("Error al ejecutar el query en Clase: Conexion: " + e.toString());
                Logger.getLogger(conexion.class.getName()).log(Level.SEVERE, null, e);
            }
        }
        //close();
        return resultado;
    }
}
