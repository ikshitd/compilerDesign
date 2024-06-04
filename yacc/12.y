%{
  #include <stdio.h> 
  #include <stdlib.h>
  extern int yylex(void);
  extern void  yyerror(char *); 
%}

%token NUM
%left '+' '-'
%left '*' '/'

%%
S : S E '\n' {$$ = $2; printf("Valid Expression\n Valid Output = %d\n", $$);}
  |
  ; 
E : E '+' E {$$ = $1 + $3;}
  | E '*' E {$$ = $1 * $3;}
  | E '/' E {$$ = $1 / $3;}
  | E '-' E {$$ = $1 - $3;}
  | NUM {$$ = $1;}
  ;
%%

void yyerror(char *s) {
  fprintf(stderr, "%s\n", s); 
  return; 
}

int main() {
  printf("Enter a valid arithemetic expression\n"); 
  yyparse(); 
  return 0; 
}