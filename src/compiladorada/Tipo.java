/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package compiladorada;

/**
 *
 * @author fernando
 */
public abstract class Tipo {
    public static int INTEGER = 0;
    public static int FLOAT = 1;
    public static int BOOLEAN = 2;
    public static int FUNCION = 3;
    public static int REGISTRO = 4;

    
    public abstract int mismoTipo(Object t);

    public abstract int getTipo();

}
