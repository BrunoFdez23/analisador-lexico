/* Barrera Alaniz Jose Angel */
/* Fernández Flores Bruno Eduardo */
/* Sanchez Mora Jose Alfredo */

/* Paquete de ubicacion del archivo en el proyecto */
package practica4;

/* Importaciones necesarias */
import java_cup.runtime.*;

%%
%public
%class LexerC   /* Nombra la clase */
%unicode    	/* */
%cup        	/* Libreria cup */
%line       	/* Cuenta lineas */
%column     	/* Cuenta columnas */

%{
	private Symbol symbol (int type, Object value) {
	return new Symbol(type, yyline+1, yycolumn, value);
	}
%}

/* Definiciones */
/*Funcional*/
FINDELINEA = \r|\n|\r\n|\n\r
ESPACIOS = [" "\t\f]*
COMENTARIOUNILINEA = \/\/.*
COMENTARIOMULTILINEA = "/*"([^*] | \*+[^*/])*\*+"/"
IDENTIFICADOR = [_a-zA-Z][_a-zA-Z0-9]*
NUMHEXADECIMAL = 0[xX][0-9a-fA-F]+
NUMBINARIO = 0[bB][01]+
NUMOCTAL = 0[0-7]+
NUMDECIMAL = [1-9][0-9]*|0
NUMFLOTANTEDEC = (0|[1-9][0-9]*)\.[0-9]*([eE][-+]?[0-9]+)*
NUMFLOTANTEHEX = 0[xX][0-9a-fA-F]+\.[0-9a-fA-F]*([pP][-+]?[0-9]+)*
CADENATEXTO = \"([^\"\n\\]|\\.)*\"
CADENACHAR = \'([^\'\\]|\\.)\'


