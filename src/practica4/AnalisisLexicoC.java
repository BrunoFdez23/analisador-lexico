/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package practica4;

//import java.io.*;
//import java.until.logging.Level;
//import java.until.logging.Logger;
//import practica2.*;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java_cup.runtime.*;

/* Barrera Alaniz Jose Angel */
/* Fernández Flores Bruno Eduardo */
/* Sanchez Mora Jose Alfredo */

public class AnalisisLexicoC {
	/**
 	* @param args the command line arguments
 	*/
	public static void main(String[] args) {
    	// TODO code application logic here
    	String test = "src/practica4/tokens.txt";
  	 
    	try (Reader reader = new FileReader(test)){
            //crear la instancia del lexer directamente
            LexerC lexer = new LexerC(reader);
            //Leer tokens y procesarlos
            Symbol token;
            while ((token = lexer.next_token()) != null){
                if(token.sym == sym.EOF){
                    System.out.println("Token: "+token);
                    System.out.println("");
                    System.out.println("Fin del archivo.");
                    break;
                }
            	System.out.println("Token: "+token);
            	System.out.println("");
            }
    	} catch (Exception e){
        	System.err.println("Error al leer el archivo de prueba.");
        	e.printStackTrace();
    	}
	}
}
