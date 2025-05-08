/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package practica4;
import java.io.*;
import java.util.*;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class GeneradorCodigoIntermedio {
    private static int contadorTemp = 1;
    private static Map<String, String> tablaSimbolos = new HashMap<>();

    public static int generarCodigoIntermedio(String expresion, int cTemp) {
        contadorTemp = cTemp;
        String directorioActual = System.getProperty("user.dir");
        String rutaArchivo = directorioActual + File.separator + "CodigoIntermedio.txt";
        
        String[] partes = expresion.split("=", 2);
        if (partes.length != 2) {
            System.err.println("Expresión inválida: " + expresion);
            return contadorTemp;
        }

        String izquierda = partes[0].trim();
        String derecha = partes[1].trim();

        List<String> tokens = tokenizar(derecha);
        List<String> tokensSustituidos = sustituirVariables(tokens);
        List<String> postfijo = infijoAPostfijo(tokensSustituidos);
        List<String> codigoGenerado = new ArrayList<>();
        Stack<String> pila = new Stack<>();

        for (String token : postfijo) {
            if (esOperador(token)) {
                String op2 = pila.pop();
                String op1 = pila.pop();
                String temp = "t" + contadorTemp++;
                codigoGenerado.add(temp + "=" + op1 + token + op2);
                pila.push(temp);
            } else {
                pila.push(token);
            }
        }

        if (pila.size() != 1) {
            System.err.println("Error procesando expresión: " + expresion);
            return contadorTemp;
        }

        String tempFinal = pila.pop();

        if (codigoGenerado.isEmpty()) {
            String nuevaTemp = "t" + contadorTemp++;
            codigoGenerado.add(nuevaTemp + "=" + tempFinal);
            codigoGenerado.add(izquierda + "=" + nuevaTemp);
            tablaSimbolos.put(izquierda, nuevaTemp);
        } else {
            codigoGenerado.add(izquierda + "=" + tempFinal);
            tablaSimbolos.put(izquierda, tempFinal);
        }

        try (PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(rutaArchivo, true)))) {
            for (String linea : codigoGenerado) {
                out.println(linea);
            }
            System.out.println("Codigo intermedio agregado a: " + rutaArchivo);
        } catch (IOException e) {
            System.err.println("Error al escribir en el archivo: " + e.getMessage());
        }
        return contadorTemp;
    }

    private static List<String> tokenizar(String derecha) {
        List<String> tokens = new ArrayList<>();
        Pattern patron = Pattern.compile(
            "(&&|\\|\\||==|!=|<=|>=|<|>)|([a-zA-Z]+)|(\\d+\\.\\d+|\\d+|\\.\\d+)|([+\\-*/()=])|(\"[^\"]*\")"
        );
        Matcher matcher = patron.matcher(derecha);
        while (matcher.find()) {
            if (matcher.group(1) != null) {
                tokens.add(matcher.group(1));
            } else if (matcher.group(2) != null) {
                tokens.add(matcher.group(2));
            } else if (matcher.group(3) != null) {
                tokens.add(matcher.group(3));
            } else if (matcher.group(4) != null) {
                tokens.add(matcher.group(4));
            } else if (matcher.group(5) != null) {
                tokens.add(matcher.group(5));
            }
        }
        return tokens;
    }

    private static List<String> sustituirVariables(List<String> tokens) {
        List<String> sustituidos = new ArrayList<>();
        for (String token : tokens) {
            if (esVariable(token)) {
                sustituidos.add(tablaSimbolos.getOrDefault(token, token));
            } else {
                sustituidos.add(token);
            }
        }
        return sustituidos;
    }

    private static boolean esVariable(String token) {
        return token.matches("[a-zA-Z]+");
    }

    private static List<String> infijoAPostfijo(List<String> tokens) {
        List<String> salida = new ArrayList<>();
        Stack<String> pila = new Stack<>();
        Map<String, Integer> precedencia = new HashMap<>();
        precedencia.put("+", 3);
        precedencia.put("-", 3);
        precedencia.put("*", 4);
        precedencia.put("/", 4);
        precedencia.put("<", 2);
        precedencia.put(">", 2);
        precedencia.put("<=", 2);
        precedencia.put(">=", 2);
        precedencia.put("==", 1);
        precedencia.put("!=", 1);
        precedencia.put("&&", 0);
        precedencia.put("||", 0);

        for (String token : tokens) {
            if (esNumeroOTemp(token) || esStringLiteral(token)) {
                salida.add(token);
            } else if (token.equals("(")) {
                pila.push(token);
            } else if (token.equals(")")) {
                while (!pila.isEmpty() && !pila.peek().equals("(")) {
                    salida.add(pila.pop());
                }
                pila.pop();
            } else if (esOperador(token)) {
                while (!pila.isEmpty() && !pila.peek().equals("(") && 
                       precedencia.getOrDefault(token, 0) <= precedencia.getOrDefault(pila.peek(), 0)) {
                    salida.add(pila.pop());
                }
                pila.push(token);
            }
        }

        while (!pila.isEmpty()) {
            salida.add(pila.pop());
        }

        return salida;
    }

    private static boolean esNumeroOTemp(String token) {
        return token.matches("t\\d+") || token.matches("\\d+(\\.\\d+)?|\\.\\d+");
    }

    private static boolean esStringLiteral(String token) {
        return token.startsWith("\"") && token.endsWith("\"");
    }

    private static boolean esOperador(String token) {
        return token.matches("&&|\\|\\||==|!=|<=|>=|<|>|\\+|-|\\*|/");
    }
}