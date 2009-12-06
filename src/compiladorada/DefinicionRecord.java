/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package compiladorada;

/**
 *
 * @author fernando
 */
public class DefinicionRecord extends Tipo{
    public String nombre;
    public TablaSimbolos tabla;


    public DefinicionRecord(){
        nombre = "";
        tabla = new TablaSimbolos(null);
    }

    public DefinicionRecord(String n){
        nombre = n;
        tabla = new TablaSimbolos(null);
        tabla.nombre = n;
    }

    @Override
    public int mismoTipo(Object t) {
        if (t instanceof Tipo)
            if (t instanceof DefinicionRecord){
                DefinicionRecord tmp = (DefinicionRecord)t;
                if(tmp.nombre.equals(nombre) && tmp.tabla.equals(tabla)){
                    return 0;
                }else
                    return 3;
            }
            else
                return 1;
        else
            return 2;
    }

    public boolean esNumerico(){
        return false;
    }


    @Override
    public int getTipo() {
        return Tipo.REGISTRO;
    }

    public String toString(){

        return "Es un Record!";

    }


    public DefinicionRecord copia(){
        DefinicionRecord ret = new DefinicionRecord();
        ret.error = super.error;
        ret.nombre = nombre;
        ret.tabla = tabla;
        return ret;
    }

}
