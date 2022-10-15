DEFINT A-Z
RANDOMIZE TIMER
SCREEN 12
n = 500

DIM x(n), y(n), u(n)

FOR i = 1 TO n
x(i) = RND * 640
y(i) = RND * 480
u(i) = 0
PSET (x(i), y(i))
'SLEEP
NEXT i

 i = RND * n
DO
'i = RND * n

     sx(1) = 9999
     sy(1) = 9999
     sd(1) = 9999
     FOR j = 1 TO n
          IF j <> i AND u(j) <> 1 THEN
               testx = x(i) - x(j)
               testy = y(i) - y(j)
               testx = ABS(testx)
               testy = ABS(testy)
               xsq& = testx ^ 2
               ysq& = testy ^ 2
               zsq& = xsq& + ysq&
               testz = SQR(zsq&)
     IF testz < sd(1) THEN
          sd(1) = testz
          sx(1) = x(j)
          sy(1) = y(j)
          uu = j
     END IF
     'PSET (x(j), y(j))
     END IF
     NEXT j
u(uu) = 1
IF sx(1) <> 9999 THEN
COLOR 0
LINE (x(i), y(i))-(vx, vy)
COLOR RND * 15
LINE (x(i), y(i))-(sx(1), sy(1))
LINE (vx, vy)-(sx(1), sy(1))
vx = sx(1): vy = sy(1)
END IF

LOOP WHILE INKEY$ = ""


END


