package Interfaces;

import Modelo.DTOEmpleado;
import java.util.List;

public interface CRUDEmpleado {
    public List listar();
    public DTOEmpleado list(String idEmpleado);
    public boolean add(DTOEmpleado emp);
    public boolean edit(DTOEmpleado emp);
    public boolean eliminar(String idEmpleado);
}
