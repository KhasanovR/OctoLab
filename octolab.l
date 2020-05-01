%{
#include <stdio.h>
#include <string.h>
#include "parser.tab.h"
%}
%option noyywrap
start "{"
end "}"
if "if"
then "then"
else "else"
while "while"
do "do"
print "print"
input "input"

digit [0-9]
alpha [a-zA-Z]

identifier [a-zA-Z_][a-zA-Z0-9_]*
value [0-9]*\.?[0-9]+ 

comment %.*\n
whitespace [ \t\n]
plus "+"
minus "-"
slash "/"
star "*"
lessEqual <=
greatEqual >=
less <
great >
equal ==
not !
notEqual !=
and "&&"
or "||"
endLine ;
assignment =
openParen "("
closeParen ")"
undefined .
%%
{comment}
{whitespace}
{plus} return 102;
{minus} return 103;
{slash} return 104;
{star} return 105;
{less} return 106;
{great} return 107;
{lessEqual} return 108;
{greatEqual} return 109;
{equal} return 110;
{notEqual} return 111;
{and} return 112;
{or} return 113;
{not} return 114;
{endLine} return 115;
{assignment} return 116;
{openParen} return 117;
{closeParen} return 118;
{start} return 119;
{end} return 120;
{if} return 121;
{then} return 122;
{else} return 123;
{while} return 124;
{do} return 125;
{print} return 126;
{input} return 127;
{identifier} {strcpy(yylval.str,yytext);return 100;}
{value} {yylval.val =atof(yytext);return 101;}
{undefined} printf("Error: character not defined\n"); return 0;
%%

