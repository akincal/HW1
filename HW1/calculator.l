%{
#include "y.tab.h"
#include <stdlib.h>
%}

%%

[0-9]+\.[0-9]*|[0-9]*\.[0-9]+  { yylval.dval = atof(yytext); return NUMBER; }
[0-9]+                        { yylval.dval = atof(yytext); return NUMBER; }
"**"                          { return EXP; }
"^"                           { return EXP; }
"+"                           { return PLUS; }
"-"                           { return MINUS; }
"*"                           { return TIMES; }
"/"                           { return DIVIDE; }
"("                           { return LPAREN; }
")"                           { return RPAREN; }
[ \t]+                       { /* boşluk ve tab karakterlerini yoksay */ }
\n                           { return '\n'; }
.                             { 
                                fprintf(stderr, "Bilinmeyen karakter: %s\n", yytext);
                              }
%%

int yywrap() {
    return 1;
}
