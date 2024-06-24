package Datos;

import static Datos.Parametros.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.*;

public class Conexion implements Parametros{
    private Connection con = null;
    public PreparedStatement ps = null;
    public Statement smt = null;
    public ResultSet rs = null;

    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Asegúrate de usar el driver adecuado para tu base de datos
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return DriverManager.getConnection(URL, USERNAME, PASSWORD);
    }
}