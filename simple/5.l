%{
  #include <stdio.h> 
   int lines = 0, chars = 0, spaces = 0; 
%}

%%
\n lines++; 
[ ] spaces++; 
. chars++;
%%

int yywrap() {
  return 1;
}

int main() {
  extern FILE *yyin, *yyout;
  yyin = fopen("input.txt", "r"); 
  yylex(); 
  printf("Spaces: %d\n", spaces); 
  printf("lines: %d\n", lines); 
  printf("chars: %d\n", chars); 
  return 0;
}