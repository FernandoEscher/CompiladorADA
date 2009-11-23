/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package compiladorada;

/**
 *
 * @author fernando
 */
public class TipoBoolean extends Tipo{

    public boolean valor;


    public TipoBoolean(){}

    public TipoBoolean(Object v){
        valor = ((Boolean)v).booleanValue();
    }

    @Override
    public int mismoTipo(Object t) {
        if (t instanceof Tipo)
            if (t instanceof TipoBoolean)
                return 0;
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
        return Tipo.BOOLEAN;
    }

    public String toString(){

        return "Es un Boolean!";

    }


    public TipoBoolean copia(){
        TipoBoolean ret = new TipoBoolean(valor);
        ret.error = super.error;
        return ret;
    }
}
