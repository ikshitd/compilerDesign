%{
  #include <stdio.h> 
%}

%%
^[a-zA-Z_][a-zA-Z0-9_]*$ printf("valid identifier, %s\n", yytext); 
^[^a-zA-Z_][a-zA-Z0-9_]* printf("Invalid identifier, %s\n", yytext); 
%%

int main() {
  printf("Enter the input: "); 
  yylex(); 
  
  return 0; 
}
