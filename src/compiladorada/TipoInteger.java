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

    public TipoInteger(int v){
        valor = v;
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

    @Override
    public int getTipo() {
        return Tipo.INTEGER;
    }
}
