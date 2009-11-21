/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package compiladorada;

/**
 *
 * @author fernando
 */
public class Simbolo {


    public String id;
    public Tipo tipo;
    public long direccion;

    public Simbolo(String id, Tipo t){
        this.id = id;
        tipo = t;
    }

}
