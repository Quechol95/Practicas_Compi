D			  [0-9]
L			  [a-zA-Z_]
H			  [a-fA-F0-9]
E			  [Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*

%{
#include <stdio.h>
%}

%%

"auto"	     { printf("<tipo de dato local>"); }
"break"			 { printf("<comportamiento>"); }
"case"			 { printf("<sentencia de control>"); }
"char"			 { printf("<tipo de dato>"); }
"const"			 { printf("<variable constante>"); }
"continue"	 { printf("<comportamiento>"); }
"default"		 { printf("<sentencia por defecto>"); }
"do"			   { printf("<ciclo>"); }
"double"		 { printf("<tipo de dato>"); }
"else"			 { printf("<sentencia de control>"); }
"enum"			 { printf("<constante de enumeracion>"); }
"extern"		 { printf("<Variable global de un modulo>"); }
"float"			 { printf("<tipo de dato>"); }
"for"			   { printf("<ciclo>"); }
"goto"			 { printf("<Salto>"); }
"if"			   { printf("<sentencia de control>"); }
"int"			   { printf("<tipo de dato>"); }
"long"			 { printf("<modificador de tipo>"); }
"register"	 { printf("<Variable de uso frecuente>"); }
"return"		 { printf("<Salir de funcion>"); }
"short"			 { printf("<modificador de tipo>"); }
"signed"		 { printf("<modificador de tipo>"); }
"sizeof"		 { printf("<operador de tiempo>"); }
"static"		 { printf("<Variable estatica>"); }
"struct"		 { printf("<sentencia de estructura>"); }
"switch"		 { printf("<sentencia de control>"); }
"typedef"		 { printf("<creador de alias>"); }
"union"			 { printf("<tipo de dato con la misma direccion de memoria>"); }
"unsigned"	 { printf("<modificador de tipo>"); }
"void"			 { printf("<sin tipo de dato>"); }
"volatile"	 { printf("<variable modificada externamente>"); }
"while"			 { printf("<ciclo>"); }

{L}({L}|{D})*		         { printf("<Identificador>"); }

0[xX]{H}+{IS}?		       {printf("<literal entera base hexadecimal>");}
0{D}+{IS}?		           {printf("<literal entera base octal>");}
{D}+{IS}?		             {printf("<literal entera base decimal>");}
L?'(\\.|[^\\'])+'	       {printf("<literal caracter>");}

{D}+{E}{FS}?		         {printf("<literal numerica exponencial>");}
{D}*"."{D}+({E})?{FS}?	 {printf("<literal numerica real>");}
{D}+"."{D}*({E})?{FS}?	 {printf("<literal numerica real exponencial>");}

L?\"(\\.|[^\\"])*\"	     { printf("<Literal cadena>"); }

"..."			               {printf("<Numero variable de parametros>");}
">>="			               {printf("<asignación y desplazamiento derecha>");}
"<<="			               {printf("<asignación y desplazamiento izquierda>");}
"+="			               {printf("<asignación y suma>");}
"-="			               {printf("<asignación y resta>");}
"*="			               {printf("<asignación y multiplicacion>");}
"/="			               {printf("<asignación y division>");}
"%="			               {printf("<asignación y modulo>");}
"&="			               {printf("<asignación AND bit a bit>");}
"^="			               {printf("<asignación XOR bit a bit>");}
"|="			               {printf("<asignacion OR bit a bit>");}
">>"			               {printf("<desplazamiento derecha>");}
"<<"			               {printf("<desplazamiento izquierda>");}
"++"			               {printf("<operador de incremento>");}
"--"			               {printf("<operador de decremento>");}
"->"			               {printf("<operador de indireccion o asignacion>");}
"&&"			               {printf("<AND logico>");}
"||"			               {printf("<OR logico>");}
"<="			               {printf("<operador menor o igual que>");}
">="			               {printf("<operador mayor o igual que>");}
"=="			               {printf("<operador igual>");}
"!="			               {printf("<operador no igual>");}
";"		                 	 {printf("<final de sentencia>");}
("{"|"<%")		           {printf("<inicio del bloque de codigo>");}
("}"|"%>")		           {printf("<final del bloque de codigo>");}
","			                 {printf("<operador coma>");}
":"			                 {printf("<suma>");}
"="			                 {printf("<asignacion simple>");}
"("			                 {printf("<inicio del agrupador o de parametros de funciones>");}
")"			                 {printf("<final del agrupador o de parametros de funcione>");}
("["|"<:")		           {printf("<inicio del subindice del Array>");}
("]"|":>")		           {printf("<final del subindice del Array>");}
"."			                 {printf("<separador>");}
"&"			                 {printf("<AND bit a bit>");}
"!"			                 {printf("<operador not>");}
"~"			                 {printf("<Not logico>");}
"-"			                 {printf("<resta>");}
"+"			                 {printf("<suma>");}
"*"			                 {printf("<multiplicacion>");}
"/"			                 {printf("<division>");}
"%"			                 {printf("<modulo>");}
"<"			                 {printf("<operador menor que>");}
">"			                 {printf("<operador mayor que>");}
"^"			                 {printf("<XOR bit a bit>");}
"|"			                 {printf("<OR bit a bit>");}
"?"			                 {printf("<reemplazo if/else>");}
[ \t\v\n\f]		           {printf("<Salto de linea>"); }
.			                   { /* ignora cadena */ }

%%
