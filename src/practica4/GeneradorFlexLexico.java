/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package practica4;

//import practica2.*;
import jflex.Main;

/* Barrera Alaniz Jose Angel */
/* Fernández Flores Bruno Eduardo */
/* Sanchez Mora Jose Alfredo */

public class GeneradorFlexLexico {

    
	/**
 	* @param args the command line arguments
 	*/
	public static void main(String[] args) {
    	// TODO code application logic here
    	String rutaFlex = "src/practica4/lexico.jflex";
   	 
    	String[] jflexArgs = { rutaFlex };
    	try {
        	//Llama al método de JFlex.Main para generar el lexer
        	Main.generate(jflexArgs);
        	System.out.println("Lexer generado con éxito ");
    	} catch (Exception e) {
        	System.err.println("Error al generar el lexico. ");
        	e.printStackTrace();
        	System.exit(1);
    	}
	}

    
}
