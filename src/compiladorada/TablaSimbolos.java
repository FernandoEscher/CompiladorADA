package compiladorada;
import java.util.Hashtable;

/**
 *
 * @author fernando
 */
public class TablaSimbolos {
    private Hashtable tabla;
    private TablaSimbolos padre;

    public TablaSimbolos(TablaSimbolos p){
        tabla = new Hashtable();
        padre = p;
    }

    public boolean put(String s, Simbolo sim){
        if (tabla.get(sim) != null){
            return false;
        }else{
            tabla.put(s, sim);
            return true;
        }
    }

    public Simbolo get(String s){
        for(TablaSimbolos t = this; t != null; t=t.padre){
            Simbolo encontrado = (Simbolo)(t.tabla.get(s));
            if(encontrado != null)
                return encontrado;
        }
        return null;
    }

}
