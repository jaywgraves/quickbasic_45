DEFINT A-Z
DECLARE SUB NewColor (thiscolor)

COMMON SHARED background

RANDOMIZE TIMER

SCREEN 12
'ON KEY(1) GOSUB ChangeColor
'KEY(1) ON

'if polygon$ equal N then n must be even & >2
xmaxbox = 640
ymaxbox = 480
xmax = xmaxbox
ymax = ymaxbox
background = 0
polygon$ = "Y"
sound$ = "N"
border$ = "Y"
maxcnt = 0
cnt = 0
thiscolor = 1
countdown = 15
n = 4


LINE (0, 0)-(xmaxbox, ymaxbox), background, BF



'command$

DIM px(1 TO n), py(1 TO n), ex(1 TO n), ey(1 TO n)
DIM dpx(1 TO n), dpy(1 TO n), dex(1 TO n), dey(1 TO n)
DIM xmin(1 TO n), ymin(1 TO n), xmax(1 TO n), ymax(1 TO n)

FOR i = 1 TO n
px(i) = INT(RND * xmax) + 1
py(i) = INT(RND * ymax) + 1
ex(i) = px(i)
ey(i) = py(i)
NEXT i

FOR i = 1 TO n
dpx(i) = INT(RND * 6) + 3
coin = INT(RND * 2)
IF coin = 0 THEN dpx(i) = -dpx(i)
dex(i) = dpx(i)
dpy(i) = INT(RND * 6) + 3
coin = INT(RND * 2)
IF coin = 0 THEN dpy(i) = -dpy(i)
dey(i) = dpy(i)
NEXT i

FOR i = 1 TO n
xmax(i) = xmaxbox
ymax(i) = ymaxbox
xmin(i) = 0
ymin(i) = 0
NEXT i

DO

mainloop:
KEY(2) OFF

FOR i = 1 TO n
IF px(i) >= xmax(i) OR px(i) <= xmin(i) THEN dpx(i) = -dpx(i): flag = 1
IF py(i) >= ymax(i) OR py(i) <= ymin(i) THEN dpy(i) = -dpy(i): flag = 1
IF border$ = "Y" THEN
 IF px(i) >= xmax(i) THEN right = 1
 IF px(i) <= xmin(i) THEN left = 1
 IF py(i) >= ymax(i) THEN Bottom = 1
 IF py(i) <= ymin(i) THEN top = 1
END IF
NEXT i

FOR i = 1 TO n
px(i) = px(i) + dpx(i)
py(i) = py(i) + dpy(i)
NEXT i

IF border$ = "Y" THEN
 IF top = 1 THEN LINE (0, 0)-(639, 0)
 IF Bottom = 1 THEN LINE (0, 479)-(639, 479)
 IF left = 1 THEN LINE (0, 0)-(0, 479)
 IF right = 1 THEN LINE (639, 0)-(639, 479)
 top = 0
 Bottom = 0
 left = 0
 right = 0
END IF

IF sound$ = "Y" THEN
  IF flag THEN SOUND 500, 1
END IF

   

IF polygon$ = "Y" THEN
PSET (px(1), py(1))
FOR i = 2 TO n
LINE -(px(i), py(i))
NEXT i
LINE -(px(1), py(1))

ELSE

FOR i = 1 TO n STEP 2
LINE (px(i), py(i))-(px(i + 1), py(i + 1))
NEXT i

END IF

IF countdown THEN
  countdown = countdown - 1
  GOTO mainloop
END IF

FOR i = 1 TO n
IF ex(i) >= xmax(i) OR ex(i) <= xmin(i) THEN dex(i) = -dex(i)
IF ey(i) >= ymax(i) OR ey(i) <= ymin(i) THEN dey(i) = -dey(i)
NEXT i

FOR i = 1 TO n
ex(i) = ex(i) + dex(i)
ey(i) = ey(i) + dey(i)
NEXT i


COLOR background

IF polygon$ = "Y" THEN
PSET (ex(1), ey(1))
FOR i = 2 TO n
LINE -(ex(i), ey(i))
NEXT i
LINE -(ex(1), ey(1))

ELSE

FOR i = 1 TO n STEP 2
LINE (ex(i), ey(i))-(ex(i + 1), ey(i + 1))
NEXT i

END IF

'cnt = cnt + 1
'IF cnt = maxcnt THEN
'  cnt = 0
'  NewColor thiscolor
'END IF

IF flag = 1 THEN
NewColor thiscolor
END IF
flag = 0

COLOR thiscolor

LOOP WHILE INKEY$ = ""

GOTO Bottom

ChangeColor:
 NewColor thiscolor
RETURN

Bottom:

SUB NewColor (thiscolor)
thiscolor = thiscolor + 1
IF thiscolor = background THEN thiscolor = thiscolor + 1
IF thiscolor > 15 THEN thiscolor = 0

'LOCATE 1, 1: PRINT thiscolor
'SLEEP 2


END SUB

