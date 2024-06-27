package pe.edu.upeu.academico.dao;

import java.util.List;
import pe.edu.upeu.academico.dto.UsuariLogin;
import pe.edu.upeu.academico.entity.Usuario;

/**
 *
 * @author Docente
 */
public interface UsuarioDao {
    public int createUsuario(Usuario usuario);
    public int updateUsuario(Usuario usuario);
    public int deleteUsuario(int id);
    public Usuario readUsuario(int id);
    public List<Usuario> readAllUsuario();
    public boolean buscarUsuario(String username);
    public List<UsuariLogin> login(String username, String clave);
}
