%{
int commentPresent = 0;
%}

%%

"main"|"if"|"else"|"while"|"do"|"break"|"continue"|"int"|"double"|"float"|"return"|"char"|"case"|"long"|"short"|"typedef"|"switch"|"unsigned"|"void"|"static"|"struct"|"goto"|"for" { printf("\n Keyword: %s ",yytext);}
"/*" {commentPresent = 1;}
"*/" {commentPresent = 0;}
[a-zA-Z][a-zA-Z0-9]*(\[[0-9]*\])? {if(!commentPresent) printf("\n Identifier: %s",yytext);}
\".*\" {if(!commentPresent) printf("\n String constant: %s",yytext);}
[0-9]+ {if(!commentPresent) printf("\n Number constant: %s",yytext);}
"<=" | ">="| "<" | "==" | "=" | "+" | "-" | "*" | "/" {if(!commentPresent) printf("\n Relational Operator: %s",yytext);}
";"|"}"|"{" {}
#.* {printf("\n Preprocessor Directive: %s",yytext);}

%%

int main()
{
yylex();
printf("\n\n");
return 0;
}

int yywrap()
{
return 0;
}