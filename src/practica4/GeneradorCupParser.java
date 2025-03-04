/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package practica4;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

/* Barrera Alaniz Jose Angel */
/* Fernández Flores Bruno Eduardo */
/* Sanchez Mora Jose Alfredo */

public class GeneradorCupParser {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        //String[] parametros = {"-parser", "Sintactico", "C:\\Users\\7053\\Documents\\NetBeansProjects\\UEDL_COMPILADORES\\src\\sintactico\\sintactico.cup"};
        String[] parametros = {
            "-destdir", "src\\practica4",
            "-parser", "ParserC",
            "-progress", "src\\practica4\\sintacticoC.cup"};
        try {
            java_cup.Main.main(parametros);
        } catch (IOException ex) {
            Logger.getLogger(GeneradorCupParser.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(GeneradorCupParser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
