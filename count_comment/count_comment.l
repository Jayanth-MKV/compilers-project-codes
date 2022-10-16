%{

        #include<iostream>
        using namespace std;
        int cnt=1;
        int count=0;
%}
%%


[/][/].*                {cout<<"comment in line : "<<cnt<<endl;count++;}
[ \t] {}
[\n] {cnt++;}
.  {;}

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

        cout<<"No of Comments : "<<count<<endl;
        return 0;
}
