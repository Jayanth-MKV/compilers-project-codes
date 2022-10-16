%{
	#include "y.tab.h"
	#include <string.h>
%}
%%
printall {return PRINTALL;}
print {return PRINT;}
PRINT {return PRINT;}
end {return END;}
reset {return RESET;}
[a-zA-Z][a-zA-Z0-9_]* {
			yylval.cval=(char*)malloc(sizeof((char*)strlen(yytext)));
			strcpy(yylval.cval,yytext);
			return ID;}
[0-9]+  { yylval.ival=atoi(yytext); return NUMBER;}
[-+*/=]     { return yytext[0];}
\n      { return yytext[0];}
%%

