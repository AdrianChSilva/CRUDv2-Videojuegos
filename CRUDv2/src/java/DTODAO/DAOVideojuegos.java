package DTODAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import IDAO.IDAOVideojuegos;
import java.util.List;
import conexionMYSQL.Conexion;
import java.sql.Statement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import DTODAO.DTOVideojuegos;

/**
 *
 * @author adrian.chamorrosilva
 *
 */
public class DAOVideojuegos implements IDAOVideojuegos {
//       private static Connection cnx = null;
//
//    public static Connection obtener() throws SQLException, ClassNotFoundException {
//        
//        if (cnx == null) {
//            try {
//                Class.forName("com.mysql.jdbc.Driver");
//                cnx = DriverManager.getConnection("jdbc:mysql://localhost:3306/tiendavideojuegos", "root", "");
//            } catch (SQLException ex) {
//                throw new SQLException(ex);
//            } catch (ClassNotFoundException ex) {
//                throw new ClassCastException(ex.getMessage());
//            }
//        }
//        return cnx;
//    }

    @Override
    public List<DTOVideojuegos> verTabla() {
        Connection co = null;
        Statement stm = null;
        ResultSet rs = null;
        String sql = "Select * from videojuegos";
        List<DTOVideojuegos> lista = new ArrayList<DTOVideojuegos>();

        try {
            co = Conexion.conectar();
            stm = co.createStatement();
            rs = stm.executeQuery(sql);
            while (rs.next()) {
                DTOVideojuegos videojuego = new DTOVideojuegos();
                videojuego.setCodVideojuegos(rs.getInt(1));
                videojuego.setTitulo(rs.getString(2));
                videojuego.setPlataforma(rs.getString(3));
                videojuego.setDesarrolladora(rs.getString(4));
                videojuego.setPublisher(rs.getString(5));
                videojuego.setPrecio(rs.getFloat(6));
                videojuego.setStock(rs.getInt(7));
            }
            stm.close();
            rs.close();
            co.close();

        } catch (SQLException e) {
            System.out.println("Error: Clase ClienteDaoImple, método obtener");
            e.printStackTrace();
        }
        return lista;
    }
}
