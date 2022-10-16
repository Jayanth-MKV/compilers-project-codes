%{
    #include<iostream>

    using namespace std;
    void yyerror(const char *s);
    int yylex();
    extern FILE* yyin;

%}

%union{
	int ival;
	char * cval;
}

%start lines
%token NUMBER
%token  ID
%token END
%token RETURN

%token PRINT
%token INT
%token PRINTALL

%left '+' '-'
%left '*' '/'


%%

int: INT	{}

lines: program {	printf("Program is correct\n");	};
	| END


program: int ID'('')' '{' body RETURN NUMBER ';' '}'
;


body: local_decl_optional assign_stmt_list {}
	| assign_stmt_list	{}
;


assign_stmt_list: assign_stmt {}
	| assign_stmt assign_stmt_list {}
;


assign_stmt:	ID '=' ID ';' {}
		| ID '=' int_const ';'	{}
		| PRINT ID ';' {}
;
local_decl_optional:	vardecl local_decl_optional{}
		| vardecl	{}
;	

vardecl:	int ID ';' {};

digit:	NUMBER	{}
;

int_const:	'+'digits	{}
	|'-'digits	{}
	|digits	{}
;

digits:	digit digits	{}
	|digit	{}
;



%%


int main(int argc,char* argv[]){
yyin=fopen(argv[1],"r");
yyparse();
return 0;
}

void yyerror(const char * msg){
fprintf(stderr,"%s\n",msg);
}
