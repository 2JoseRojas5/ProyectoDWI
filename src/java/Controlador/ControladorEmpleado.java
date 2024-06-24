package Controlador;

import Modelo.DTOEmpleado;
import ModeloDAO.EmpleadoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ControladorEmpleado")
public class ControladorEmpleado extends HttpServlet {

    String listar="Vistas/Empleados/ListarEmpleado.jsp";
    String add="Vistas/Empleados/AddEmpleado.jsp";
    String edit="Vistas/Empleados/EditEmpleado.jsp";
    DTOEmpleado e=new DTOEmpleado();
    EmpleadoDAO dao=new EmpleadoDAO();
    String idEmpleado;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ControladorEmpleado</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ControladorEmpleado at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso="";
        String action=request.getParameter("accion");
        if(action.equalsIgnoreCase("listar")){
            acceso=listar;
        }else if(action.equalsIgnoreCase("add")){
            acceso=add;
        }else if(action.equalsIgnoreCase("Agregar")){
            String idEmpleado=request.getParameter("txtIdEmpleado");
            String idCargo=request.getParameter("txtIdCargo");
            String Nombre=request.getParameter("txtNombre");
            String Apellido=request.getParameter("txtApellido");
            String FechaIngreso=request.getParameter("txtFechaIngreso");
            String Email=request.getParameter("txtEmail");
            String Telefono=request.getParameter("txtTelefono");
            String Sexo=request.getParameter("txtSexo");
            String Sueldo=request.getParameter("txtSueldo");
            String username=request.getParameter("txtUsername");
            String password=request.getParameter("txtPassword");
            dao.add(e);
            acceso=listar;
        }else if(action.equalsIgnoreCase("editar")){
            request.setAttribute("idEmp", request.getParameter("idEmpleado"));
            acceso=edit;
        }else if(action.equalsIgnoreCase("Actualizar")){
            idEmpleado=request.getParameter("txtidEmpleado");
            String idCargo=request.getParameter("txtIdCargo");
            String Nombre=request.getParameter("txtNombre");
            String Apellido=request.getParameter("txtApellido");
            String FechaIngreso=request.getParameter("txtFechaIngreso");
            String Email=request.getParameter("txtEmail");
            String Telefono=request.getParameter("txtTelefono");
            String Sexo=request.getParameter("txtSexo");
            String Sueldo=request.getParameter("txtSueldo");
            String username=request.getParameter("txtUsername");
            String password=request.getParameter("txtPassword");
            e.setIdEmpleado(idEmpleado);
            e.setIdCargo(idCargo);
            e.setNombre(Nombre);
            e.setApellido(Apellido);
            e.setFechaIngreso(FechaIngreso);
            e.setEmail(Email);
            e.setTelefono(Telefono);
            e.setSexo(Sexo);
            e.setSueldo(0);
            e.setUsername(username);
            e.setPassword(password);
            dao.edit(e);
            acceso=listar;
        }else if(action.equalsIgnoreCase("eliminar")){
            idEmpleado=request.getParameter("txtidEmpleado");
            e.setIdEmpleado(idEmpleado);
            dao.eliminar(idEmpleado);
            acceso=listar;
        }
        RequestDispatcher Vista=request.getRequestDispatcher(acceso);
        Vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
