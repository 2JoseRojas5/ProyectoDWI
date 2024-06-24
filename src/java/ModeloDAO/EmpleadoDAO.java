package ModeloDAO;

import Datos.Conexion;
import Interfaces.CRUDEmpleado;
import Modelo.DTOEmpleado;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO implements CRUDEmpleado{
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    DTOEmpleado e=new DTOEmpleado();

    @Override
    public List listar() {
        ArrayList<DTOEmpleado>list=new ArrayList<>();
        String sql="select * from empleado";
        try{
            con=Conexion.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                DTOEmpleado emp=new DTOEmpleado();
                emp.setIdEmpleado(rs.getString("idEmpleado"));
                emp.setIdCargo(rs.getString("idCargo"));
                emp.setNombre(rs.getString("Nombre"));
                emp.setApellido(rs.getString("Apellido"));
                emp.setFechaIngreso(rs.getString("FechaIngreso"));
                emp.setEmail(rs.getString("Email"));
                emp.setTelefono(rs.getString("Telefono"));
                emp.setSexo(rs.getString("Sexo"));
                emp.setSueldo(rs.getFloat("Sueldo"));
                emp.setUsername(rs.getString("username"));
                emp.setPassword(rs.getString("password"));
            }
        }catch(SQLException ex){
            
        }
        return list;
    }

    @Override
    public DTOEmpleado list(String idEmpleado) {
        String sql="select * from empleado where idEmpleado="+idEmpleado;
        try{
            con=Conexion.getConnection();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                e.setIdEmpleado(rs.getString("idEmpleado"));
                e.setIdCargo(rs.getString("idCargo"));
                e.setNombre(rs.getString("Nombre"));
                e.setApellido(rs.getString("Apellido"));
                e.setFechaIngreso(rs.getString("FechaIngreso"));
                e.setEmail(rs.getString("Email"));
                e.setTelefono(rs.getString("Telefono"));
                e.setSexo(rs.getString("Sexo"));
                e.setSueldo(rs.getFloat("Sueldo"));
                e.setUsername(rs.getString("username"));
                e.setPassword(rs.getString("password"));
            }
        }catch(SQLException ex){
        }
        return e;
    }

    @Override
    public boolean add(DTOEmpleado emp) {
        String sql="insert into empleado (idEmpleado, idCargo, Nombre, Apellido, FechaIngreso, Email, Telefono, Sexo, Sueldo, "
                + "username, password)values('"+emp.getIdEmpleado()+"','"+emp.getIdCargo()+"','"+emp.getNombre()+"',"
                + "'"+emp.getApellido()+"','"+emp.getFechaIngreso()+"','"+emp.getEmail()+"','"+emp.getTelefono()+"',"
                + "'"+emp.getSexo()+"','"+emp.getSueldo()+"','"+emp.getUsername()+"','"+emp.getPassword()+"')";
        try{
            con=Conexion.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(SQLException ex){
        }
        return false;
    }

    @Override
    public boolean edit(DTOEmpleado emp) {
        String sql="update empleado set idEmpleado='"+emp.getIdEmpleado()+"',idCargo='"+emp.getIdCargo()+"',Nombre='"+emp.getNombre()+"'"
                + ",Apellido='"+emp.getApellido()+"',FechaIngreso='"+emp.getFechaIngreso()+"',Email='"+emp.getEmail()+"'"
                + ",Telefono='"+emp.getTelefono()+"',Sexo='"+emp.getSexo()+"',Sueldo='"+emp.getSueldo()+"',username='"+emp.getUsername()+"'"
                + ",password='"+emp.getPassword()+"' ";
        try{
            con=Conexion.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(SQLException ex){
        }
        return false;
    }

    @Override
    public boolean eliminar(String idEmpleado) {
        String sql="delete from empleado where idEmpleado="+idEmpleado;
        try{
            con=Conexion.getConnection();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(SQLException ex){
        }
        return false;
    }
    
    
}
