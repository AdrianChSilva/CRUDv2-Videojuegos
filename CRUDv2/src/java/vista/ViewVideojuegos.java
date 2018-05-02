/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vista;

import DTODAO.DTOVideojuegos;
/**
 *
 * @author adrian.chamorrosilva
 */
import java.util.List;

public class ViewVideojuegos {

    public void verVideojuegos(List<DTOVideojuegos> juegos) {
        for (DTOVideojuegos videojuego : juegos) {
            System.out.println(videojuego);
        }
    }

    public void verVideojuego(DTOVideojuegos juego) {
        System.out.println("Datos del videojuego " + juego);
    }
}
