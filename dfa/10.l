%{
  #include <stdio.h> 
%}

%s A B C D E F G H

%%
<INITIAL>b BEGIN INITIAL;
<INITIAL>a BEGIN A;
<INITIAL>[^ab\n] BEGIN H; 
<INITIAL>[\n] BEGIN INITIAL; printf("Not Accepted\n"); 

<A>b BEGIN F;
<A>a BEGIN B;
<A>[^ab\n] BEGIN H; 
<A>[\n] BEGIN INITIAL; printf("Not Accepted\n"); 

<B>b BEGIN E;
<B>a BEGIN C;
<B>[^ab\n] BEGIN H; 
<B>[\n] BEGIN INITIAL; printf("Not Accepted\n"); 

<C>b BEGIN E;
<C>a BEGIN C;
<C>[\n] BEGIN INITIAL; printf("Accepted\n"); 
<C>[^ab\n] BEGIN H; 

<D>b BEGIN INITIAL;
<D>a BEGIN A;
<D>[\n] BEGIN INITIAL; printf("Accepted\n"); 
<D>[^ab\n] BEGIN H; 

<E>b BEGIN D;
<E>a BEGIN G;
<E>[\n] BEGIN INITIAL; printf("Accepted\n"); 
<E>[^ab\n] BEGIN H; 

<F>b BEGIN D;
<F>a BEGIN G;
<F>[\n] BEGIN INITIAL; printf("Not Accepted\n"); 
<F>[^ab\n] BEGIN H; 

<G>b BEGIN F;
<G>a BEGIN B;
<G>[^ab\n] BEGIN H; 
<G>[\n] BEGIN INITIAL; printf("Accepted\n"); 

<H>[^ab\n] BEGIN H;  
<H>[\n] BEGIN INITIAL; printf("Invalid Input\n"); 
%%

int main() {
  printf("Enter the string over the input {a, b}\n"); 
  yylex(); 
  return 0;
}