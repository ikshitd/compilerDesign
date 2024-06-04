%{
  #include <stdio.h>
%}

%s A B C F

%%
<INITIAL>a BEGIN B;
<INITIAL>b BEGIN A;
<INITIAL>[^ab\n] BEGIN F;
<INITIAL>[\n] BEGIN INITIAL; printf("Accepted\n"); 

<A>a BEGIN C;
<A>b BEGIN INITIAL;
<A>[^ab\n] BEGIN F;
<A>[\n] BEGIN INITIAL; printf("Not Accepted\n"); 

<B>a BEGIN INITIAL;
<B>b BEGIN C;
<B>[^ab\n] BEGIN F;
<B>[\n] BEGIN INITIAL; printf("Not Accepted\n"); 

<C>a BEGIN A;
<C>b BEGIN B;
<C>[^ab\n] BEGIN F;
<C>[\n] BEGIN INITIAL; printf("Not Accepted\n"); 

<F>[^ab\n] BEGIN F; 
<F>[\n] BEGIN INITIAL; printf("Invalid Input\n"); 
%%

int main() {
  printf("Enter the input string over the characters {a, b}\n"); 
  yylex(); 
  return 0; 
}