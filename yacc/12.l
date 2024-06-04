%{
  #include <stdio.h> 
  #include <stdlib.h> 
  #include "y.tab.h"
  extern int yylval;
%}

%option noyywrap

%%
[0-9]+ {yylval = atoi(yytext); return NUM;}
[*\-+\n] { return *yytext; }
. yyerror("invalid character"); 
%%
