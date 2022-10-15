DEFINT A-Z
CLS
PRINT "Input String: "
'INPUT cinput$

'cinput$ = "abcdefghijklmnopqrstuvwxy"
cinput$ = "it was a joke; let it go; walk away from it; it never happened."
clen = LEN(cinput$)

PRINT : PRINT : PRINT
PRINT "the length of string you entered was: "; clen
PRINT : PRINT : PRINT
PRINT "Enter two numbers, that when multiplied, are equal or greater"
PRINT " than the length of the string."

bad:
INPUT "Input 1st Number: "; a
INPUT "Input 2nd Number: "; b

c = a * b
IF c >= clen GOTO ok ELSE GOTO bad

ok:



DIM c$(0 TO a, 0 TO b)


x = 1
y = 1
move = 1

xmax = a
ymax = b
xmin = 1
ymin = 2
ysav = xmax
xsav = ymax

top:


cpoint = cpoint + 1
IF cpoint <= clen THEN
char$ = MID$(cinput$, cpoint, 1)
ELSE
GOTO cprint
END IF


SELECT CASE move

CASE 1
IF x <= xmax THEN
GOSUB dprint
c$(x, y) = char$
x = x + 1
ELSE
x = x - 1
y = y + 1
move = 2
xmax = xmax - 1
GOSUB dprint
c$(x, y) = char$
y = y + 1
END IF
GOTO top:

CASE 2
IF y <= ymax THEN
GOSUB dprint
c$(x, y) = char$
y = y + 1
ELSE
y = y - 1
x = x - 1
move = 3
ymax = ymax - 1
GOSUB dprint
c$(x, y) = char$
x = x - 1
END IF
GOTO top:

CASE 3
IF x >= xmin THEN
GOSUB dprint
c$(x, y) = char$
x = x - 1
ELSE
x = x + 1
y = y - 1
move = 4
xmin = xmin + 1
GOSUB dprint
c$(x, y) = char$
y = y - 1
END IF
GOTO top:

CASE 4
IF y >= ymin THEN
GOSUB dprint
c$(x, y) = char$
y = y - 1
ELSE
y = y + 1
x = x + 1
move = 1
ymin = ymin + 1
GOSUB dprint
c$(x, y) = char$
x = x + 1
END IF
GOTO top:

END SELECT


cprint:

CLS

FOR i = 1 TO ysav
FOR j = 1 TO xsav
'LOCATE j, i:  PRINT c$(j, i);
LOCATE j, i: PRINT c$(j, i)
NEXT j
NEXT i
END

dprint:
'SLEEP 2
'PRINT x, y, move, char$
RETURN

