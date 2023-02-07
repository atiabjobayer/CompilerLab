 //Implementation of Lexical Analyzer using Lex tool
%{
    int COMMENT=0;
%}
identifier [a-zA-Z][a-zA-Z0-9]*
/*Starting character sequence for multiline comment*/
start \/\*
/*Ending character sequence for multiline comment*/
end  \*\/

%%
" "
"\n"
\/\/(.*) ;
{start}.*{end} ;

%%


int main(int argc, char **argv)
{
    FILE *file;
    file=fopen("input1.c","r");

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