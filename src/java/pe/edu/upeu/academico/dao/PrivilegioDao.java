
package pe.edu.upeu.academico.dao;

import java.util.List;
import pe.edu.upeu.academico.entity.Privilegios;

/**
 *
 * @author Docente
 */
public interface PrivilegioDao {
    public int createPrivilegio(Privilegios pri);
    public int updatePrivilegio(Privilegios pri);
    public int deletePrivilegio(int id);
    public Privilegios readPrivilegio(int id);
    public List<Privilegios> readAllPrivilegio();
    public boolean buscarPrivilegio(String nombre);
}
