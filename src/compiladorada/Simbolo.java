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
    public static int INT = 0;
    public static int FLOAT = 1;
    public static int BOOLEAN = 2;
    public static int RECORD = 3;

    public String id;
    public int ambito;
    public Tipo tipo;
    public long direccion;

}
