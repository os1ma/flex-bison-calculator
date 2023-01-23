%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "ast.h"

extern int yylex(void);
extern int lineno;
extern char *yytext;
void yyerror(char *s);
%}

%union{
  struct Node *node;
}

%token <node> NUMBER
%left '+' '-'
%left '*' '/'

%type <node> expression

%%

program: expression '\n' { program = $1; }
       ;

expression : expression '+' expression { $$ = new_expression_node($1, "+", $3); }
           | NUMBER                    { $$ = $1; }
           ;
%%

void yyerror(char *s) {
  fprintf(stderr, "%s at %s\n", s, yytext);
  exit(1);
}
