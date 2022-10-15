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
'prunr1x = 1
'prunr1y = 1
'erunr1x = prunr1x
'erunr1y = prunr1y

esccount = 0
heart1$ = CHR$(3)
heart3$ = heart1$ + heart1$ + heart1$
heart5$ = heart3$ + heart1$ + heart1$
heart7$ = heart5$ + heart1$ + heart1$
heart9$ = heart5$ + heart3$ + heart1$
heart11$ = heart3$ + heart7$ + heart1$
heart13$ = heart3$ + heart3$ + heart7$


t$ = " Conan " + CHR$(3) + " Melanie " + CHR$(3)
tlen = LEN(t$)

c = RND * 15
top:

DO WHILE counter < 20000


COLOR 7, 7
'LOCATE erunr1x, erunr1y: PRINT " "
'LOCATE prunr1x, prunr1y: PRINT "x"
'erunr1x = prunr1x
'erunr1y = prunr1y

'IF prunr1y < 78 THEN
'prunr1y = prunr1y + 1
'END

'SLEEP 1
'mainloop:

'counter = counter + 1

'a = RND * 223 + 32
a = 175
r = RND * 2000
IF r < 1 THEN
d = c
c = RND * 15
'b = RND * 15
END IF

IF d = 0 AND r < 2 THEN
c = RND * 15
END IF

'b = RND * 15
 

x = RND * 68 + 1
y = RND * 21 + 2

'sum = x * y
sum = x
m = sum MOD tlen
m = m + 1
m$ = MID$(t$, m, 1)
x = x + 5

COLOR c, b
LOCATE y, x: PRINT m$;
IF d <> 0 THEN
IF x + 6 > 68 OR x - 6 < 6 OR y + 4 > 21 OR y - 4 < 3 GOTO noheart:

GOSUB heart
c = d
d = 0
b = 0
noheart:
END IF
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



heart:
LOCATE y - 4, x - 5: PRINT heart3$;
LOCATE y - 4, x + 3: PRINT heart3$;
LOCATE y - 3, x - 6: PRINT heart5$;
LOCATE y - 3, x: PRINT heart1$;
LOCATE y - 3, x + 2: PRINT heart5$;
LOCATE y - 2, x - 6: PRINT heart13$;
LOCATE y - 1, x - 5: PRINT heart11$;
LOCATE y, x - 4: PRINT heart9$;
LOCATE y + 1, x - 3: PRINT heart7$;
LOCATE y + 2, x - 2: PRINT heart5$;
LOCATE y + 3, x - 1: PRINT heart3$;
LOCATE y + 4, x: PRINT heart1$;
RETURN



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
IF esccount <> 1 THEN
GOSUB box
LOCATE 12, 30
PRINT "You can't quit yet!"
SLEEP 5
esccount = esccount + 1
RETURN
END IF

COLOR 7, 0
CLS
END

RETURN


