/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package compiladorada;

/**
 *
 * @author fernando
 */
public class Cuadruplo {
    public String op;
    public String arg1;
    public String arg2;
    public String res;

 public Cuadruplo(String op, String arg1, String arg2, String res){
    this.op = op;
    this.arg1 = arg1;
    this.arg2 = arg2;
    this.res = res;
 }

 public Cuadruplo(String op, String arg1, String res){
    this.op = op;
    this.arg1 = arg1;
    this.res = res;
 }

 public Cuadruplo(String op, String arg1){
    this.op = op;
    this.arg1 = arg1;
 }

 public Cuadruplo(String op){
    this.op = op;
 }

 public String toString(){
     if(arg1 == null && arg2 == null)
         return op + "\t\t\t" + res + "\t";
     if(arg2 == null && res == null)
         return op + "\t" + arg1 + "\t";
     else if(arg2 == null){
        return op + "\t" + arg1 + "\t\t" + res;
     }else{
        return op + "\t" + arg1 + "\t" + arg2 + "\t" + res;
     }
 }

}
