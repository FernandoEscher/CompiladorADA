/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package compiladorada;

/**
 *
 * @author fernando
 */
public class TipoRecord extends Tipo{

    public String nombreRecord;
    public DefinicionRecord definicion;


    public TipoRecord(){
        nombreRecord = "";
        definicion = null;
    }

    public TipoRecord(String n, DefinicionRecord d){
        nombreRecord = n;
        definicion = d;
    }

    @Override
    public int mismoTipo(Object t) {
        if (t instanceof Tipo)
            if (t instanceof TipoRecord){
                TipoRecord tmp = (TipoRecord)t;
                if(tmp.nombreRecord.equals(nombreRecord)){
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
        return Tipo.REGISTRO_INST;
    }

    public String toString(){

        return "Es un Record!";

    }


    public TipoRecord copia(){
        TipoRecord ret = new TipoRecord();
        ret.error = super.error;
        ret.nombreRecord = nombreRecord;
        ret.definicion = definicion.copia();
        return ret;
    }

}
