package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.io.InputStream;
import java.util.Properties;

public class Conexion {
    
    private String driver;
    private String url;
    private String user;
    private String password;

    public Conexion() {
        // Cargar las credenciales desde el archivo db.properties
        Properties props = new Properties();
        try (InputStream in = getClass().getClassLoader().getResourceAsStream("db.properties")) {
            if (in != null) {
                props.load(in);
                this.driver = props.getProperty("DB_DRIVER", "oracle.jdbc.OracleDriver");
                this.url = props.getProperty("DB_URL", "jdbc:oracle:thin:@localhost:1521:XE");
                this.user = props.getProperty("DB_USER", "SYSTEM");
                this.password = props.getProperty("DB_PASS", "");
            } else {
                System.err.println("⚠️ ADVERTENCIA: No se encontró db.properties. Usando valores por defecto.");
                this.driver = "oracle.jdbc.OracleDriver";
                this.url = "jdbc:oracle:thin:@localhost:1521:XE";
                this.user = "SYSTEM";
                this.password = "";
            }
        } catch (Exception e) {
            System.err.println("❌ ERROR: Error al leer db.properties.");
            e.printStackTrace();
        }
    }

    public Connection getConnection() {
        Connection con = null;
        try {
            // 1. Cargar el Driver (ojdbc)
            Class.forName(this.driver);
            
            // 2. Establecer la conexión
            con = DriverManager.getConnection(this.url, this.user, this.password);
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
