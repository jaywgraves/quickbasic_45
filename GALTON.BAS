DEFINT A-Z
CLS
RANDOMIZE TIMER
SCREEN 12
DIM y(640)

FOR x = 1 TO 640
y(x) = 480
NEXT x

top:
x = 320
'COLOR x MOD 15
'COLOR RND * 15
FOR y = 1 TO 100
r = RND * 100
IF r > 50 THEN x = x + 1 'ELSE x = x - 1
NEXT y

y(x) = y(x) - 1
PSET (x, y(x))
GOTO top

