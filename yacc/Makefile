all: CS315f22_team03.lex CS315f22_team03.yacc
	lex CS315f22_team03.lex
	yacc CS315f22_team03.yacc
	gcc -o parser y.tab.c
test: CS315f22_team03.lex CS315f22_team03.yacc
	lex CS315f22_team03.lex
	yacc CS315f22_team03.yacc
	gcc -o parser y.tab.c
	./parser < CS315f22_team03.txt
clean:
	rm parser lex.yy.c y.tab.c
