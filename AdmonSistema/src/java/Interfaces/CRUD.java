/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Interface.java to edit this template
 */
package Interfaces;

import java.util.List;
import modelo.Usuario;

/**
 *
 * @author dulce
 */
public interface CRUD {

    public int agregarUsuario(Usuario u);
    
    public int actualizarUsuarios(Usuario u);
    
    public int eliminarUsuarios(int id);
    
    public Usuario listarUsuarios_Id(int id);
    
    public List<Usuario> listadoUsuarios();
}
