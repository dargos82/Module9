All: checkChar checkCharNoLogical checkGrade findMax
LIB=libFunctions.o
CC=gcc

checkChar: checkChar.o
	$(CC) $@.o -g -o $@

checkCharNoLogical: checkCharNoLogical.o
	$(CC) $@.o -g -o $@

checkGrade: checkGrade.o
	$(CC) $@.o -g -o $@

findMax: findMax.o $(LIB)
	$(CC) $@.o $(LIB) -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
