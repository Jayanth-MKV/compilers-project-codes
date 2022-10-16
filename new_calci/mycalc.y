%{
#include<stdio.h>
#include "symtable.h"

extern int yylex();
extern void yyerror(char*);
int undef=0;
%}

%union{
	int ival;
	char* cval;
}

%start lines
%token <ival> NUMBER
%token <cval> ID
%token END
%token RESET
%token PRINT
%token PRINTALL
%left '+' '-'
%left '*' '/'
%type <ival> expr

%%


lines: line lines {}
     |END	{}
;

line: assignment '\n'
    	| print '\n'
	| reset '\n'
	| printall '\n'
	;

assignment: ID'='expr {	
			if(undef!=1)
			insert($1,$3);
			}

print: PRINT ID {	int pos=search($2);
                        
			if(pos!=-1)
				printf("%d\n",symtable[pos].value);
			else
				printf("UNDEF\n");			     
};

reset : RESET {reset();};

printall: PRINTALL {
	printf("\n__SYMBOLTABLE__\n");
	int i=0;
	for(i=0;i<currentPos;i++)
		printf("%s - %d\n",symtable[i].name,symtable[i].value);	
};

expr:   expr '+' expr    {
                                    $$ = $1 + $3;
                          }
        | expr '-' expr   {
                                  $$= $1-$3;
                          }
        | expr '*' expr    {
                                    $$ = $1*$3;
                           }
	| expr '/' expr    {
                                    $$ = $1/$3;
                           }
        | NUMBER           {
				$$=$1;
				}
	| ID		{ 
			int pos=search($1);
			if(pos!=-1)
				$$=symtable[pos].value;	
			
			else{ undef=1;  
                                //printf("UNDEF\n");
                        }
			}
	;

%%
int main()
{
 yyparse();
}


