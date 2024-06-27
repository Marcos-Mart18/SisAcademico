package pe.edu.upeu.academico.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author Docente
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Privilegios {
    private int idprivilegio;
    private String nombre;
    private String descripcion;
    private int estado;
}
