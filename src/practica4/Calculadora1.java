/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica4;

/* Barrera Alaniz Jose Angel */
/* Fernández Flores Bruno Eduardo */
/* Sanchez Mora Jose Alfredo */

import java.util.Stack;

public class Calculadora1 {
    // Modificamos el método evaluar para manejar diferentes tipos de datos
    public static String evaluar(String expresion, String tipoDato) {
        Stack<String> valores = new Stack<>();
        Stack<Character> operaciones = new Stack<>();

        for (int i = 0; i < expresion.length(); i++) {
            char c = expresion.charAt(i);

            if (Character.isWhitespace(c)) continue;

            // Manejo de números y booleanos
            if (Character.isDigit(c) || c == '.') {
                StringBuilder numero = new StringBuilder();
                while (i < expresion.length() && (Character.isDigit(expresion.charAt(i)) || expresion.charAt(i) == '.')) {
                    numero.append(expresion.charAt(i++));
                }
                i--;
                valores.push(numero.toString());
            } 
            else if (Character.isLetter(c)) {
                StringBuilder palabra = new StringBuilder();
                while (i < expresion.length() && Character.isLetter(expresion.charAt(i))) {
                    palabra.append(expresion.charAt(i++));
                }
                i--;
                String val = palabra.toString();
                if (val.equals("true") || val.equals("false")) {
                    valores.push(val);
                }
            }
            else if (c == '(') {
                operaciones.push(c);
            }
            else if (c == ')') {
                while (operaciones.peek() != '(') {
                    procesarOperacion(operaciones, valores, tipoDato);
                }
                operaciones.pop();
            } 
            else {
                // Manejo de operadores de dos caracteres
                if (i < expresion.length() - 1) {
                    char next = expresion.charAt(i + 1);
                    String posibleOperador = "" + c + next;
                    if (esOperadorDoble(posibleOperador)) {
                        switch (posibleOperador) {
                            case "!=":
                                c = '≠';  // Símbolo temporal para !=
                                break;
                            case "==":
                                c = '=';  // Símbolo temporal para ==
                                break;
                            case ">=":
                                c = '≥';
                                break;
                            case "<=":
                                c = '≤';
                                break;
                            case "&&":
                                c = '&';
                                break;
                            case "||":
                                c = '|';
                                break;
                        }
                        i++;  // Avanzamos un carácter adicional
                    }
                }
                
                while (!operaciones.isEmpty() && precedencia(c) <= precedencia(operaciones.peek())) {
                    procesarOperacion(operaciones, valores, tipoDato);
                }
                operaciones.push(c);
            }
        }

        while (!operaciones.isEmpty()) {
            procesarOperacion(operaciones, valores, tipoDato);
        }

        return valores.pop();
    }

    private static void procesarOperacion(Stack<Character> ops, Stack<String> vals, String tipoDato) {
        char op = ops.pop();
        if (op == '!') { // Operador unario
            String a = vals.pop();
            vals.push(aplicarOperacion(op, a, null, tipoDato));
        } else {
            String b = vals.pop();
            String a = vals.pop();
            vals.push(aplicarOperacion(op, a, b, tipoDato));
        }
    }

    // Modificamos la precedencia
    private static int precedencia(char op) {
        switch (op) {
            case '!': return 5;
            case '*':
            case '/': return 4;
            case '+':
            case '-': return 3;
            case '>':
            case '<':
            case '≥': // Usamos símbolo temporal para >=
            case '≤': // Usamos símbolo temporal para <=
            case '≠': // Usamos símbolo temporal para !=
            case '=': return 2; // Para ==
            case '&': // Para &&
            case '|': return 1; // Para ||
            default: return 0;
        }
    }

    private static boolean esOperadorDoble(String op) {
        return op.equals("&&") || op.equals("||") || op.equals("==") 
            || op.equals("!=") || op.equals(">=") || op.equals("<=");
    }

    // Ampliamos la función de aplicar operaciones
    private static String aplicarOperacion(char op, String a, String b, String tipoDato) {
        if (tipoDato.equals("int") || tipoDato.equals("float") || tipoDato.equals("bool")){
            switch (op) {
                // Operadores aritméticos (existente)
                case '+': 
                    if (tipoDato.equals("int")) return String.valueOf(Integer.parseInt(a) + Integer.parseInt(b));
                    else  return String.valueOf(Float.parseFloat(a) + Float.parseFloat(b));
                case '-': 
                    if (tipoDato.equals("int")) return String.valueOf(Integer.parseInt(a) - Integer.parseInt(b));
                    else return String.valueOf(Float.parseFloat(a) - Float.parseFloat(b));
                case '*': 
                    if (tipoDato.equals("int")) return String.valueOf(Integer.parseInt(a) * Integer.parseInt(b));
                    else return String.valueOf(Float.parseFloat(a) * Float.parseFloat(b));
                case '/': 
                    if (tipoDato.equals("int")) return String.valueOf(Integer.parseInt(a) / Integer.parseInt(b));
                    else return String.valueOf(Float.parseFloat(a) / Float.parseFloat(b));

                // Operadores relacionales
                case '>':
                    if (tipoDato.equals("int")) return String.valueOf(Integer.parseInt(a) > Integer.parseInt(b));
                    else return String.valueOf(Float.parseFloat(a) > Float.parseFloat(b));

                case '<':
                    if (tipoDato.equals("int")) return String.valueOf(Integer.parseInt(a) < Integer.parseInt(b));
                    else return String.valueOf(Float.parseFloat(a) < Float.parseFloat(b));

                case '≥': // >=
                    if (tipoDato.equals("int")) return String.valueOf(Integer.parseInt(a) >= Integer.parseInt(b));
                    else return String.valueOf(Float.parseFloat(a) >= Float.parseFloat(b));

                case '≤': // <=
                    if (tipoDato.equals("int")) return String.valueOf(Integer.parseInt(a) >= Integer.parseInt(b));
                    else return String.valueOf(Float.parseFloat(a) >= Float.parseFloat(b));

                case '=': // ==
                    return String.valueOf(a.equals(b));

                case '≠': // !=
                    return String.valueOf(!a.equals(b));

                // Operadores lógicos
                case '&': // &&
                    return String.valueOf(Boolean.parseBoolean(a) && Boolean.parseBoolean(b));

                case '|': // ||
                    return String.valueOf(Boolean.parseBoolean(a) || Boolean.parseBoolean(b));

                case '!':
                    return String.valueOf(!Boolean.parseBoolean(a));

                default:
                    throw new IllegalArgumentException("Operador no válido: " + op);
            }
        }
        return "error";
    }
}
