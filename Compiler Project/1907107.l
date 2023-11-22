%{
	#include<stdio.h>
	#include<string.h>
	#include<stdlib.h>
	#include<math.h>
	#include "1907107.tab.h"
        extern int yylval; 
        
%}
variable         [a-zA-Z]
header	         "import ".*
Comment	         [#].*
CommentMulti     "##"[^##]*"##"
	
%%
"Main"	    {printf("\nMain Function Start\n"); 
                     return VOIDMAIN; }
[-+]?[0-9]+  	    {yylval = atoi(yytext); return NUM; }
[0-9]*"."[0-9]+     {yylval=atoi(yytext);return NUM;}
{variable}	    {ECHO;printf("\n"); 
                    yylval = *yytext - 'a'; return VAR; }
"(" 		    {return PST;  }
")"  		    {return PEN;  }
"{" 		    {return BST;  }
"}"  		    {return BEN;  }
[;]              {return SM;   }
\"[^\"\n]*\"   { yylval = strdup(yytext); return STRING_LITERAL; }
"INT"  	    {return INT;}
"FLOAT"           {return FLOAT;}
"CHAR"            {return CHAR;}
"array"		    {return ARRAY;}

"if" 	            {return IF;   }
"else" 		    {return ELSE; }
"elseif" 		    {return ELSEIF; }
"for_" 		    {return FOR;}
"while"             {return WHILE;}
"result"            {return CASE;}
"switch"	            {return SWITCH;}
"DEFAULT" 	    {return DEFAULT;}

"Display"           {return PRINTFUNCTION; } 
"+"	            {return PLUS;}
"-"	            {return MINUS; }
"*"	            {return MUL; }
"/"	            {return DIV; }
"%"	            {return MOD; }
"<"	            {return LT;  }
">"	            {return GT;}
"<="	            {return LE;}
">="	            {return GE;}
"return"                {return FNRETURN;}


"factorial_"	    {return FACTORIAL;}
"oddeven_"	    {return ODDEVEN;}
"prime"	            {return PRIME;}
"max"               {return MAX;}
"min"               {return MIN;}
"gcd"               {return GCD;}
"lcm"               {return LCM;}
"increment"         {return INC;}
"decrement"         {return DEC;}


"Def"	    {return FUNCTION;} 
"TRY"		    {return TRY;}
"CATCH"		    {return CATCH;}

{Comment}	    {printf("\nSingle line comment found :: ");ECHO;printf("\n");}
{CommentMulti}	    {printf("\nMultiple line comment found :: \n");ECHO;printf("\n");}
{header}            {printf("\nHeader file found :\n");
                    ECHO;printf("\n");}
[+-/*<>=,:^]      {yylval = yytext[0];	
                     return *yytext;}

[ ]*	    	    {}
[\n]*		    {}
[\t]*		    {}
.	            {printf("\nUnknown Syntax : %s\n",yytext);}


%%
