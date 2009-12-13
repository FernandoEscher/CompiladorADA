/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package compiladorada;

/**
 *
 * @author fernando
 */
public class Simbolo {


    public String id;
    public Tipo tipo;
    public int direccion;
    public boolean constante;

    public Simbolo(String id, Tipo t){
        this.id = id;
        tipo = t;
        constante=false;
   }

   public Simbolo(String id, Tipo t, int dir){
       this.id = id;
        tipo = t;
        direccion = dir;
   }

   public String toString(){
        return "Tipo: " + tipo + ", Direccion: " + direccion;
   }

}
