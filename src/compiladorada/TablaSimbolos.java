package compiladorada;
import java.util.Hashtable;

/**
 *
 * @author fernando
 */
public class TablaSimbolos {
    public Hashtable tabla;
    public TablaSimbolos padre;
    public String nombre;

    public TablaSimbolos(TablaSimbolos p){
        tabla = new Hashtable();
        padre = p;
    }

    public boolean put(String s, Simbolo sim){
        s = s.toLowerCase();
        if (get(s) != null){
            return false;
        }else{
            tabla.put(s, sim);
            return true;
        }
    }

    public Simbolo get(String s){
        s = s.toLowerCase();
        for(TablaSimbolos t = this; t != null; t=t.padre){
            Simbolo encontrado = (Simbolo)(t.tabla.get(s));
            if(encontrado != null){
                return encontrado;
            }
        }
        return null;
    }

    public String toString(){
        return nombre + ": " + tabla.toString();
    }

}
