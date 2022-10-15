DEFINT A-Z
CLS
RANDOMIZE TIMER
SCREEN 12
hue1 = 0
hue2 = 9

FOR x = 1 TO 640
FOR y = 1 TO 480
c = RND * 100
IF c > 50 THEN COLOR hue1 ELSE COLOR hue2
PSET (x, y)
NEXT y
hue2 = RND * 15
NEXT x

