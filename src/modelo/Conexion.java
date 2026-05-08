package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {
    
    // =======================================================================
    // CONFIGURACIÓN DE CONEXIÓN A ORACLE
    // Asegúrate de modificar estos valores según tu entorno local de Oracle.
    // =======================================================================
    private static final String DRIVER = "oracle.jdbc.OracleDriver";
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE"; // Cambiar 'XE' por tu SID si es diferente
    private static final String USER = "TU_USUARIO_ORACLE"; // Cambiar por tu usuario
    private static final String PASSWORD = "TU_PASSWORD";   // Cambiar por tu contraseña

    public Connection getConnection() {
        Connection con = null;
        try {
            // 1. Cargar el Driver (ojdbc)
            Class.forName(DRIVER);
            
            // 2. Establecer la conexión
            con = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("✅ Conexión exitosa a la base de datos Oracle.");
            
        } catch (ClassNotFoundException e) {
            System.err.println("❌ ERROR: No se encontró el driver de Oracle. Verifica que ojdbc.jar esté configurado.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("❌ ERROR: No se pudo conectar a la base de datos.");
            e.printStackTrace();
        }
        return con;
    }
}
