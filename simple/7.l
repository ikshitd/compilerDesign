%{
  #include <stdio.h> 
%}

%%
"//"([a-z]|[A-Z][0-9]|" ")*[\n] {
  fprintf(yyout, ""); 
}
"/*"([a-z]|[A-Z][0-9]|" "|\n)*"*/" {
  fprintf(yyout, ""); 
}
. fprintf(yyout, "%s", yytext); 
%%
int main() { 
  extern FILE *yyin, *yyout;
  yyin = fopen("input.c", "r"); 
  yyout = fopen("output.c", "w"); 
  yylex();
  return 0; 
}
