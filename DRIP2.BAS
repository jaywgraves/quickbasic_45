DEFINT A-Z
CLS
RANDOMIZE TIMER
SCREEN 12
DIM y1(640), y2(640)

FOR x = 1 TO 640
y1(x) = 480
y2(x) = 0
NEXT x

top:
x = RND * 640
'COLOR x MOD 15
c = POINT(x, y1(x))
IF c = -1 THEN
COLOR RND * 15
ELSE
c = c + 7
COLOR c MOD 15
END IF
y1(x) = y1(x) - 1
y2(x) = y2(x) + 1
'COLOR y(x) MOD 15
PSET (x, y1(x))
PSET (x, y2(x))
GOTO top

