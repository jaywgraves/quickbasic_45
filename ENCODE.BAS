DEFINT A-Z
CLS
RANDOMIZE TIMER
SCREEN 12
hue1 = 0
hue2 = 2

redo:
s = RND * 50
FOR x = 1 TO 640 STEP s
GOSUB drawpts
NEXT x

s = RND * 50
FOR x = 640 TO 1 STEP -s
GOSUB drawpts
NEXT x
GOTO redo

drawpts:
t = RND * 10 + 1
't = 1
FOR y = 1 TO 480 STEP t
c = RND * 100
IF c > 50 THEN COLOR hue1 ELSE COLOR hue2
PSET (x, y)
hue2 = RND * 15
NEXT y
'hue2 = RND * 15
RETURN

