/*program to rexognize and count the number of identifiers in a given input file*/
%{
	#include <stdio.h>
	int count=0;
	char ch;
%}

%%
"int "|"char "|"float "|"double " { while(1)
									{
										ch=input();
										if(ch==',')
											count++;
										else if(ch==';')
										{
											count++;
											break;
										}
									}
								}
.|\n ;
%%

int main(int argc,char *argv[])
{
	if(argc!=2)
	{
		printf("Invalid number of arguments!\n");
		return 1;
	}
	yyin=fopen(argv[1],"r");
	yylex();
	printf("Number of identifiers : %d\n",count);
	return 0;
}
