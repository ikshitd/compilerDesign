%{
  #include <stdio.h> 
%}

%%
"<"[^>]*">" {
  fprintf(yyout, "%s", yytext); 
}
. ;  
%%
int main() { 
  extern FILE *yyin, *yyout;
  yyin = fopen("input.html", "r"); 
  yyout = fopen("output.html", "w"); 
  yylex();
  return 0; 
}
