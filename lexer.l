%{
#include "parser.tab.h"
#include <stdlib.h>
#include <string.h>
%}

%%

[ \t\n\r]+          { /* Skip whitespace */ }

"BcsMain"           { return BCSMAIN; }
"int"               { return INT; }
"bool"              { return BOOL; }
"if"                { return IF; }
"else"              { return ELSE; }
"while"             { return WHILE; }

"<"|">"|"<="|">="|"=="|"!=" { return RELOP; }

[a-zA-Z][a-zA-Z0-9]* { return ID; }
[0-9]+              { return NUM; }

.                   { return yytext[0]; }

%%

int yywrap(void) {
    return 1;
}