/*
 * Copyright 2020, Gerwin Klein, Régis Décamps, Steve Rowe
 * SPDX-License-Identifier: BSD-3-Clause
 */

/* this is the scanner example from the JLex website
   (with small modifications to make it more readable) */

%%

%public
%class lexical
%state COMMENT
%{
  private int comment_count = 0;
%}

%line
%column
%standalone
%unicode

ALPHA=[A-Za-z]
DIGIT=[0-9]
NEWLINE=\r|\n|\r\n
WHITE_SPACE_CHAR=[\ \t\b\012]
COMMENT_TEXT_multiple_line=([^*/]|[^*]"/"[^*]|[^/]"*"[^/]|"*"[^/]|"/"[^*] | "/*")+
COMMENT_TEXT_single_line=("//"| [^*/\n]|[^*\n]"/"[^*\n]|[^/\n]"*"[^/\n]|"*"[^/\n]|"/"[^*\n] | "/*" | "/" | "*")+
Ident = ({ALPHA}|_)({ALPHA}|{DIGIT}|_)*

%%


<YYINITIAL> {

/*Comment*/
"//"{COMMENT_TEXT_single_line}* { System.out.println("single Comment" +"  lineNumber: " + (yyline+1)); }
"/*" {COMMENT_TEXT_multiple_line}* "*/" { System.out.println("multi Comment" +"  lineNumber(start line): " + (yyline+1)); }


/*keywords*/
"switch" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"bool" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"begin" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"break" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"char" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"class" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"case" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"do" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"int" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"double" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"float" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"for" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"if" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"else" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"end" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"return" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"true" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"false" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"try" { System.out.println("keyword("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"void" { System.out.println("keyword: "+ yytext() +"  lineNumber:  " + (yyline+1)); }
"while" { System.out.println("keyword: "+ yytext() +"  lineNumber:  " + (yyline+1)); }


/*WHITE_SPASE & NEWLINE*/
{NEWLINE} { System.out.println("NEWLINE: " + "  lineNumber:  " + (yyline+2)); }
{WHITE_SPACE_CHAR}+ { System.out.println("whiteSpace("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }


/*Operator*/
"!=" { System.out.println("not equal ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"==" { System.out.println("equal ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"=" { System.out.println("Assignment Operator ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
">=" { System.out.println("greaterEqual ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"<=" { System.out.println("lessEqual ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"<" { System.out.println("less ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
">" { System.out.println("greater ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"++" { System.out.println("Increment ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"+" { System.out.println("Addition ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"--" { System.out.println("Decrement ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"-" { System.out.println("Subtraction ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"%" { System.out.println("Modulus ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"*" { System.out.println("Multiplication ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"/" { System.out.println("Division ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"." { System.out.println(" Member Access Operator ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }

/*Default language symbols*/
";" { System.out.println("Semicolon("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"[" { System.out.println("Right Beraket("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"]" { System.out.println("Left Beraket("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
"(" { System.out.println("Left Parenthesis("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
")" { System.out.println("Right Parenthesis("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }


/*identifiers*/
{Ident} { System.out.println("Identifier ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }


/*Digit*/
"+"{DIGIT}+ | "-"{DIGIT}+ | {DIGIT}+ { System.out.println("Integer Literal ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
("+" | "-" | "") {DIGIT}+"."{DIGIT}+ { System.out.println("Double Literal ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }
("+" | "-" | "") {DIGIT}+"."{DIGIT}+f  { System.out.println("Float Literal ("+ yytext() +") - line " + (yyline+1)+", Column "+(yycolumn+1)); }

}


. {
  System.out.println("Illegal character: ("+yytext()+") - line " + (yyline+1) + ", Column "+(yycolumn+1));
	Utility.error(Utility.E_UNMATCHED);
}