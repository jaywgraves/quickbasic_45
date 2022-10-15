DEFINT A-Z
RANDOMIZE TIMER
SCREEN 12

n = 20
maxnbr = n
DIM maxnbr(n)
DIM x(n), y(n)

COLOR 15

FOR i = 1 TO n
x(i) = RND * 640
y(i) = RND * 480
'PSET (x(i), y(i))
PRINT x(i), y(i)
NEXT i
SLEEP: CLS

COLOR 15

offset = maxnbr / 2
DO WHILE offset > 0
limit = maxnbr - offset
DO
switch = 0
FOR i = 1 TO limit
IF x(i) > x(i + offset) THEN
SWAP x(i), x(i + offset)
SWAP y(i), y(i + offset)
switch = i
END IF
NEXT i
limit = switch - offset
LOOP WHILE switch > 0
offset = offset / 2
LOOP

FOR i = 1 TO n
PRINT x(i), y(i)
NEXT i
SLEEP: CLS

save = 0
FOR j = 1 TO n





offset = maxnbr / 2
DO WHILE offset > 0
limit = maxnbr - offset
DO
switch = 0
FOR i = 1 TO limit
IF y(i) > y(i + offset) THEN
SWAP x(i), x(i + offset)
SWAP y(i), y(i + offset)
switch = i
END IF
NEXT i
limit = switch - offset
LOOP WHILE switch > 0
offset = offset / 2
LOOP

'FOR i = 1 TO n
'PRINT x(i), y(i)
'NEXT i
'SLEEP: CLS

