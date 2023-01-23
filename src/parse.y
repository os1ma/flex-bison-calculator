%{
#include <stdio.h>
#include <string.h>

extern int yylex(void);
int yyerror(char *s);
%}

%union {
  int value;
}

%token <value> NUMBER
%left '-' '+'
%left '*' '/'
%nonassoc UMINUS

%type <value> expression

%%

statement_list: statement '\n'
              | statement_list statement '\n'
              ;

statement: expression          { printf("= %d\n", $1); }
         ;

expression : expression '+' expression { $$ = $1 + $3; }
           | expression '-' expression { $$ = $1 - $3; }
           | expression '*' NUMBER { $$ = $1 * $3; }
           | expression '/' expression {
              if ($3 == 0) {
                yyerror("divide by zero");
              } else {
                $$ = $1 / $3;
              }
           }
           | '-' expression %prec UMINUS { $$ = -$2; }
           | '(' expression ')'    { $$ = $2; }
           | NUMBER            { $$ = $1; }
           ;
%%
