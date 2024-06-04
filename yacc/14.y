%{
  #include <stdio.h>
  #include <stdlib.h> 
  extern int yylex(void);
  extern void yyerror(char *);  
%}

%token NUM
%left '+' '-'
%left '*' '/'
%right NEGATIVE

%%
S : E {printf("\n\n");}
  ; 
E :  E '+' E  {printf("+");}
  |  E '*' E {printf("*");}
  |  E '-' E {printf("-");}
  |  E '/' E {printf("/");}
  |  '(' E ')'
  |  '-' E %prec NEGATIVE {printf("-");}
  |  NUM  {printf("%d", yyval);}
  ;
%%

void yyerror(char *s) {
  fprintf(stderr, "%s\n", s); 
  return;
}

int main() {
  printf("Enter the infix expression\n"); 
  yyparse();
  return 0; 
}