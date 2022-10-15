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

CLS

top:

DO WHILE counter < 20000


'mainloop:

counter = counter + 1

a = RND * 223 + 32
r = RND * 200
IF r < 5 THEN
c = RND * 15
END IF

'b = RND * 15
 

x = RND * 78 + 1
y = RND * 22 + 1

COLOR c, b
LOCATE y, x: PRINT CHR$(a)

c = 7

LOOP


GOSUB box
LOCATE 12, 36: PRINT "Wishing"
SLEEP 1
GOSUB box
LOCATE 12, 37: PRINT "Things"
SLEEP 1
GOSUB box
LOCATE 12, 38: PRINT "Away"
SLEEP 1
GOSUB box
LOCATE 12, 39: PRINT "Is"
SLEEP 1
GOSUB box
LOCATE 12, 39: PRINT "Not"
SLEEP 1
GOSUB box
LOCATE 12, 35: PRINT "Effective"
SLEEP 2
GOSUB box
counter = 0
GOTO top


box:
LOCATE 11, 30: PRINT "                    "
LOCATE 12, 30: PRINT "                    "
LOCATE 13, 30: PRINT "                    "
RETURN

newcolor:
thiscolor = RND * 15
COLOR thiscolor
RETURN

eoj:
COLOR , 0
CLS
END

RETURN


