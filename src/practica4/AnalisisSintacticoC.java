/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package practica4;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.Reader;
import java_cup.runtime.*;

/* Barrera Alaniz Jose Angel */
 /* Fernández Flores Bruno Eduardo */
 /* Sanchez Mora Jose Alfredo */
public class AnalisisSintacticoC {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        try {
            Reader lector = new BufferedReader(new FileReader("src/practica4/ejemplo_sintactico.txt"));
            ParserC s = new ParserC(new LexerC(lector));

            // String contenido= "byte numero1;";
            // JavaSintactico s = new JavaSintactico(new JavaLexico(new StringReader(contenido)));
            System.out.println(s.parse());
            System.out.println("Analisis realizado correctamente");
        } catch (Exception ex) {
            //Symbol sym = s.getS();
            //System.out.println("Error de sintaxis. Linea: " + (sym.right + 1) +
            //" Columna: " + (sym.left + 1) + ", Texto: \"" + sym.value + "\"");
            System.out.println(ex.getMessage());
        }
    }

}
