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
public class ControladorRegistros {
    /*** Temporales para variables **/
    ArrayList<String> ident;
    ArrayList<Boolean> sucio;
    ArrayList<Integer> vejez;
    ArrayList<Boolean> asignado;

    /*** Temporales para operaciones ***/
    ArrayList<Boolean> viva;


    public ControladorRegistros(){
        sucio = new ArrayList<Boolean>(4);
        ident = new ArrayList<String>(4);
        asignado = new ArrayList<Boolean>(4);
        vejez = new ArrayList<Integer>(4);
        viva = new ArrayList<Boolean>(8);
        for(int i=0; i<4; i++){
            sucio.add(Boolean.FALSE);
            ident.add("");
            asignado.add(Boolean.FALSE);
            vejez.add(0);
        }

        for(int i=0; i<8; i++){
            viva.add(Boolean.FALSE);
        }
    }

    public String obtenerRegistroVariable(String id, ArrayList<Cuadruplo> c){
        for(int i=0; i<ident.size(); i++){
            vejez.set(i, vejez.get(i)+1);
        }

        //Retornar el registro asignado.
        for(int i=0; i<ident.size(); i++){
            if(id.equals(ident.get(i))){
                viva.set(i, Boolean.TRUE);
                return "$t" + i;
            }
        }

        //Retornar el primer registro no asignado.
        for(int i=0; i<ident.size(); i++){
            if(!asignado.get(i)){
                ident.set(i, id);
                viva.set(i, Boolean.TRUE);
                asignado.set(i, Boolean.TRUE);
                vejez.set(i, 0);
                 c.add(new Cuadruplo("=l", id,"$t"+i ));
                return "$t" + i;
            }
        }

        //Retornar el primer registro no sucio.
        for(int i=0; i<ident.size(); i++){
            if(!sucio.get(i) && !viva.get(i)){
                ident.set(i, id);
                viva.set(i, Boolean.TRUE);
                vejez.set(i, 0);
                c.add(new Cuadruplo("=l", id,"$t"+i ));
                return "$t" + i;
            }
        }

        //Buscar el registro más viejo y que no esté vivo.
        int pos=0;
        for(int i=0; i<ident.size(); i++){
            if(!viva.get(i) && (vejez.get(i).intValue() > vejez.get(i).intValue())){
                pos = i;
            }
        }

        viva.set(pos, Boolean.TRUE);
        vejez.set(pos, 0);
        c.add(new Cuadruplo("=s", "$t"+pos, ident.get(pos)));
        c.add(new Cuadruplo("=l", "$t"+pos, id ));
        return "$t"+pos;
    }

    public String obtenerRegistroOperacion(){


        for(int i=4; i<viva.size(); i++){
            if(!viva.get(i)){
                viva.set(i, Boolean.TRUE);
                return "$t" + i;
            }
        }

        return "$t4";
    }

    public void enterrarRegistro(String reg){
        for(int i=0; i<viva.size();i++){
            if(reg.equals("$t"+i)){
                viva.set(i, Boolean.FALSE);
            }
        }
    }

    public void ensuciarRegistro(String reg){
        for(int i=0; i<sucio.size();i++){
            if(reg.equals("$t"+i)){
                sucio.set(i, Boolean.TRUE);
            }
        }
    }

    
}
