%{
#include "parse.tab.h"
#include "ast.h"
%}

%%
[0-9]+ { yylval.node = new_number_node(atoi(yytext)); return NUMBER; }
[ \t]  ;
"$"    { return 0; }
\n     |
.      return yytext[0];
%%
