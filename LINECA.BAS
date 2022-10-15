' Line CA
DEFINT A-Z

SCREEN 12
RANDOMIZE TIMER

genlimit = 480
population = 640

DATA 000,0
DATA 111,0
DATA 110,0
DATA 101,0
DATA 011,0
DATA 100,1
DATA 010,1
DATA 001,1

FOR j = 1 TO population
'IF RND * 100 > 50 THEN PSET (j, 1)
IF j = 320 THEN PSET (j, 1)
NEXT j

FOR i = 2 TO genlimit
FOR j = 1 TO population
GOSUB plot
NEXT j
'SLEEP
NEXT i

END
plot:

SELECT CASE j
CASE j = 1
a1 = 640: b1 = j: c1 = j + 1
CASE j = 640
a1 = j - 1: b1 = j: c1 = 1
CASE ELSE
a1 = j - 1: b1 = j: c1 = j + 1
END SELECT

a2 = POINT(a1, i - 1): IF a2 <> 0 THEN a2 = 1
b2 = POINT(b1, i - 1): IF b2 <> 0 THEN b2 = 1
c2 = POINT(c1, i - 1): IF c2 <> 0 THEN c2 = 1

pattern = (a2 * 100) + (b2 * 10) + c2

FOR k = 1 TO 8
READ match, plot
IF pattern = match THEN
     IF plot THEN PSET (j, i): k = 9: LOCATE 1, 1: PRINT j, i, match: SLEEP
END IF
NEXT k
RESTORE
RETURN

