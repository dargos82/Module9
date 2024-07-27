All: checkChar checkCharNoLogical checkGrade
CC=gcc

checkChar: checkChar.o
	$(CC) $@.o -g -o $@

checkCharNoLogical: checkCharNoLogical.o
	$(CC) $@.o -g -o $@

checkGrade: checkGrade.o
	$(CC) $@.o -g -o $@

.s.o:
	$(CC) $(@:.o=.s) -g -c -o $@
