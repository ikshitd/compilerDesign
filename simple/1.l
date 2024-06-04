%{
  #include <stdio.h> 
  int tabs = 0, lines = 0, chars = 0, spaces = 0; 
%}

%%
\n lines++; 
\t tabs++;
[ ] spaces++; 
. chars++;
%%

int yywrap() {
  return 1;
}

int main() {
  printf("Enter the input: \n"); 
  yylex(); 
  printf("Spaces: %d\n", spaces); 
  printf("tabs: %d\n", tabs); 
  printf("lines: %d\n", lines); 
  printf("chars: %d\n", chars); 
  return 0;
}