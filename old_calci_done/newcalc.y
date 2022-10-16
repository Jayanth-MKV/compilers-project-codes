%{
#include<stdio.h>
//#include "lex.yy.c"  

extern int yylex();
void yyerror(char*);
%}
%start stat
%token NUMBER
%%                   /* beginning of rules section */
stat:    expr '\n'        {
                           printf("%d\n",$1);
                          }
         ;

expr:   expr '+' term    {
                                    $$ = $1 + $3;
                          }
        | expr '-' term   {
                                  $$= $1-$3;
                          }
        | term            {
                                    $$ = $1;
                           }
         ;
term:   term '*' factor  {
                            $$ = $1 * $3;
                          }
        | term '/' factor   {
                                $$ = $1/$3;
                             }
        | factor           {
                              $$ = $1;
                            }
         ;

factor: NUMBER            {
                                $$ = $1;
                          }

%%
int main()
{
 yyparse();
}

void yyerror(char *s)
{
  fprintf(stderr, "error: %s\n", s);
}

