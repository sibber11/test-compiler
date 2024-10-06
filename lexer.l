%{
#include "ast.h"
#include "parser.tab.h"

char *p;
%}

%option yylineno

%%

[a-zA-Z_][a-zA-Z_0-9]*      { 
        yylval.id = (char *)calloc(strlen(yytext)+1,sizeof(char));
        strcpy(yylval.id,yytext);
        return IDENTIFIER; 
    }
print\(                     { return PRINT; }
\(                          { return LPAREN; }
\)                          { return RPAREN; }
[0-9]+                      { yylval.num = atoi(yytext); return NUMBER; }
"+"                         { return PLUS; }
"*"                         { return MULTIPLY; }
"="                         { return ASSIGN; }
[ \t\n]+                    { /* skip whitespace */ }
";"                         { /* skip whitespace */ }
","                         { /* skip whitespace */ }
.                           { printf("Unknown character: %s\n", yytext); }

%%
