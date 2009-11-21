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

    public TipoBoolean(boolean v){
        valor = v;
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


    @Override
    public int getTipo() {
        return Tipo.BOOLEAN;
    }
}
