%{
int COMMENT=0;
%}

identifier [a-zA-Z][a-zA-Z0-9]*

%%
#.* {printf("preprocessor");}
int |
float |
char |
double |
while |
for |
struct |
typedef |
do |
if |
break |
continue |
void |
switch |
return |
else |
goto {printf("keyword ");}
"/*" {COMMENT=1;}
{identifier}(\[[0-9]*\])? {if(!COMMENT) printf("identifier");}

[0-9]+ {if(!COMMENT) printf("number");}

%%

int main(int argc, char **argv)
{
    FILE *file;
    file=fopen("input2.c","r");
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