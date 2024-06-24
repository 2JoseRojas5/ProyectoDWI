package Modelo;

public class DTOEmpleado {
    //Atributos
    String idEmpleado;
    String idCargo;
    String Nombre;
    String Apellido;
    String FechaIngreso;
    String Email;
    String Telefono;
    String Sexo;
    float Sueldo;
    String username;
    String password;
    
    //Constructores
    public DTOEmpleado() {}

    public DTOEmpleado(String idEmpleado, String idCargo, String Nombre, String Apellido, 
            String FechaIngreso, String Email, String Telefono, String Sexo, float Sueldo, 
            String username, String password) {
        this.idEmpleado = idEmpleado;
        this.idCargo = idCargo;
        this.Nombre = Nombre;
        this.Apellido = Apellido;
        this.FechaIngreso = FechaIngreso;
        this.Email = Email;
        this.Telefono = Telefono;
        this.Sexo = Sexo;
        this.Sueldo = Sueldo;
        this.username = username;
        this.password = password;
    }
    
    //Métodos Getter and Setter

    public String getIdEmpleado()                    {return idEmpleado;}
    public void setIdEmpleado(String idEmpleado)     {this.idEmpleado = idEmpleado;}

    public String getIdCargo()                       {return idCargo;}
    public void setIdCargo(String idCargo)           {this.idCargo = idCargo;}

    public String getNombre()                        {return Nombre;}
    public void setNombre(String Nombre)             {this.Nombre = Nombre;}

    public String getApellido()                      {return Apellido;}
    public void setApellido(String Apellido)         {this.Apellido = Apellido;}

    public String getFechaIngreso()                  {return FechaIngreso;}
    public void setFechaIngreso(String FechaIngreso) {this.FechaIngreso = FechaIngreso;}

    public String getEmail()                         {return Email;}
    public void setEmail(String Email)               {this.Email = Email;}

    public String getTelefono()                      {return Telefono;}
    public void setTelefono(String Telefono)         {this.Telefono = Telefono;}

    public String getSexo()                          {return Sexo;}
    public void setSexo(String Sexo)                 {this.Sexo = Sexo;}

    public float getSueldo()                         {return Sueldo;}
    public void setSueldo(float Sueldo)              {this.Sueldo = Sueldo;}

    public String getUsername()                      {return username;}
    public void setUsername(String username)         {this.username = username;}

    public String getPassword()                      {return password;}
    public void setPassword(String password)         {this.password = password;
    }
}