/*Error*/
ERRIDENTIFICADOR = [1-9]+[_a-zA-Z]+[_a-zA-Z0-9]*|[_a-zA-Z0-9]*[^_a-zA-Z0-9 \n\t\r\"\'\.\*<>(){},;\[\]]+[_a-zA-Z0-9]*
ERRCOMMULTILINEA = "/*"([^*]|\*+[^*/])*
ERRCADENATEXTO = \"([^\"\n\\]|\\.)*\n                                           
ERRCADENACHAR = \'([^\'\n\\]|\\.) | \'([^\'\n\\]|\\.)([^\'\n\\]|\\.)+\'
ERRNUMDECIMAL = [1-9][^0-9 \n\t\r\"\'\.\*<>(){},;\[\]]+|0[^0-9[xXbB] \n\t\r\"\'\.\*<>(){},;\[\]]+
ERRNUMHEXADECIMAL = 0[xX][0-9a-fA-F]*[^0-9a-fA-F \n\t\r\"\'\.\*<>(){},;\[\]]+[^ \n\t\r\"\'\.\*<>(){},;\[\]]*
ERRNUMBINARIO = 0[bB][01]*[^01 \n\t\r\"\'\.\*<>(){},;\[\]]+
ERRNUMOCTAL = 0[0-7]*[^0-7 \n\t\r\"\'\.\*<>(){},;\[\]]+
ERRNUMFLOTANTE =    [0-9]*\.[0-9]*[eE][-+]?[^ \n\t\r\"\'\.\*<>(){},;\[\]]*|[0-9]+\.[0-9]*[eE][-+]?[0-9]*[^0-9 \n\f\r\t]|[0-9]+\.[0-9]*([eE][-+]?[0-9])?(\.|([^([0-9]*([eE][-+]?[0-9]+)?) \n\t\r\"\'\.\*<>(){},;\[\]]))[^ \n\t\r\"\'\.\*<>(){},;\[\]]* 
ERRNUMHEXFLOTANTE = 0[xX][0-9a-fA-F]*\.[0-9a-fA-F]*[pP][-+]?[0-9]*[^ \n\t\r\"\'\.\*<>(){},;\[\]]*|0[xX][0-9a-fA-F]+\.[0-9a-fA-F]*[pP][-+]?[0-9]*[^0-9 \n\f\r\t]|0[xX][0-9a-fA-F]+\.[0-9a-fA-F]*([pP][-+]?[0-9])?(\.|([^[[0-9a-fA-F]*([pP][-+]?[0-9]+)?]] \n\f\r\t))[^ \n\f\r\t]*
ERROPERADOR = [@#$]+

%%

/* Fin de linea */
{FINDELINEA}	{/* Ignorar */}

/* Espacios */
{ESPACIOS}      {/* Ignorar*/}

/* Comentarios */
{COMENTARIOUNILINEA}            {
                                /*System.out.println("Comentario: UNILINEA");*/
                                return symbol(sym.COMENTARIOUNILINEA,yytext());
                                }
{COMENTARIOMULTILINEA}          {
                                /*System.out.println("Comentario: MULTILINEA");*/
                                return symbol(sym.COMENTARIOMULTILINEA,yytext());
                                }

/* Palabras reservadas */
"auto"              {
                    /*System.out.println("Palabra Reservada: AUTO");*/
                    return symbol(sym.AUTO,yytext());
                    }
"break"             {
                    /*System.out.println("Palabra Reservada: BREAK");*/
                    return symbol(sym.BREAK,yytext());
                    }
"case"              {
                    /*System.out.println("Palabra Reservada: CASE");*/
                    return symbol(sym.CASE,yytext());
                    }
"char"              {
                    /*System.out.println("Palabra Reservada: CHAR");*/
                    return symbol(sym.CHAR,yytext());
                    }
"const"             {
                    /*System.out.println("Palabra Reservada: CONST");*/
                    return symbol(sym.CONST,yytext());
                    }
"continue"          {
                    /*System.out.println("Palabra Reservada: CONTINUE");*/
                    return symbol(sym.CONTINUE,yytext());
                    }
"default"           {
                    /*System.out.println("Palabra Reservada: DEFAULT");*/
                    return symbol(sym.DEFAULT,yytext());
                    }
"do"                {
                    /*System.out.println("Palabra Reservada: DO");*/
                    return symbol(sym.DO,yytext());
                    }
"double"            {
                    /*System.out.println("Palabra Reservada: DOUBLE");*/
                    return symbol(sym.DOUBLE,yytext());
                    }
"else"              {
                    /*System.out.println("Palabra Reservada: ELSE");*/
                    return symbol(sym.ELSE,yytext());
                    }
"enum"              {
                    /*System.out.println("Palabra Reservada: ENUM");*/
                    return symbol(sym.ENUM,yytext());
                    }
"extern"            {
                    /*System.out.println("Palabra Reservada: EXTERN");*/
                    return symbol(sym.EXTERN,yytext());
                    }
"float"             {
                    /*System.out.println("Palabra Reservada: FLOAT");*/
                    return symbol(sym.FLOAT,yytext());
                    }
"for"               {
                    /*System.out.println("Palabra Reservada: FOR");*/
                    return symbol(sym.FOR,yytext());
                    }
"goto"              {
                    /*System.out.println("Palabra Reservada: GOTO");*/
                    return symbol(sym.GOTO,yytext());
                    }
"if"                {
                    /*System.out.println("Palabra Reservada: IF");*/
                    return symbol(sym.IF,yytext());
                    }
"inline"            {
                    /*System.out.println("Palabra Reservada: INLINE");*/
                    return symbol(sym.INLINE,yytext());
                    }
"int"               {
                    /*System.out.println("Palabra Reservada: INT");*/
                    return symbol(sym.INT,yytext());
                    }
"long"              {
                    /*System.out.println("Palabra Reservada: LONG");*/
                    return symbol(sym.LONG,yytext());
                    }
"main"              {
                    /*System.out.println("Palabra Reservada: MAIN");*/
                    return symbol(sym.MAIN,yytext());
                    }
"register"          {
                    /*System.out.println("Palabra Reservada: REGISTER");*/
                    return symbol(sym.REGISTER,yytext());
                    }
"restrict"          {
                    /*System.out.println("Palabra Reservada: RESTRICT");*/
                    return symbol(sym.RESTRICT,yytext());
                    }
"return"            {
                    /*System.out.println("Palabra Reservada: RETURN");*/
                    return symbol(sym.RETURN,yytext());
                    }
"short"             {
                    /*System.out.println("Palabra Reservada: SHORT");*/
                    return symbol(sym.SHORT,yytext());
                    }
"signed"            {
                    /*System.out.println("Palabra Reservada: SIGNED");*/
                    return symbol(sym.SIGNED,yytext());
                    }
"sizeof"            {
                    /*System.out.println("Palabra Reservada: SIZEOF");*/
                    return symbol(sym.SIZEOF,yytext());
                    }
"static"            {
                    /*System.out.println("Palabra Reservada: STATIC");*/
                    return symbol(sym.STATIC,yytext());
                    }
"struct"            {
                    /*System.out.println("Palabra Reservada: STRUCT");*/
                    return symbol(sym.STRUCT,yytext());
                    }
"switch"            {
                    /*System.out.println("Palabra Reservada: SWITCH");*/
                    return symbol(sym.SWITCH,yytext());
                    }
"typedef"           {
                    /*System.out.println("Palabra Reservada: TYPEDEF");*/
                    return symbol(sym.TYPEDEF,yytext());
                    }
"typeof"            {
                    /*System.out.println("Palabra Reservada: TYPEOF");*/
                    return symbol(sym.TYPEOF,yytext());
                    }
"typeof_unqual"     {
                    /*System.out.println("Palabra Reservada: TYPEOF_UNQUAL");*/
                    return symbol(sym.TYPEOF_UNQUAL,yytext());
                    }
"union"             {
                    /*System.out.println("Palabra Reservada: UNION");*/
                    return symbol(sym.UNION,yytext());
                    }
"unsigned"          {
                    /*System.out.println("Palabra Reservada: UNSIGNED");*/
                    return symbol(sym.UNSIGNED,yytext());
                    }
"void"              {
                    /*System.out.println("Palabra Reservada: VOID");*/
                    return symbol(sym.VOID,yytext());
                    }
"volatile"          {
                    /*System.out.println("Palabra Reservada: VOLATILE");*/
                    return symbol(sym.VOLATILE,yytext());
                    }
"while"             {
                    /*System.out.println("Palabra Reservada: WHILE");*/
                    return symbol(sym.WHILE,yytext());
                    }
"_Alignas"          {
                    /*System.out.println("Palabra Reservada: _Alignas");*/
                    return symbol(sym._Alignas,yytext());
                    }
"_Alignof"          {
                    /*System.out.println("Palabra Reservada: _Alignof");*/
                    return symbol(sym._Alignof,yytext());
                    }
"_Atomic"           {
                    /*System.out.println("Palabra Reservada: _Atomic");*/
                    return symbol(sym._Atomic,yytext());
                    }
"_Bool"             {
                    /*System.out.println("Palabra Reservada: _Bool");*/
                    return symbol(sym._Bool,yytext());
                    }
"_Complex"          {
                    /*System.out.println("Palabra Reservada: _Complex");*/
                    return symbol(sym._Complex,yytext());
                    }
"_Generic"          {
                    /*System.out.println("Palabra Reservada: _Generic");*/
                    return symbol(sym._Generic,yytext());
                    }
"_Imaginary"        {
                    /*System.out.println("Palabra Reservada: _Imaginary");*/
                    return symbol(sym._Imaginary,yytext());
                    }
"_Noreturn"         {
                    /*System.out.println("Palabra Reservada: _Noreturn");*/
                    return symbol(sym._Noreturn,yytext());
                    }
"_Static_assert"    {
                    /*System.out.println("Palabra Reservada: _Static_assert");*/
                    return symbol(sym._Static_assert,yytext());
                    }
"_Thread_local"     {
                    /*System.out.println("Palabra Reservada: _Thread_local");*/
                    return symbol(sym._Thread_local,yytext());
                    }

/* Directivas del preprocesador "#" ["include"|"define"|"ifdef"|"ifndef"|"else"|"endif"] */
"#include"  {
            /*System.out.println("[DIRECTIVA] Para incluir archivos: " + yytext());*/
            return symbol(sym.DIRECTIVA_INCLUDE, yytext());
            }
"#define"   {
            /*System.out.println("[DIRECTIVA] Para definir macros: " + yytext());*/
            return symbol(sym.DIRECTIVA_DEFINE, yytext());
            }
"#ifdef"    {
            /*System.out.println("[DIRECTIVA] Para comprobar si una macro está definida: " + yytext());*/
            return symbol(sym.DIRECTIVA_IFDEF, yytext());
            }
"#ifndef"   {
            /*System.out.println("[DIRECTIVA] Para comprobar si una macro NO está definida: " + yytext());*/
            return symbol(sym.DIRECTIVA_IFNDEF, yytext());
            }
"#else"     {
            /*System.out.println("[DIRECTIVA] Parte de una estructura condicional del preprocesador: " + yytext());*/
            return symbol(sym.DIRECTIVA_ELSE, yytext());
            }
"#endif"    {
            /*System.out.println("[DIRECTIVA] Para cerrar una estructura condicional del preprocesador: " + yytext());*/
            return symbol(sym.DIRECTIVA_ENDIF, yytext());
            }

/*CARACTERES DE FORMATO*/
"%"[di]     {
            /*System.out.println("[CARACTER DE FORMATO] Para imprimir numeros enteros: " + yytext());*/
            return symbol(sym.CFORMATO_INTEGER, yytext());
            }
"%u"        {
            /*System.out.println("[CARACTER DE FORMATO] Para imprimir numeros enteros SIN SIGNO: " + yytext());*/
            return symbol(sym.CFORMATO_UNSIGNED, yytext());
            }
"%"[fF]     {
            /*System.out.println("[CARACTER DE FORMATO] Para imprimir numeros de punto flotante (decimales): " + yytext());*/
            return symbol(sym.CFORMATO_FLOTANTE_DECIMAL, yytext());
            }
"%"[eE]     {
            /*System.out.println("[CARACTER DE FORMATO] Para imprimir numeros en notacion cientifica: " + yytext());*/
            return symbol(sym.CFORMATO_NOTACION_EXPONENCIAL, yytext());
            }
"%"[gG]     {
            /*System.out.println("[CARACTER DE FORMATO] Para imprimir numeros en formato general: " + yytext());*/
            return symbol(sym.CFORMATO_GENERAL, yytext());
            }
"%"[xX]     {
            /*System.out.println("[CARACTER DE FORMATO] Para imprimir numeros hexadecimales: " + yytext());*/
            return symbol(sym.CFORMATO_HEXADECIMAL, yytext());
            }
"%o"        {
            /*System.out.println("[CARACTER DE FORMATO] Para imprimir numeros octales: " + yytext());*/
            return symbol(sym.CFORMATO_OCTAL, yytext());
            }
"%s"        {
            /*System.out.println("[CARACTER DE FORMATO] Para imprimir cadenas de caracteres: " + yytext());*/
            return symbol(sym.CFORMATO_STRING, yytext());
            }
"%c"        {
            /*System.out.println("[CARACTER DE FORMATO] Para imprimir un solo caracter: " + yytext());*/
            return symbol(sym.CFORMATO_CHAR, yytext());
            }
"%p"        {
            /*System.out.println("[CARACTER DE FORMATO] Para imprimir una direccion de memoria: " + yytext());*/
            return symbol(sym.CFORMATO_POINTER, yytext());
            }
"%n"        {
            /*System.out.println("[CARACTER DE FORMATO] Para imprimir el numero de caracteres que han sido procesados hasta ese momento: " + yytext());*/
            return symbol(sym.CFORMATO_NUM_CARACTERES_PROCESADOS, yytext());
            }


/* Operadores Y Simbolos*/

/* Operadores Aritméticos */
"+"         { 
            /*System.out.println("Operador: SUMA");*/ 
            return symbol(sym.SUMA, yytext()); 
            }
"-"         { 
            /*System.out.println("Operador: RESTA");*/ 
            return symbol(sym.RESTA, yytext()); 
            }
"*"         { 
            /*System.out.println("Operador: MULTIPLICACION");*/ 
            return symbol(sym.MULTIPLICACION, yytext()); 
            }
"/"         { 
            /*System.out.println("Operador: DIVISION");*/ 
            return symbol(sym.DIVISION, yytext()); 
            }
"%"         { 
            /*System.out.println("Operador: MODULO");*/ 
            return symbol(sym.MODULO, yytext()); 
            }

/* Operadores Relacionales */
"=="        { 
            /*System.out.println("Operador: IGUALDAD");*/ 
            return symbol(sym.IGUALDAD, yytext()); 
            }
"!="        { 
            /*System.out.println("Operador: DIFERENTE");*/ 
            return symbol(sym.DIFERENTE, yytext()); 
            }
"<"         { 
            /*System.out.println("Operador: MENOR QUE");*/ 
            return symbol(sym.MENOR_QUE, yytext()); 
            }
">"         { 
            /*System.out.println("Operador: MAYOR QUE");*/ 
            return symbol(sym.MAYOR_QUE, yytext()); 
            }
"<="        { 
            /*System.out.println("Operador: MENOR O IGUAL");*/ 
            return symbol(sym.MENOR_IGUAL, yytext()); 
            }
">="        { 
            /*System.out.println("Operador: MAYOR O IGUAL");*/ 
            return symbol(sym.MAYOR_IGUAL, yytext()); 
            }

/* Operadores Lógicos */
"&&"        { 
            /*System.out.println("Operador: AND LOGICO");*/ 
            return symbol(sym.AND, yytext()); 
            }
"||"        { 
            /*System.out.println("Operador: OR LOGICO");*/ 
            return symbol(sym.OR, yytext()); 
            }
"!"         { 
            /*System.out.println("Operador: NOT LOGICO");*/ 
            return symbol(sym.NOT, yytext()); 
            }

/* Operadores de Asignación */
"="         { 
            /*System.out.println("Operador: ASIGNACION");*/ 
            return symbol(sym.ASIGNACION, yytext()); 
            }
"+="        { 
            /*System.out.println("Operador: SUMA Y ASIGNACION");*/ 
            return symbol(sym.SUMA_ASIGNACION, yytext()); 
            }
"-="        { 
            /*System.out.println("Operador: RESTA Y ASIGNACION");*/ 
            return symbol(sym.RESTA_ASIGNACION, yytext()); 
            }
"*="        { 
            /*System.out.println("Operador: MULTIPLICACION Y ASIGNACION");*/ 
            return symbol(sym.MULT_ASIGNACION, yytext()); 
            }
"/="        { 
            /*System.out.println("Operador: DIVISION Y ASIGNACION");*/ 
            return symbol(sym.DIV_ASIGNACION, yytext()); 
            }
"%="        { 
            /*System.out.println("Operador: MODULO Y ASIGNACION");*/ 
            return symbol(sym.MOD_ASIGNACION, yytext()); 
            }

/* Operadores Bit a Bit */
"&"         { 
            /*System.out.println("Operador: AND BIT A BIT");*/ 
            return symbol(sym.AND_BIT, yytext()); 
            }
"|"         { 
            /*System.out.println("Operador: OR BIT A BIT");*/ 
            return symbol(sym.OR_BIT, yytext()); 
            }
"^"         { 
            /*System.out.println("Operador: XOR BIT A BIT");*/ 
            return symbol(sym.XOR_BIT, yytext()); 
            }
"~"         { 
            /*System.out.println("Operador: NOT BIT A BIT");*/ 
            return symbol(sym.NOT_BIT, yytext()); 
            }
"<<"        { 
            /*System.out.println("Operador: DESPLAZAMIENTO IZQUIERDA");*/ 
            return symbol(sym.DESPLAZA_IZQ, yytext()); 
            }
">>"        { 
            /*System.out.println("Operador: DESPLAZAMIENTO DERECHA");*/ 
            return symbol(sym.DESPLAZA_DER, yytext()); 
            }

/* Operadores de Incremento y Decremento */
"++"        { 
            /*System.out.println("Operador: INCREMENTO");*/ 
            return symbol(sym.INCREMENTO, yytext()); 
            }
"--"        { 
            /*System.out.println("Operador: DECREMENTO");*/ 
            return symbol(sym.DECREMENTO, yytext()); 
            }

/* Operador Ternario */
"?"         { 
            /*System.out.println("Operador: CONDICIONAL");*/ 
            return symbol(sym.CONDICIONAL, yytext()); 
            }
":"         { 
            /*System.out.println("Operador: DOS PUNTOS");*/ 
            return symbol(sym.DOS_PUNTOS, yytext()); 
            }

/* Operadores de Acceso */
"."         { 
            /*System.out.println("Operador: PUNTO");*/ 
            return symbol(sym.PUNTO, yytext()); 
            }
"->"        { 
            /*System.out.println("Operador: ACCESO PUNTERO");*/ 
            return symbol(sym.ACCESO_PUNTERO, yytext()); 
            }

/* Símbolos Especiales */
"("         { 
            /*System.out.println("Simbolo: PARENTESIS IZQ");*/ 
            return symbol(sym.PARENTESIS_IZQ, yytext()); 
            }
")"         { 
            /*System.out.println("Simbolo: PARENTESIS DER");*/ 
            return symbol(sym.PARENTESIS_DER, yytext()); 
            }
"["         { 
            /*System.out.println("Simbolo: CORCHETE IZQ");*/ 
            return symbol(sym.CORCHETE_IZQ, yytext()); 
            }
"]"         { 
            /*System.out.println("Simbolo: CORCHETE DER");*/ 
            return symbol(sym.CORCHETE_DER, yytext()); 
            }
"{"         { 
            /*System.out.println("Simbolo: LLAVE IZQ");*/ 
            return symbol(sym.LLAVE_IZQ, yytext()); 
            }
"}"         { 
            /*System.out.println("Simbolo: LLAVE DER");*/ 
            return symbol(sym.LLAVE_DER, yytext()); 
            }
","         { 
            /*System.out.println("Simbolo: COMA");*/ 
            return symbol(sym.COMA, yytext()); 
            }
";"         { 
            /*System.out.println("Simbolo: PUNTO Y COMA");*/ 
            return symbol(sym.PUNTO_Y_COMA, yytext()); 
            }

/* Identificadores */
{IDENTIFICADOR}         {
                        /*System.out.println("Identificador: " + yytext());*/
                        return symbol(sym.IDENTIFICADOR, yytext());
                        }


/* Literales Numéricos*/
/* Enteros */
{NUMHEXADECIMAL}        { 
                        /*System.out.println("Literal Numerico: HEX_LITERAL");*/
                        return symbol(sym.NUMHEXADECIMAL, yytext()); 
                        }   /* Hexadecimal */
{NUMBINARIO}            {
                        /*System.out.println("Literal Numerico: BIN_LITERAL");*/
                        return symbol(sym.NUMBINARIO, yytext()); 
                        }   /* Binario */
{NUMOCTAL}              { 
                        /*System.out.println("Literal Numerico: OCT_LITERAL");*/
                        return symbol(sym.NUMOCTAL, yytext()); 
                        }   /* Octal */
{NUMDECIMAL}            { 
                        /*System.out.println("Literal Numerico: INT_LITERAL");*/
                        return symbol(sym.NUMDECIMAL, yytext()); 
                        }   /* Decimal */

/* Punto Flotante */
{NUMFLOTANTEDEC}        { 
                        /*System.out.println("Literal Numerico: DEC_FLOAT_LITERAL en la linea " + (yyline + 1));*/
                        return symbol(sym.NUMFLOTANTEDEC, yytext()); 
                        }   /* Decimal con exponente */
{NUMFLOTANTEHEX}        { 
                        /*System.out.println("Literal Numerico: HEX_FLOAT_LITERAL");*/
                        return symbol(sym.NUMFLOTANTEHEX, yytext()); 
                        }   /* Hexadecimal con exponente */

/* Cadenas de texto */
{CADENATEXTO}           { 
                        /*System.out.println("Cadena String: " + yytext());*/ 
                        return symbol(sym.CADENATEXTO, yytext()); 
                        }
{CADENACHAR}            { 
                        /*System.out.println("Cadena Char: " + yytext());*/ 
                        return symbol(sym.CADENACHAR, yytext()); 
                        }

/* ERRORES */
{ERRCOMMULTILINEA}  {
                    System.err.println("Error léxico: [ERRCOMMULTILINEA] Comentario multilinea sin cerrar '" + yytext() + "' en la línea " + (yyline + 1) + " [ERRCOMMULTILINEA]");
                    }
{ERRCADENATEXTO}    {
                    System.err.println("Error léxico: [ERRCADENATEXTO] Cadena de texto sin cerrar '" + yytext() + "' en la línea " + (yyline + 1) + " [ERRCADENATEXTO]");
                    }
{ERROPERADOR}       { 
                    System.err.println("Error léxico: [ERROPERADOR] Operador no válido '" + yytext() + "' en la linea " + (yyline + 1) + " [ERROPERADOR]");
                    }
{ERRCADENACHAR}     { 
                    System.err.println("Error léxico: [ERRCADENACHAR] Cadena de char sin cerrar '" + yytext() + "' en la línea " + (yyline + 1) + " [ERRCADENACHAR]");
                    }
{ERRNUMDECIMAL}     { 
                    System.err.println("Error léxico: [ERRNUMDECIMAL] Número decimal inválido '" + yytext() + "' en la línea " + (yyline + 1) + " [ERRNUMDECIMAL]"); 
                    }
{ERRNUMHEXADECIMAL} { 
                    System.err.println("Error léxico: [ERRNUMHEXADECIMAL] Número hexadecimal inválido '" + yytext() + "' en la línea " + (yyline + 1) + " [ERRNUMHEXADECIMAL]"); 
                    }
{ERRNUMBINARIO}     {
                    System.err.println("Error léxico: [ERRNUMBINARIO] Número binario inválido '" + yytext() + "' en la línea " + (yyline + 1) + " [ERRNUMBINARIO]");
                    }
{ERRNUMOCTAL}       { 
                    System.err.println("Error léxico: [ERRNUMOCTAL] Número octal inválido '" + yytext() + "' en la línea " + (yyline + 1) + " [ERRNUMOCTAL]");
                    }
{ERRNUMFLOTANTE}    { 
                    System.err.println("Error léxico: [ERRNUMFLOTANTE] Número flotante mal formado '" + yytext() + "' en la línea " + (yyline + 1) + " [ERRNUMFLOTANTE]");
                    }
{ERRNUMHEXFLOTANTE} { 
                    System.err.println("Error léxico: [ERRNUMHEXFLOTANTE] Número flotante mal formado '" + yytext() + "' en la línea " + (yyline + 1) + " [ERRNUMHEXFLOTANTE]");
                    }
{ERRIDENTIFICADOR}  { 
                    System.err.println("Error léxico: [ERRIDENTIFICADOR] Caracter inválido '" + yytext() + "' en la línea " + (yyline + 1) + " [ERRIDENTIFICADOR]");
                    }

/* Ultima Regla */
.                   { 
                    System.err.println("Error léxico: Carácter desconocido '" + yytext() + "' en la línea " + (yyline + 1)); 
                    }
