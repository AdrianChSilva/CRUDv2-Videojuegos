/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;
import DTODAO.DTOVideojuegos;
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
/**
 *
 * @author adrian.chamorrosilva
 */
public class Controlador {
    private ViewVideojuegos vista = new ViewVideojuegos();
    
    public Controlador(){
        
    }
    	//llama al DAO para obtener todos los clientes y luego los muestra en la vista
	public  void verVideojuegos(){
		List<DTOVideojuegos> videojuegos = new ArrayList<DTOVideojuegos>();
		IDAOVideojuegos dao= new  DAOVideojuegos();
		videojuegos= dao.verTabla();
		vista.verVideojuegos(videojuegos);
	}
}
