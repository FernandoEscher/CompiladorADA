/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package compiladorada;

/**
 *
 * @author fernando
 */
public class TipoInteger extends Tipo{
    
    public int valor;


    public TipoInteger(){}

    public TipoInteger(Object v){
        valor = ((Integer)v).intValue();
    }

    public TipoInteger(int anch){
         super.anchura = anch;
    }


    @Override
    public int mismoTipo(Object t){
        if (t instanceof Tipo)
            if (t instanceof TipoInteger)
                return 0;
            else
                return 1;
        else
            return 2;


        
    }

    public boolean esNumerico(){
        return true;
    }

    @Override
    public int getTipo() {
        return Tipo.INTEGER;
    }

    public String toString(){

        return "Integer";

    }

    public TipoInteger copia(){
        TipoInteger ret = new TipoInteger(valor);
        ret.error = super.error;
        return ret;
    }
}
