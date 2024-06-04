%{
  #include <stdio.h> 
%}

%s A B C F

%%
<INITIAL>[0-9]+ BEGIN A; 
<INITIAL>[0-9]+.[0-9]+ BEGIN B; 
<INITIAL>[a-zA-Z_]+[a-zA-Z0-9_]* BEGIN C; 
<INITIAL>[^\n] BEGIN F; printf("Not Accepted\n");
<INITIAL>[\n] BEGIN INITIAL; printf("Not Accepted\n");
<A>[^\n] BEGIN F; 
<A>[\n] BEGIN INITIAL; printf("Integer\n");
<B>[^\n] BEGIN F; 
<B>[\n] BEGIN INITIAL; printf("floating point value\n");
<C>[^\n] BEGIN F; 
<C>[\n] BEGIN INITIAL; printf("Identifier\n");
<F>[^\n] BEGIN F; 
<F>[\n] BEGIN INITIAL; printf("Invalid Input\n");
%%

int main() {
  printf("Enter the input\n"); 
  yylex(); 
  return 0; 
}