/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package compiladorada;

/**
 *
 * @author fernando
 */
public class TipoFloat extends Tipo{

    public float valor;


    public TipoFloat(){}
    public TipoFloat(int anch){
        super.anchura = anch;
    }

    public TipoFloat(Object v){
        valor = ((Float)v).floatValue();
    }


    @Override
    public int mismoTipo(Object t){
        if (t instanceof Tipo)
            if (t instanceof TipoFloat)
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
        return Tipo.FLOAT;
    }

    public String toString(){

        return "Float";

    }

    public TipoFloat copia(){
        TipoFloat ret = new TipoFloat(valor);
        ret.error = super.error;
        return ret;
    }
}
