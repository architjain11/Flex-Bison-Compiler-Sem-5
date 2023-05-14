%{
#include <stdio.h>
int flag=0;
int yylex();
int yyerror();
%}
%token DO EQU SEP ID NUM END NEW STAT WS;
%%
S: DO WS ID EQU E1 SEP E1 SEP E1 NEW END WS DO {printf("Accepted!"); flag=1;}
E1: ID | NUM ;
%%
int main() {
yyparse();
return 1;
}
yyerror(const char *msg) {
if(flag==0) {
printf("%s",yytext);
printf(" Not Accepted\n");
}
}