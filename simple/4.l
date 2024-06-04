%{
  #include <stdio.h>
%}

%%
[ ]?("int"|"float"|"double"|"if"|"else"|"for"|"while")[ ]? {
  printf("< Keyword, %s>\n", yytext); 
}
[ ]?("="|"*"|"+"|"-"|"/"|"=="|"<="|">="|"<"|">"|"++"|"--"|"("|")"|",")[ ]? {
  printf("< Operator, %s>\n", yytext);
}
[]?("}"|"{"|";")[ ]? {
  printf("< Seperator, %s>\n", yytext); 
}
[ ]?[0-9]+ printf("<integer, %s>\n", yytext); 
[ ]?[0-9]+.[0-9]+ printf("<float, %s>\n", yytext); 
[ ]?[a-zA-Z_]+[a-zA-Z_]*[ ]? {
  printf("< Identifier, %s>\n", yytext);
}
["][a-zA-Z0-9_\s\t]["] {
  printf("< Literal, %s>\n", yytext); 
}
%%

int main() {
  printf("Enter the input: \n"); 
  yylex();
  return 0; 
}