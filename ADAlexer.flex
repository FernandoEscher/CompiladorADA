%%

%class Lexer
%unicode
%int
%ignorecase
%cup
%line
%column

%{
    StringBuilder string = new StringBuilder();   
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}
   

letra = [a-zA-Z]
digito = [0-9]
saltolinea = ("\n" | "\r")*
espacio = ({saltolinea} | "\t" | "\f")+
char = "'"{letra}"'"
float = {digito}+"."{digito}+
id = {letra}({digito}|{letra}|"_")*
numero = {digito}+
comentario = "--"({letra}|{digito}|{espacio} | "~" | "!" | "¡" | "@" | "#" | "$" | "%" | "^" | "&" | "(" | ")" | "_" | "+" | "-" | "=" | "{" | "}" | "[" | "]" | "|" | "<" | ">" | "?" | "¿" | "`" | "," | "." | ";" | ":" | "/" | "\\" | "|" |"€")* "\n"

%state YYCADENA

%%

<YYINITIAL>{


"abort"			{return symbol(sym.ABORT);} 
"abs"  			{return symbol(sym.ABS);}
"abstract" 		{return symbol(sym.ABSTRACT);}
"accept"  		{return symbol(sym.ACCEPT);}
"access"  		{return symbol(sym.ACCESS);}
"aliased"  		{return symbol(sym.ALIASED);}
"all"  			{return symbol(sym.ALL);}
"and"  			{return symbol(sym.AND);}
"array"  		{return symbol(sym.ARRAY);}
"at"  			{return symbol(sym.AT);}
"begin"  		{return symbol(sym.BEGIN);}
"body"  		{return symbol(sym.BODY);}
"case"  		{return symbol(sym.CASE);}
"constant"  		{return symbol(sym.CONSTANT);}
"declare"  		{return symbol(sym.DECLARE);}
"delay"  		{return symbol(sym.DELAY);}
"delta"  		{return symbol(sym.DELTA);}
"digits"  		{return symbol(sym.DIGITS);}
"do"  			{return symbol(sym.DO);}
"else" 			{return symbol(sym.ELSE);}
"elsif"  		{return symbol(sym.ELSIF);}
"end"  			{return symbol(sym.END);}
"entry"  		{return symbol(sym.ENTRY);}
"exception"  		{return symbol(sym.EXCEPTION);}
"exit"    		{return symbol(sym.EXIT);}
"for"  			{return symbol(sym.FOR);}
"function"  		{return symbol(sym.FUNCTION);}
"generic"  		{return symbol(sym.GENERIC);}
"goto"    		{return symbol(sym.GOTO);}
"if"  			{return symbol(sym.IF);}
"in"  			{return symbol(sym.IN);}
"is"  			{return symbol(sym.IS);}
"limited"  		{return symbol(sym.LIMITED);}
"loop"  		{return symbol(sym.LOOP);}
"mod"  			{return symbol(sym.MOD);}
"new" 			{return symbol(sym.NEW);}
"not"  			{return symbol(sym.NOT);}
"null"    		{return symbol(sym.NULL);}
"of"  			{return symbol(sym.OF);}
"or"  			{return symbol(sym.OR);}
"others"  		{return symbol(sym.OTHERS);}
"out"  			{return symbol(sym.OUT);}
"package"  		{return symbol(sym.PACKAGE);}
"pragma"  		{return symbol(sym.PRAGMA);}
"private"  		{return symbol(sym.PRIVATE);}
"procedure"  		{return symbol(sym.PROCEDURE);}
"protected"  		{return symbol(sym.PROTECTED);}
"raise"  		{return symbol(sym.RAISE);}
"range"  		{return symbol(sym.RANGE);}
"record"  		{return symbol(sym.RECORD);}
"rem"  			{return symbol(sym.REM);}
"renames"  		{return symbol(sym.RENAMES);}
"requeue"  		{return symbol(sym.REQUEUE);}
"return" 		{return symbol(sym.RETURN);}
"reverse"  		{return symbol(sym.REVERSE);}
"select"  		{return symbol(sym.SELECT);}
"separate"  		{return symbol(sym.SEPARATE);}
"subtype" 		{return symbol(sym.SUBTYPE);}
"tagged"  		{return symbol(sym.TAGGED);}
"task"  		{return symbol(sym.TASK);}
"terminate"  		{return symbol(sym.TERMINATE);}
"then"  		{return symbol(sym.THEN);}
"type"  		{return symbol(sym.TYPE);}
"until"  		{return symbol(sym.UNTIL);}
"use" 			{return symbol(sym.USE);}
"when"  		{return symbol(sym.WHEN);}
"while"  		{return symbol(sym.WHILE);}
"with" 			{return symbol(sym.WITH);}
"xor"   		{return symbol(sym.XOR);}


"&" 			{return symbol(sym.CONCATENAR);}
"'" 			{return symbol(sym.TIC);}
"(" 			{return symbol(sym.PAR_DER);}
")" 			{return symbol(sym.PAR_IZQ);}
"*" 			{return symbol(sym.MULTIPLICACION);}
"+" 			{return symbol(sym.MAS);}
"," 			{return symbol(sym.COMA);}
"–" 			{return symbol(sym.MENOS);}
"." 			{return symbol(sym.PUNTO);}
"/" 			{return symbol(sym.DIVISION);}
":" 			{return symbol(sym.DOS_PUNTOS);}
";" 			{return symbol(sym.PUNTO_Y_COMA);}
"<" 			{return symbol(sym.MENOR_QUE);}
"=" 			{return symbol(sym.IGUAL);}
">" 			{return symbol(sym.MAYOR_QUE);}
"|"			{return symbol(sym.BARRA_VERTICAL);}
"=>" 			{return symbol(sym.FLECHA);}
".." 			{return symbol(sym.RANGO);}
"**" 			{return symbol(sym.EXPONENTE);}
":=" 			{return symbol(sym.ASIGNACION);}
"/=" 			{return symbol(sym.DISTINTO_DE);}
">=" 			{return symbol(sym.MAYOR_IGUAL_QUE);}
"<=" 			{return symbol(sym.MENOR_IGUAL_QUE);}
"<<" 			{return symbol(sym.ETIQUETA_DER);}
">>" 			{return symbol(sym.ETIQUETA_IZQ);}
"<>"			{return symbol(sym.INDEFINIDO);}

\"			{yybegin(YYCADENA); string.setLength(0);}

	
{numero}		{return symbol(sym.ENTERO_LITERAL, new Integer(Integer.parseInt(yytext())));}
{char}			{return symbol(sym.CARACTER_LITERAL, new Character.parseChar(yytext()));}
{float}			{return symbol(sym.REAL_LITERAL, new Float(Float.parseFloat(yytext())));}
{id}			{return symbol(sym.IDENTIFICADOR, yytext());}
{espacio}		{}
{comentario}		{}
.			{System.out.println("Error lexico. El caracter "+yytext()+ " en la linea "+ yyline+ " y columna "+yycolumn+ "no es reconocido");}

}

<YYCADENA>{
\"			{yybegin(YYINITIAL); return symbol(sym.CADENA_LITERAL, string);}
.			{string.append(yytext());}
}


