/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package compiladorada;

import java.util.ArrayList;

/**
 *
 * @author fernando
 */
public class ControladorTemporales {
    ArrayList<Boolean> sucio;
    ArrayList<Boolean> usado;
    ArrayList<Boolean> asignado;


    public ControladorTemporales(){
        sucio = new ArrayList<Boolean>(8);
        usado = new ArrayList<Boolean>(8);
        asignado = new ArrayList<Boolean>(8);
    }

    
}
