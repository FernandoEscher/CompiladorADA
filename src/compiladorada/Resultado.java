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
public class Resultado {
    public String valex;
    public Tipo tipo;
    public Simbolo sim1;
    public Simbolo sim2;
    public int left;
    public int right;
    public DefinicionRecord rec;
    public TablaSimbolos tabla;
    public boolean soloIn=true;

    ArrayList<Integer> listatrue;
    ArrayList<Integer> listafalse;
    ArrayList<Integer> siglista;
    ArrayList<Integer> finlista;
    public int siginstr;
}
