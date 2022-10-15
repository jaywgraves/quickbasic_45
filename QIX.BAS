RANDOMIZE TIMER
SCREEN 12
DEFINT A-Z


x1 = INT(RND * 640)
x2 = INT(RND * 640)
y1 = INT(RND * 480)
y2 = INT(RND * 480)

dx1 = INT(RND * 6) + 3
dx2 = INT(RND * 6) + 3
dy1 = INT(RND * 6) + 3
dy2 = INT(RND * 6) + 3

xmin1 = dx1
xmin2 = dx2
ymin1 = dy1
ymin2 = dy2

xmax1 = 640 - dx1
xmax2 = 640 - dx2
ymax1 = 480 - dy1
ymax2 = 480 - dy2

x3 = x1
x4 = x2
y3 = y1
y4 = y2

dx3 = dx1
dx4 = dx2
dy3 = dy1
dy4 = dy2

maxcnt = 50
cnt = 0
thiscolor = 1
countdown = 25

top:

DO

mainloop:

IF x1 >= xmax1 OR x1 <= xmin1 THEN dx1 = -dx1: flag = 1
IF x2 >= xmax2 OR x2 <= xmin2 THEN dx2 = -dx2: flag = 1
IF y1 >= ymax1 OR y1 <= ymin1 THEN dy1 = -dy1: flag = 1
IF y2 >= ymax2 OR y2 <= ymin2 THEN dy2 = -dy2: flag = 1

IF x1 >= xmax1 OR x2 >= xmax2 THEN right = 1
IF x1 <= xmin1 OR x2 <= xmin2 THEN left = 1
IF y1 >= ymax1 OR y2 >= ymax2 THEN bottom = 1
IF y1 <= ymin1 OR y2 <= ymin2 THEN top = 1

x1 = x1 + dx1
x2 = x2 + dx2
y1 = y1 + dy1
y2 = y2 + dy2

IF top = 1 THEN LINE (0, 0)-(639, 0)
IF bottom = 1 THEN LINE (0, 479)-(639, 479)
IF left = 1 THEN LINE (0, 0)-(0, 479)
IF right = 1 THEN LINE (639, 0)-(639, 479)

top = 0
bottom = 0
left = 0
right = 0


LINE (x1, y1)-(x2, y2)

'PSET (x1, y1)
'PSET (x2, y2)

IF countdown THEN
  countdown = countdown - 1
  GOTO mainloop
END IF

IF x3 >= xmax1 OR x3 <= xmin1 THEN dx3 = -dx3
IF x4 >= xmax2 OR x4 <= xmin2 THEN dx4 = -dx4
IF y3 >= ymax1 OR y3 <= ymin1 THEN dy3 = -dy3
IF y4 >= ymax2 OR y4 <= ymin2 THEN dy4 = -dy4

x3 = x3 + dx3
x4 = x4 + dx4
y3 = y3 + dy3
y4 = y4 + dy4

COLOR 0

LINE (x3, y3)-(x4, y4)

'PSET (x3, y3)
'PSET (x4, y4)


'cnt = cnt + 1
'IF cnt = maxcnt THEN
'  cnt = 0
'  thiscolor = thiscolor + 1
' IF thiscolor = 15 THEN
'   thiscolor = 1
' END IF
'END IF

IF flag = 1 THEN
thiscolor = thiscolor + 1
  IF thiscolor = 15 THEN
  thiscolor = 1
  END IF
END IF
flag = 0

COLOR thiscolor

LOOP WHILE INKEY$ = ""

