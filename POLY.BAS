DEFINT A-Z
RANDOMIZE TIMER
SCREEN 12
n = 1000

DIM x(n), y(n)

FOR i = 1 TO n
x(i) = RND * 640
y(i) = RND * 480
PSET (x(i), y(i))
'SLEEP
NEXT i

FOR i = 1 TO n
    'FOR s = 1 TO 1
     sx(1) = 9999
     sy(1) = 9999
     sd(1) = 9999
    'NEXT s
'COLOR 1
'PSET (x(i), y(i))
'COLOR 7
     FOR j = 1 TO n
          IF j <> i THEN
               'COLOR 4
               'PSET (x(j), y(j))
               'COLOR 7
               testx = x(i) - x(j)
               testy = y(i) - y(j)
               testx = ABS(testx)
               testy = ABS(testy)
               xsq& = testx ^ 2
               ysq& = testy ^ 2
               zsq& = xsq& + ysq&
               testz = SQR(zsq&)
    ' FOR s = 1 TO 1
    'GOSUB debug
     IF testz < sd(1) THEN
          sd(1) = testz
          sx(1) = x(j)
          sy(1) = y(j)
     END IF
     'NEXT s
     PSET (x(j), y(j))
     END IF
     NEXT j
LINE (x(i), y(i))-(sx(1), sy(1))
NEXT i

END
debug:
LOCATE 1, 1
PRINT " i &  j", i, j
PRINT " x &  y", x(i), y(i)
PRINT "sx & sy", sx(1), sy(1)
PRINT " z & sd", testz, sd(1)
'SLEEP
RETURN


