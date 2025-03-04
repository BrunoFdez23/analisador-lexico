/*
	Fernández Flores Bruno Eduardo
	Sanchez Mora Jose Alfredo
*/
/* Paquete de ubicacion del archivo en el proyecto*/
package practica1;

/*Importaciones necesarias*/
import java_cup.runtime.*;

%%

%class LexerC   /*Nombra la clase*/
%unicode    	/**/
%cup        	/*Libreria cup*/
%line       	/*Cuenta lineas*/
%column     	/*Cuenta columnas*/

%{
	private Symbol symbol (int type, Object value) {
	return new Symbol(type, yyline+1, yycolumn, value)
	}
%}

%%

/* Fin de linea */
"\r|\n|\r\n"	{/* Ignorar */}

/* Espacios */
"[ \t\f]*"  	{/* Ignorar */}

/* Comentarios */
"\/\/.*"    	{
            	System.out.println("Este es un comentario unilinea");
            	}

"\/\*.*\*\/"	{
            	System.out.println("Este es un comentario multilinea");
            	}

/* Ultima Regla */
".*"        	{
            	System.outyt.println("Este Token no está reconocido ");
            	}
