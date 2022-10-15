' Party

DEFINT A-Z

SCREEN 12
RANDOMIZE TIMER
REM $DYNAMIC        
roomdepth = 181
roomwidth = 181
numberofguests = 8

DIM room(roomdepth, roomwidth)
DIM ideal(numberofguests, numberofguests)
DIM guestrow(numberofguests), guestcol(numberofguests)


'Initialize
'Blank room array
FOR row = 1 TO roomdepth
FOR col = 1 TO roomwidth
room(row, col) = 0
NEXT col
NEXT row
'Place Obstacles
FOR row = 1 TO roomdepth
room(row, 1) = 9: room(row, roomwidth) = 9
NEXT row
FOR col = 1 TO roomwidth
room(1, col) = 9: room(roomdepth, col) = 9
NEXT col
FOR row = 9 TO 11
FOR col = 10 TO 15
room(row, col) = 9
NEXT col
NEXT row
'Print Obstacles Loop
FOR row = 1 TO roomdepth
FOR col = 1 TO roomwidth
COLOR room(row, col): PSET (row, col)
NEXT col
NEXT row



'Set ideal for all guests
FOR i = 1 TO numberofguests
FOR j = 1 TO numberofguests
READ x: ideal(i, j) = x
NEXT j
NEXT i
'DATA 0,50,50,50,50,50,50,50
DATA 0,15,7,2,6,9,4,12,1
DATA 8,0,6,4,6,3,2,10,1
DATA 11,4,0,5,12,2,9,6,1
DATA 6,9,3,0,10,7,13,5,5
DATA 3,10,5,14,0,11,7,15,5
DATA 12,2,4,8,5,0,12,4,1
DATA 7,8,14,10,4,13,0,3,5
DATA 6,7,13,6,3,8,9,0,5

'Place guests randomly
FOR i = 1 TO numberofguests
retry:
rowrnd = INT((roomdepth - 1 + 1) * RND + 1)
colrnd = INT((roomwidth - 1 + 1) * RND + 1)
'INT ((upperbound - lowerbound + 1)*RND + lowerbound)
IF room(rowrnd, colrnd) <> 0 GOTO retry
guestrow(i) = rowrnd
guestcol(i) = colrnd
room(rowrnd, colrnd) = i
NEXT i


' Main Loop
DO

'CLS
FOR current = 1 TO numberofguests

room(guestrow(current), guestcol(current)) = 0
COLOR 0: PSET (guestrow(current), guestcol(current))

save = 32000

FOR dx = -1 TO 1
FOR dy = -1 TO 1

grw = guestrow(current) + dx
gcw = guestcol(current) + dy
IF grw < 1 OR grw > roomdepth THEN GOTO skip
IF gcw < 1 OR gcw > roomwidth THEN GOTO skip

IF room(grw, gcw) <> 0 THEN GOTO skip

sum = 0
FOR other = 1 TO numberofguests
distancework# = (grw - guestrow(other)) ^ 2 + (gcw - guestcol(other)) ^ 2
distance# = SQR(distancework#)
sum = sum + ABS(distance# - ideal(current, other))
NEXT other
IF sum < save THEN
save = sum
guestrowsav = grw
guestcolsav = gcw
END IF
skip:
NEXT dy
NEXT dx

guestrow(current) = guestrowsav
guestcol(current) = guestcolsav
room(guestrowsav, guestcolsav) = current
COLOR current: PSET (guestrowsav, guestcolsav)

NEXT current

LOOP WHILE INKEY$ = ""

