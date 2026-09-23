%{
#include <stdio.h>
#include <stdlib.h>

// Declare functions and variables from lexer
int yylex();
void yyerror(const char *s);
extern FILE *yyin;
extern int yylineno; // Optional, if you track lines
%}

/* Define tokens here later */
%token BCSMAIN INT BOOL IF ELSE WHILE ID NUM RELOP

%%

/* --- GRAMMAR RULES GO HERE --- */
program: BCSMAIN '{' declist stmtlist '}' {
    // If it successfully reaches here, parsing is complete
    printf("Parsing Successful\n");
    exit(0);
}
;

declist: 
    /* empty or declarations */
    | declist decl
;

decl:
    type ID ';'
;

type:
    INT | BOOL
;

stmtlist:
    /* empty or statements */
    | stmtlist stmt
;

stmt:
    ID '=' expr ';'
    | IF '(' expr ')' '{' stmtlist '}' ELSE '{' stmtlist '}'
    | WHILE '(' expr ')' '{' stmtlist '}'
;

expr:
    expr RELOP expr
    | expr '+' term
    | term
;

term:
    term '*' factor
    | factor
;

factor:
    ID
    | NUM
;

%%

/* --- C CODE SECTION (Including main) --- */
void yyerror(const char *s) {
    // This gets called automatically when a syntax error occurs
    printf("Syntax Error\n");
    exit(0);
}

int main(int argc, char *argv[]) {
    if (argc < 2) {
        fprintf(stderr, "Usage: %s <source_file>\n", argv[0]);
        return 1;
    }

    // Open the input file provided via command line argument
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Could not open file");
        return 1;
    }

    // Point Flex to read from this file instead of standard input
    yyin = file;

    // Start parsing
    yyparse();

    // Close the file
    fclose(file);
    return 0;
}