%{
int COMMENT=0;
%}
identifier [a-zA-Z][a-zA-Z0-9]*
%%
"/*" {COMMENT=1;}
\+ {if(!COMMENT)printf("+(plus)");}
\- {if(!COMMENT)printf("-(minus)");}
\* {if(!COMMENT)printf("*(multiply)");}
\/ {if(!COMMENT)printf("/(division)");}
\<= {if(!COMMENT)printf("<=(less than or equal to)");}
\>= {if(!COMMENT)printf(">=(greater than or equal to)");}
\< {if(!COMMENT)printf("<(less than)");}
\= {if(!COMMENT)printf("=(assign)");}
== {if(!COMMENT)printf("==(equals)");}
\> {if(!COMMENT)printf(">(greater than)");}

%%


int main(int argc, char **argv)
{
    FILE *file;
    file=fopen("input3.c","r");
    if(!file)
    {
        printf("could not open the file");
        exit(0);
    }
    yyin=file;
    yylex();
    printf("\n");
    return(0);
}
int yywrap()
{
    return(1);
}