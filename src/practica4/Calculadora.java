/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica4;

/**
 *
 * @author ggosi
 */
import java.util.Stack;

public class Calculadora {
    //Calcular expresión int
    public static String evaluar(String expresion, String tipoDato) {
        Stack<String> numeros = new Stack<>();
        Stack<Character> operaciones = new Stack<>();

        for (int i = 0; i < expresion.length(); i++) {
            char c = expresion.charAt(i);

            if (Character.isWhitespace(c)) {
                continue;
            }

            if (Character.isDigit(c)) {
                String numero = "";
                while ((i < expresion.length() && Character.isDigit(expresion.charAt(i))) ||(i < expresion.length() && expresion.charAt(i) == '.')) {
                    numero = numero + expresion.charAt(i);
                    i++;
                }
                i--; // retrocedemos porque el for también incrementa
                numeros.push(numero);
            } else if (c == '(') {
                operaciones.push(c);
            } else if (c == ')') {
                while (operaciones.peek() != '(') {
                    numeros.push(aplicarOperacion(operaciones.pop(), numeros.pop(), numeros.pop(),tipoDato));
                }
                operaciones.pop(); // quitamos el '('
            } else if (esOperador(c)) {
                while (!operaciones.isEmpty() && precedencia(c) <= precedencia(operaciones.peek())) {
                    numeros.push(aplicarOperacion(operaciones.pop(), numeros.pop(), numeros.pop(),tipoDato));
                }
                operaciones.push(c);
            }
        }

        while (!operaciones.isEmpty()) {
            numeros.push(aplicarOperacion(operaciones.pop(), numeros.pop(), numeros.pop(),tipoDato));
        }

        return numeros.pop();
    }

    private static boolean esOperador(char c) {
        return (c == '+' || c == '-' || c == '*' || c == '/');
    }

    private static int precedencia(char op) {
        if (op == '+' || op == '-') return 1;
        if (op == '*' || op == '/') return 2;
        return 0;
    }

    private static String aplicarOperacion(char op, String b, String a, String tipoDato) {
        int resultadoInt = 0;
        float resultadoFloat = 0;
        //System.out.println(a+", "+b);
        switch (tipoDato){
            case "int":
                int aInt = Integer.parseInt(a);
                int bInt = Integer.parseInt(b);
                switch (op) {
                    case '+':  resultadoInt = aInt + bInt; break;
                    case '-':  resultadoInt = aInt - bInt; break;
                    case '*':  resultadoInt = aInt * bInt; break;
                    case '/':  resultadoInt = aInt / bInt; break;
                }
                //System.out.println("resultadoInt: "+resultadoInt);
                return String.valueOf(resultadoInt);
            case "float":
                float aFloat = Float.parseFloat(a);
                float bFloat = Float.parseFloat(b);
                switch (op) {
                    case '+':  resultadoFloat = aFloat + bFloat; break;
                    case '-':  resultadoFloat = aFloat - bFloat; break;
                    case '*':  resultadoFloat = aFloat * bFloat; break;
                    case '/':  resultadoFloat = aFloat / bFloat; break;
                }
                //System.out.println("resultadoFloat: "+resultadoFloat);
                return String.valueOf(resultadoFloat);
        }
        return "0";
    }

}
