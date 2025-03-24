%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>  // üstel hesaplama için
void yyerror(const char *s);
int yylex(void);
%}

%union {
    double dval;
}

%token <dval> NUMBER
%token PLUS MINUS TIMES DIVIDE EXP
%token LPAREN RPAREN

%type <dval> expr

%left PLUS MINUS
%left TIMES DIVIDE
%right EXP

%%

input:
      /* boş */
    | input line
    ;

line:
      '\n'
    | expr '\n' { printf("Sonuç: %f\n", $1); }
    | error '\n' { yyerror("Geçersiz ifade"); yyerrok; }
    ;

expr:
      expr PLUS expr   { $$ = $1 + $3; }
    | expr MINUS expr  { $$ = $1 - $3; }
    | expr TIMES expr  { $$ = $1 * $3; }
    | expr DIVIDE expr { 
                          if ($3 == 0.0) { 
                              yyerror("Sıfıra bölme hatası!"); 
                              $$ = 0.0; 
                          } else { 
                              $$ = $1 / $3; 
                          } 
                        }
    | expr EXP expr    { $$ = pow($1, $3); }
    | LPAREN expr RPAREN { $$ = $2; }
    | NUMBER            { $$ = $1; }
    ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Hata: %s\n", s);
}

int main(void) {
    printf("Bir ifade giriniz: ");
    return yyparse();
}
