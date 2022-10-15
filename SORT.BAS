DEFINT A-Z
RANDOMIZE TIMER

CLS
maxnbr = 10000
DIM nbr(maxnbr)

FOR i = 1 TO maxnbr
nbr(i) = RND * 10000
PRINT nbr(i)
NEXT i
'SLEEP

offset = maxnbr / 2
DO WHILE offset > 0
PRINT "offset", offset
limit = maxnbr - offset
DO
switch = 0
FOR i = 1 TO limit
IF nbr(i) > nbr(i + offset) THEN
SWAP nbr(i), nbr(i + offset)
switch = i
END IF
NEXT i
limit = switch - offset
LOOP WHILE switch > 0
offset = offset / 2
LOOP

CLS

FOR i = 1 TO maxnbr
PRINT nbr(i)
NEXT i




