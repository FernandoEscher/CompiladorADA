/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package compiladorada;

import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;

/**
 *
 * @author fernando
 */
public class GeneradorIntermedio {
    public ControladorRegistros contReg;
     ArrayList<Cuadruplo> declaraciones = new ArrayList<Cuadruplo>();
    ArrayList<Cuadruplo> codigo = new ArrayList<Cuadruplo>();
    ArrayList<Integer> etiquetas = new ArrayList<Integer>();

    public int contEtiq = 0;

    public GeneradorIntermedio(){
        contReg = new ControladorRegistros();
        declaraciones = new ArrayList<Cuadruplo>();
        codigo = new ArrayList<Cuadruplo>();
    }

     public void escribirFlujo() throws FileNotFoundException, IOException{
        Writer output = new BufferedWriter(new FileWriter("/home/fernando/Escritorio/cuadruplos.txt"));
        try {
            output.write("###Declaraciones###\n\n");
            for(Cuadruplo c : declaraciones)
                output.write( c.toString() + "\n" );
            output.write("###Codigo###\n\n");
            output.write("Etq\tOper\tArg1\tArg2\tRes\n");
            output.write("------------------------------\n");
            int i=0;
            for(Cuadruplo c : codigo){
                if(etiquetas.contains(new Integer(i)))
                    output.write("L"+ i + "\t" + c.toString() + "\n" );
                else
                    output.write("\t" + c.toString() + "\n" );
                i++;
            }
        }
        finally {
            output.close();
        }
     }

     public String obtenerRegistroVariable(String id){
        return contReg.obtenerRegistroVariable(id,codigo);

     }

     public String obtenerRegistroOperacion(){
        return contReg.obtenerRegistroOperacion();

     }

    public String generarOperacion(String op, String arg1, String arg2){
        String reg = contReg.obtenerRegistroOperacion();
        codigo.add(new Cuadruplo((String)op, (String)arg1,(String)arg2, reg));
        contReg.enterrarRegistro(arg1);
        contReg.enterrarRegistro(arg2);
        return reg;

    }

    public String generarMovimientoPila(String val, boolean push){
        if(push)
            codigo.add(new Cuadruplo("push", val));
        else
            codigo.add(new Cuadruplo("pop", val));
        return val;
    }

    public String generarAsignacion(String arg1, String arg2){
        codigo.add(new Cuadruplo("=", (String)arg2,(String)arg1));
        contReg.enterrarRegistro(arg1);
        contReg.enterrarRegistro(arg2);
        return arg1;

    }

    public void generarGoto(String lb){
        codigo.add(new Cuadruplo("goto"));
        codigo.get(codigo.size()-1).res = lb;
    }

    public void generarIf(String op, String arg1, String arg2, String lb){
        codigo.add(new Cuadruplo("if"+(String)op, (String)arg1,(String)arg2, lb));
        contReg.enterrarRegistro(arg1);
        contReg.enterrarRegistro(arg2);
    }

    public void backpatch(ArrayList<Integer> lista, int instr){
        if(lista != null){
            for(int i=0; i<lista.size();i++){
                codigo.get(lista.get(i).intValue()).res = "L"+instr;
            }
            etiquetas.add(new Integer(instr));
        }
    }

    public ArrayList<Integer> crearLista(int i){
        ArrayList<Integer> lista = new ArrayList<Integer>();
        lista.add(new Integer(i)) ;
        return lista;
    }

    public ArrayList<Integer> combinar(ArrayList<Integer> lista1, ArrayList<Integer> lista2){
        ArrayList<Integer> lista = new ArrayList<Integer>();
        //Nada fancy, pero no funcionaba el método addAll
        if(lista1 !=null)
            for(Integer i: lista1)
                lista.add(i);

        if(lista2 !=null)
            for(Integer i: lista2)
                lista.add(i);
            
        return lista;
    }

    public int siginstr(){
        return codigo.size();
    }

}
