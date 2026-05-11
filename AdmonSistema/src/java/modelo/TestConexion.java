package modelo;

public class TestConexion {
    public static void main(String[] args) {
        Conexion c = new Conexion();
        java.sql.Connection con = c.crearConexion();
        if (con != null) {
            System.out.println("Conexion exitosa!");
        } else {
            System.out.println("Conexion fallida.");
        }
    }
}