DEFINT A-Z
CLS
n = 2000
nstep = n

DIM c$(1 TO n)

FOR i = 1 TO n
c$(i) = "C"
NEXT i

FOR i = 1 TO nstep
FOR j = i TO n STEP i
IF c$(j) = "C" THEN c$(j) = "O" ELSE c$(j) = "C"
NEXT j
NEXT i

FOR i = 1 TO n
IF c$(i) = "O" THEN PRINT i, c$(i)

'PRINT i, c$(i)
'SLEEP 1
NEXT i



