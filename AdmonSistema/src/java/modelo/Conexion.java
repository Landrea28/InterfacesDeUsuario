/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author dulce
 */
public class Conexion {

 public static String usuario="root";
 public static String clave="";
 public static String servidor="localhost:3306";
 public static String BD="tienda";

 public Connection crearConexion()
 {
 Connection con=null;

 try
 {
 Class.forName("com.mysql.cj.jdbc.Driver");
 String URL="jdbc:mysql://"+servidor+"/"+BD;
 con=DriverManager.getConnection(URL, usuario,clave);
 }
 catch(java.lang.ClassNotFoundException ex)
 {
 throw new RuntimeException("Driver ClassNotFound: " + ex.getMessage());
 }
 catch(SQLException e)
 {
 throw new RuntimeException("SQLException: " + e.getMessage());
 }

 return con;
 }
}
