/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package compiladorada;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.io.BufferedWriter;

/**
 *
 * @author fernando
 */
public class GeneradorASM {

    public String codigoDeclaracion;
    public String codigoFuncional;
    

    public boolean esMain=true;

    public GeneradorASM(){
        codigoDeclaracion="";
        codigoFuncional="";
    }


    public String construirCodigo() {
        String ret = "\t\t\t.data\n";
        ret += codigoDeclaracion;
        ret += "\n\t\t\t.text\n" + "\t\t\t.globl main\n";
        ret += codigoFuncional;
        ret += "\t\t\tli\t$v0, 10\n"
               + "\t\t\tsyscall";
        return ret;
    }

    public void generarASM(String filename) throws FileNotFoundException, IOException{

        Writer output = new BufferedWriter(new FileWriter(generarNombreArchivo(filename)));
        try {
            output.write( construirCodigo() );
        }
        finally {
            output.close();
        }
    }

    public String generarNombreArchivo(String f){
        String ret = f.substring(0, f.length()-3);
        ret+="asm";
        return ret;
    }
    
}
