%{
#include "ast.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void yyerror(const char *msg);
extern int yylex();
extern char *p;
extern int yylineno;

%}

%union {
    Expression* exp;
    double num;
    char *id;
}

%token PLUS MULTIPLY ASSIGN LPAREN RPAREN 
%token <id> IDENTIFIER
%token <num> NUMBER PRINT
%type <exp> factor
%type <exp> term
%type <exp> stmt
%type <exp> expr
%type <exp> args
%locations



%%

program:
        stmts
    ;

stmts:
        stmts stmt           // Multiple statements
    |   stmt                 // Single statement
    ;

stmt:
        print
    |
        IDENTIFIER ASSIGN expr {
            $$ = new AssignExpression($1, $3);
        }
    ;

expr:
        term{
            // printf("t\n");
        }
    |   expr PLUS term {
            printf("e + t\n");
        }
    ;

print: PRINT args RPAREN {
    $$ = new PrintExpression($2);
}

args: /* empty */
    |
        expr
    |   expr ',' expr;

term:
        factor
    |   term MULTIPLY factor {
            $$ = new BinaryExpression('*', $1, $3);
        }
    ;

factor:
        IDENTIFIER{
            $$ = new IdentifierExpression($1);
        }
    |   NUMBER{
        $$ = new ConstExpression($1);
    }
    ;

%%

void yyerror(const char *str)
{
    fprintf(stderr,"Error | Line: %d\n%s\n",yylineno,str);
}

int main() {
    int exprs = yyparse();
    return 0;
}
