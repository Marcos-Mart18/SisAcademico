
package pe.edu.upeu.academico.test;

import com.google.gson.Gson;
import pe.edu.upeu.academico.config.Conexion;
import pe.edu.upeu.academico.dao.EmpleadoDao;
import pe.edu.upeu.academico.dao.RolDao;
import pe.edu.upeu.academico.dao.UsuarioDao;
import pe.edu.upeu.academico.daoImpl.EmpleadoDaoImpl;
import pe.edu.upeu.academico.daoImpl.RolDaoImpl;
import pe.edu.upeu.academico.daoImpl.UsuarioDaoImpl;
import pe.edu.upeu.academico.entity.Rol;

/**
 *
 * @author Docente
 */
public class Test {
static RolDao rdao = new RolDaoImpl();
static UsuarioDao udao = new UsuarioDaoImpl();
static EmpleadoDao edao = new EmpleadoDaoImpl();
static Gson g = new Gson();
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        if(Conexion.getConexion()!=null){
            System.out.println("Conectado");
        }else{
            System.out.println("no conectado");
        }
        //System.out.println(rdao.createRol(new Rol(1,"PRUEBA",1)));
        //System.out.println(rdao.updateRol(new Rol(21,"PRUEBA2",1)));
        //System.out.println(rdao.deleteRol(21));
        //System.out.println(g.toJson(rdao.readRol(21)));
        //System.out.println(g.toJson(rdao.readAllRol()));
        System.out.println(g.toJson(udao.login("andresitow", "1234")));
        //System.out.println(g.toJson(edao.readAllEmpleado()));
    }
    
}
