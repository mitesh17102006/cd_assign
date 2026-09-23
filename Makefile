TARGET = bcs24

all: $(TARGET)

$(TARGET): lex.yy.c parser.tab.c
	gcc -Wall -std=gnu99 lex.yy.c parser.tab.c -o $(TARGET)

lex.yy.c: lexer.l parser.tab.h
	flex lexer.l

parser.tab.c parser.tab.h: parser.y
	bison -d parser.y

clean:
	rm -f $(TARGET) lex.yy.c parser.tab.c parser.tab.h