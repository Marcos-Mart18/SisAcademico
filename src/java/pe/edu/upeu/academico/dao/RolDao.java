
package pe.edu.upeu.academico.dao;

import java.util.List;
import pe.edu.upeu.academico.entity.Rol;

/**
 *
 * @author Docente
 */
public interface RolDao {
    public int createRol(Rol rol);
    public int updateRol(Rol rol);
    public int deleteRol(int id);
    public Rol readRol(int id);
    public List<Rol> readAllRol();
}
