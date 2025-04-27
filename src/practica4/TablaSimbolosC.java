/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica4;

import java.util.HashMap;
import java.util.Map;

 /* Barrera Alaniz Jose Angel */
 /* Fernández Flores Bruno Eduardo */
 /* Sanchez Mora Jose Alfredo */

public class TablaSimbolosC {//nombres de variables, constantes, metodos, clases
    private Map<String,SimboloC> tabla;
    
    public TablaSimbolosC(){
        tabla=new HashMap<>();
    }    
    
    public boolean agregar(String nombre, SimboloC simbolo){
        if(tabla.containsKey(nombre))
            return false;
        else{
            tabla.put(nombre, simbolo);
            return true;
        }
    }
    
    public boolean verificar(String nombre){
        return tabla.containsKey(nombre);
    }
    
    public SimboloC obtenerSimbolo(String nombre){
        return tabla.get(nombre);
    }
    
    public String mostrar(){
        StringBuilder simbolos = new StringBuilder();
        simbolos.append("[\n");  // Añade el corchete de apertura y un salto de línea

        for (SimboloC value : tabla.values()) {
            simbolos.append(value.toString())
                   .append("\n");  // Añade un salto de línea después de cada símbolo
        }

        simbolos.append("]");  // Añade el corchete de cierre

        return simbolos.toString();
    }
    public boolean actualizarValor(String nombre, String nuevoValor) {
        if (!tabla.containsKey(nombre)) {
            return false;
        }

        SimboloC simbolo = tabla.get(nombre);

        if (simbolo.isConstante()) {
            return false;
        }

        simbolo.setValor(nuevoValor);
        return true;
    }
}