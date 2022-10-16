%{

	#include<iostream>
	using namespace std;
	
	int count=0;
	int cnt_k=0;
%}

name [a-zA-Z][a-zA-Z0-9_]*

%%
[//].* {;}
"#include"|"# include" {cout<<"INCLUDE"<<endl;}
[<].*[>]		{;}
["].*["]                    {cout<<"string"<<endl;}
['].[']                     { ;}

auto|double|int|struct|break|else|long|switch|case|enum|register|typedef|char|extern|return|union|continue|for|signed|void|do|if|static|while|default|goto|sizeof|volatile|const|float|short   {	cout<<"Keyword"<<endl; cnt_k++;	}



[a-zA-Z][a-zA-Z0-9_]* { cout<<"Identifier"<<endl;
			count++;
		       }

[0-9]* {;}

[-+/*%=(){}|,;] {;}

[ \t\n] {}

.  {cout<<"Invalid"<<endl;}

%%

int main ( int argc,char *argv[] )
{
	if(argc==2)
		yyin=fopen(argv[1],"r");
	else
	{
		printf("\nEnter the input:\n");
		yyin=stdin;
	}
	yylex();
	cout<<"No of Keyboards : "<<cnt_k<<endl;
	cout<<"No of Identifiers : "<<count<<endl;
	return 0;
}
