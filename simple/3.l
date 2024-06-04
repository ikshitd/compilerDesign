%{
  #include <stdio.h> 
%}

%%
^[0-9]+$ printf("%s, integer\n", yytext); 
^[0-9]+.[0-9]+$ printf("%s, floating value\n", yytext); 
^[0-9]+.[0-9]*.[0-9.]* printf("%s, invalid\n", yytext); 
%%

int main() {
  printf("Enter the input: \n"); 
  yylex(); 
  return 0; 
}