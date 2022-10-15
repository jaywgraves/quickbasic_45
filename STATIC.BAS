DEFINT A-Z

RANDOMIZE TIMER
 
KEY 15, CHR$(0) + CHR$(1)
KEY 16, CHR$(32) + CHR$(1)
KEY 17, CHR$(64) + CHR$(1)

KEY(15) ON
KEY(16) ON
KEY(17) ON

ON KEY(15) GOSUB eoj
ON KEY(16) GOSUB eoj
ON KEY(17) GOSUB eoj

SCREEN 12
thiscolor = 7
n = 32000

DIM dx(1 TO n), dy(1 TO n), ex(1 TO n), ey(1 TO n)


top:

DO

mainloop:


'GOSUB newcolor

COLOR thiscolor

i = i + 1: IF i > n THEN i = 1

dx(i) = INT(RND * 640) + 1
dy(i) = INT(RND * 480) + 1
ex(i) = dx(i)
ey(i) = dy(i)


IF i = n / 100 THEN flag = 1

'LINE -(dx(i), dy(i))

GOSUB newcolor
PSET (dx(i) - 1, dy(i) - 1)
'GOSUB newcolor
PSET (dx(i), dy(i) - 1)
'GOSUB newcolor
PSET (dx(i) + 1, dy(i) - 1)
GOSUB newcolor
PSET (dx(i) - 1, dy(i))
'GOSUB newcolor
PSET (dx(i), dy(i))
'GOSUB newcolor
PSET (dx(i) + 1, dy(i))
GOSUB newcolor
PSET (dx(i) - 1, dy(i) + 1)
'GOSUB newcolor
PSET (dx(i), dy(i) + 1)
'GOSUB newcolor
PSET (dx(i) + 1, dy(i) + 1)

IF flag = 1 THEN
j = j + 1: IF j > n THEN j = 1
COLOR 0

'LINE -(ex(j), ey(j))
PSET (ex(j) - 1, ey(j) - 1)
PSET (ex(j), ey(j) - 1)
PSET (ex(j) + 1, ey(j) - 1)
PSET (ex(j) - 1, ey(j))
PSET (ex(j), ey(j))
PSET (ex(j) + 1, ey(j))
PSET (ex(j) - 1, ey(j) + 1)
PSET (ex(j), ey(j) + 1)
PSET (ex(j) + 1, ey(j) + 1)



END IF

COLOR thiscolor

LOOP WHILE i < n


GOSUB box
LOCATE 13, 36: PRINT "Wishing"
SLEEP 1
GOSUB box
LOCATE 13, 37: PRINT "Things"
SLEEP 1
GOSUB box
LOCATE 13, 38: PRINT "Away"
SLEEP 1
GOSUB box
LOCATE 13, 39: PRINT "Is"
SLEEP 1
GOSUB box
LOCATE 13, 39: PRINT "Not"
SLEEP 1
GOSUB box
LOCATE 13, 35: PRINT "Effective"
SLEEP 2
GOSUB box
GOTO top


box:
'LOCATE 12, 30: PRINT "                    "
LOCATE 13, 30: PRINT "                    "
'LOCATE 14, 30: PRINT "                    "
RETURN

newcolor:
thiscolor = RND * 15
COLOR thiscolor
RETURN

eoj:

CLS
END

RETURN


