mycalc: lexical.o parser.o symtable.o
	cc -o mycalc lexical.o parser.o symtable.o -ll -ly
lexical.o: lex.yy.c
	cc -c lex.yy.c -o lexical.o
lex.yy.c: mycalc.l y.tab.h symtable.h
	lex mycalc.l
parser.o: y.tab.c symtable.h
	cc -c y.tab.c -o parser.o
y.tab.c y.tab.h: mycalc.y
	yacc -d mycalc.y
symtable.o: symtable.c symtable.h
	cc -c symtable.c -o symtable.o
