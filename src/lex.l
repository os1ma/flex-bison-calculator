%{
#include "parse.tab.h"
%}

%%
[0-9]+ { yylval.value = atoi(yytext); return NUMBER; }
[ \t]  ;
"$"    { return 0; }
\n     |
.      return yytext[0];
%%
