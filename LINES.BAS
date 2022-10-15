SCREEN 12
RANDOMIZE TIMER
DO
x = RND * 640
y = RND * 480
s = RND * 10
c = RND * 16
FOR i = 0 TO 480 STEP s
c = RND * 16
LINE (x, y)-(0, i), c
LINE (x, y)-(640, 480 - i), c
s = RND * 10
i = i + s
NEXT i
FOR i = 640 TO 0 STEP -s
c = RND * 16
LINE (x, y)-(i, 0), c
LINE (x, y)-(640 - i, 480), c
s = RND * 10
i = i - s
NEXT i
LOOP WHILE INKEY$ = ""




