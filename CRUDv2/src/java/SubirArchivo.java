/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CRUDv2.web.videojuegos;

import DTODAO.DTOVideojuegos;

/**
 * @author adrian.chamorrosilva
 */
import java.util.Scanner;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import java.io.File;
import vista.ViewVideojuegos;
import conexionMYSQL.Conexion;
import IDAO.IDAOVideojuegos;
import DTODAO.DAOVideojuegos;
import controller.Controlador;

public class SubirArchivo {

//    private static Connection cnx = null;
//
//    public static Connection obtener() throws SQLException, ClassNotFoundException {
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
//    public static void cerrar() throws SQLException {
//        if (cnx != null) {
//            cnx.close();
//        }
//    }
    public static void main(String[] args) throws Exception {
//        Scanner s = new Scanner(System.in);
        try {
            BufferedReader bf = new BufferedReader(new FileReader(
                    "C:\\Users\\adrian.chamorrosilva\\Documents\\DUAL\\lecturaficheros.txt"));
    //        String linea = "";
            List<String> lineas = readLines(new File("C:\\Users\\adrian.chamorrosilva\\Documents\\DUAL\\lecturaficheros.txt"));
            List<DTOVideojuegos> videojuegos = new ArrayList<>();
            for (String linea : lineas) {
                String[] word = linea.split(",");
                DTOVideojuegos videojuego = new DTOVideojuegos();
                videojuego.setTitulo(word[0]);
                videojuego.setPlataforma(word[1]);
                videojuego.setDesarrolladora(word[2]);
                videojuego.setPublisher(word[3]);
                videojuego.setPrecio(Float.parseFloat(word[4]));
                videojuego.setStock(Integer.parseInt(word[5]));
                videojuegos.add(videojuego); // Con el método .add Lo que hacemos es añadir cada atributo del
               // objeto a la lista
           }
//
            //Hacemos print de cada elemento de nuestra lista(que sigue siendo desde fichero)////////////////////
            System.out.println("Lectura de videojuegos desde fichero");
            for (DTOVideojuegos videojuego : videojuegos) {
                System.out.println(videojuego);
            }
//            while (lineas != null) {
//                System.out.println(lineas);
//                
//            }
//            //   bf.close();
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
        // controlador
    Controlador controller = new Controlador();

    controller.verVideojuegos ();
    }



    /**
     *
     * @param file
     * @return
     * @throws Exception
     */
    public static List<String> readLines(File file) throws Exception {
        if (!file.exists()) {
            return new ArrayList<String>();
        }
        BufferedReader reader = new BufferedReader(new FileReader(file));
        List<String> results = new ArrayList<String>();
        String line = reader.readLine();
        while (line != null) {
            results.add(line);
            line = reader.readLine();
        }
        return results;
    }
}
