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

    public static int IN = 5;
    public static int OUT = 6;
    public static int IN_OUT= 7;

    public boolean error = false;
    public int modo = IN_OUT;

    
    public abstract int mismoTipo(Object t);

    public abstract int getTipo();

    public abstract boolean esNumerico();

    public abstract Tipo copia();

    public String toString(){

        return "Es un tipo!";
    }

}
