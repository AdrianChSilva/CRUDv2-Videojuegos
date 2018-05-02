/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexionMYSQL;

/**
 *
 * @author adrian.chamorrosilva
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    public static Connection conectar() {
        Connection con = null;

        String password = "";
        String usuario = "root";
        //String url = "jdbc:mysql://localhost:3306/tiendavideojuegos","root","";
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendavideojuegos", "root", "");
            if (con != null) {
                System.out.println("Conectado");
            }
        } catch (SQLException e) {
            System.out.println("No se pudo conectar a la base de datos");
            e.printStackTrace();
        }
        return con;
    }
}
