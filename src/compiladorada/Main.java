/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package compiladorada;

import java.io.FileReader;

/**
 *
 * @author fernando
 */
public class Main {
    public static void main(String []args){
        try {


        parser p = new parser(new Lexer(new FileReader("/home/fernando/Proyectos/CompiladorADA/Programas/ProgramaBueno2.adb")));
        p.parse();

      } catch (Exception e) {
        /* do cleanup here -- possibly rethrow e */
          System.err.println(e.getMessage());
        for(StackTraceElement s: e.getStackTrace())
                System.err.println("Hubo un erro");
    }
    }

}
