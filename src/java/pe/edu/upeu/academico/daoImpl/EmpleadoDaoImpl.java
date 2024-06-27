
package pe.edu.upeu.academico.daoImpl;

import java.util.List;
import pe.edu.upeu.academico.dao.EmpleadoDao;
import pe.edu.upeu.academico.entity.Empleado;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import pe.edu.upeu.academico.config.Conexion;
/**
 *
 * @author Docente
 */
public class EmpleadoDaoImpl implements EmpleadoDao {
private PreparedStatement ps;
private ResultSet rs;
private Connection cx= null;
    @Override
    public int createEmpleado(Empleado emp) {
        String SQL= "INSERT INTO empleado (NOMBRES,APELLIDOS.CORREO.TELEFONO,SEXO) VALUES(?,?,?,?,?,1)";
        int x = 0;
        try {
            cx = Conexion.getConexion();
            ps = cx.prepareStatement(SQL);
            ps.setString(1, emp.getNombres());
            ps.setString(2, emp.getApellidos());
            ps.setString(3, emp.getCorreo());
            ps.setString(4, emp.getTelefono());
            x = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: "+e);
        }
        
        return x;
    }

    @Override
    public int updateEmpleado(Empleado emp) {
        String SQL= "UPDATE rol SET nombres=?, apellidos=?,correo=?,telefono=?,sexo=?,estado=? WHERE idempleado=?";
        int x = 0;
        try {
            cx = Conexion.getConexion();
            ps = cx.prepareStatement(SQL);
            ps.setString(1, emp.getNombres());
            ps.setString(2, emp.getApellidos());
            ps.setString(3, emp.getCorreo());
            ps.setString(4, emp.getTelefono());
            ps.setInt(3, emp.getIdempleado());
            x = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: "+e);
        }
        
        return x;
    }

    @Override
    public int deleteEmpleado(int id) {
        String SQL= "DELETE FROM WHERE idempleado=?";
        String SQL1= "UPDATE empleado SET estado=0 WHERE idempleado=?";
        int x = 0;
        try {
            cx = Conexion.getConexion();
            ps = cx.prepareStatement(SQL1);
            ps.setInt(1, id);
            x = ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error: "+e);
        }
        
        return x;
    }

    @Override
    public Empleado readEmpleado(int id) {
        Empleado empleado= new Empleado();
        String SQL= "SELECT *FROM empleado WHERE idempelado=?";
        try {
            cx = Conexion.getConexion();
            ps = cx.prepareStatement(SQL);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while(rs.next()){
                empleado.setNombres(rs.getString("nombres"));
                empleado.setCorreo(rs.getString("correo"));
            }
        } catch (SQLException e) {
            System.out.println("Error: "+e);
        }
        
        return empleado;
    }

    @Override
    public List<Empleado> readAllEmpleado() {
        List<Empleado> lista= new ArrayList<>();
        String SQL= "SELECT *FROM empleado";
        try {
            cx = Conexion.getConexion();
            ps = cx.prepareStatement(SQL);
            rs = ps.executeQuery();
            while(rs.next()){
                Empleado empleado =new Empleado();
                empleado.setNombres(rs.getString("nombres"));
                empleado.setApellidos(rs.getString("apellidos"));
                empleado.setCorreo(rs.getString("correo"));
                empleado.setTelefono(rs.getString("telefono"));
                lista.add(empleado);
            }
        } catch (SQLException e) {
            System.out.println("Error: "+e);
        }
        
        return lista;
    }

    @Override
    public boolean buscarEmpleado(String nombre) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
