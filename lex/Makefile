all: liot.l
	lex liot.l
	gcc -o parser lex.yy.c
test: liot.l
	lex liot.l
	gcc -o parser lex.yy.c
	./parser < int.txt > out.txt
clean:
	rm parser lex.yy.c out.txt
