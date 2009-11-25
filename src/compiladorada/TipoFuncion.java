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
public class TipoFuncion extends Tipo{
    public Tipo retorno;
    public ArrayList<Simbolo> parametros;

    public TipoFuncion(){
        retorno = null;
        parametros = new ArrayList<Simbolo>();
    }

    public TipoFuncion(Object r){
        retorno = (Tipo)r;
        parametros = new ArrayList<Simbolo>();
    }
    public TipoFuncion(Object r, ArrayList<Simbolo> p){
        retorno = (Tipo)r;
        parametros = p;
    }

    @Override
    public int mismoTipo(Object t) {
        if (t instanceof Tipo)
            if (t instanceof TipoFuncion)
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
        return Tipo.FUNCION;
    }

    public String toString(){

        return "Es una Función!";

    }


    public TipoFuncion copia(){
        ArrayList<Simbolo> p = (ArrayList<Simbolo>)parametros.clone();
        TipoFuncion ret = new TipoFuncion(retorno.copia(), p);
        ret.error = super.error;
        return ret;
    }

}
