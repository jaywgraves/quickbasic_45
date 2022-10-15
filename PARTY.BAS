' Party  V1.0  J. Graves
' 09/25/93
' Described in "The Magic Machine" by A.K. Dewdeny
' Chapter 14 - Programmed Parties  Page 151


DEFINT A-Z

CLS
RANDOMIZE TIMER

roomdepth = 23     'full screen = 23
roomwidth = 79     'full screen = 79
numberofguests = 8

DIM room$(roomdepth, roomwidth)
DIM ideal(numberofguests, numberofguests)
DIM guestrow(numberofguests), guestcol(numberofguests)


'Initialize
'Blank room$ array
FOR row = 1 TO roomdepth
FOR col = 1 TO roomwidth
room$(row, col) = " "
NEXT col
NEXT row

'Place Obstacles
FOR row = 1 TO roomdepth
room$(row, 1) = "*": room$(row, roomwidth) = "*"
NEXT row

FOR col = 1 TO roomwidth
room$(1, col) = "*": room$(roomdepth, col) = "*"
NEXT col

FOR row = 9 TO 11
FOR col = 10 TO 15
room$(row, col) = "@"
NEXT col
NEXT row

FOR row = 18 TO 21
FOR col = 60 TO 74
room$(row, col) = "@"
NEXT col
NEXT row

FOR row = 3 TO 6
FOR col = 50 TO 55
room$(row, col) = "@"
NEXT col
NEXT row

FOR row = 3 TO 21
FOR col = 30 TO 31
room$(row, col) = "@"
NEXT col
NEXT row

FOR row = 9 TO 11
FOR col = 10 TO 15
room$(row, col) = "@"
NEXT col
NEXT row

FOR row = 9 TO 11
FOR col = 10 TO 15
room$(row, col) = "@"
NEXT col
NEXT row

FOR row = 9 TO 11
FOR col = 10 TO 15
room$(row, col) = "@"
NEXT col
NEXT row

'Print Obstacles Loop
FOR row = 1 TO roomdepth
FOR col = 1 TO roomwidth
LOCATE row, col: PRINT room$(row, col);
NEXT col
NEXT row

'sLEEP
'sTOP

'Set ideal for all guests
FOR i = 1 TO numberofguests
FOR j = 1 TO numberofguests
READ x: ideal(i, j) = x
NEXT j
NEXT i

'Cuddle Data Set
'DATA 0,1,1,1,1,1,1,1
'DATA 1,0,1,1,1,1,1,1
'DATA 1,1,0,1,1,1,1,1
'DATA 1,1,1,0,1,1,1,1
'DATA 1,1,1,1,0,1,1,1
'DATA 1,1,1,1,1,0,1,1
'DATA 1,1,1,1,1,1,0,1
'DATA 1,1,1,1,1,1,1,0


'Avoidance Data Set
'DATA 0,90,90,90,90,90,90,90
'DATA 90,0,90,90,90,90,90,90
'DATA 90,90,0,90,90,90,90,90
'DATA 90,90,90,0,90,90,90,90
'DATA 90,90,90,90,0,90,90,90
'DATA 90,90,90,90,90,0,90,90
'DATA 90,90,90,90,90,90,0,90
'DATA 90,90,90,90,90,90,90,0

'Avoid but always move Data Set
'DATA 90,90,90,90,90,90,90,90
'DATA 90,90,90,90,90,90,90,90
'DATA 90,90,90,90,90,90,90,90
'DATA 90,90,90,90,90,90,90,90
'DATA 90,90,90,90,90,90,90,90
'DATA 90,90,90,90,90,90,90,90
'DATA 90,90,90,90,90,90,90,90
'DATA 90,90,90,90,90,90,90,90


'AKD's Data Set
DATA 0,15,7,2,6,9,4,12
DATA 8,0,6,4,6,3,2,10
DATA 11,4,0,5,12,2,9,6
DATA 6,9,3,0,10,7,13,5
DATA 3,10,5,14,0,11,7,15
DATA 12,2,4,8,5,0,12,4
DATA 7,8,14,10,4,13,0,3
DATA 6,7,13,6,3,8,9,0

'AKD's but always move data-set
'DATA 100,15,7,2,6,9,4,12
'DATA 8,100,6,4,6,3,2,10
'DATA 11,4,100,5,12,2,9,6
'DATA 6,9,3,100,10,7,13,5
'DATA 3,10,5,14,100,11,7,15
'DATA 12,2,4,8,5,100,12,4
'DATA 7,8,14,10,4,13,100,3
'DATA 6,7,13,6,3,8,9,100

'Place guests randomly
FOR i = 1 TO numberofguests
retry:
rowrnd = INT((roomdepth - 1 + 1) * RND + 1)
colrnd = INT((roomwidth - 1 + 1) * RND + 1)
'INT ((upperbound - lowerbound + 1)*RND + lowerbound)
IF room$(rowrnd, colrnd) <> " " GOTO retry
guestrow(i) = rowrnd
guestcol(i) = colrnd
room$(rowrnd, colrnd) = CHR$(i + 64)
NEXT i


' Main Loop
DO

FOR current = 1 TO numberofguests

room$(guestrow(current), guestcol(current)) = " "
LOCATE guestrow(current), guestcol(current): PRINT " "

save = 32000

FOR dx = -1 TO 1
FOR dy = -1 TO 1

grw = guestrow(current) + dx
gcw = guestcol(current) + dy

IF grw < 1 OR grw > roomdepth THEN GOTO skip
IF gcw < 1 OR gcw > roomwidth THEN GOTO skip

IF room$(grw, gcw) <> " " THEN GOTO skip

sum = 0

FOR other = 1 TO numberofguests

distancework = (grw - guestrow(other)) ^ 2 + (gcw - guestcol(other)) ^ 2
distance = SQR(distancework)
sum = sum + ABS(distance - ideal(current, other))

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

room$(guestrowsav, guestcolsav) = CHR$(current + 64)

COLOR current, 0
LOCATE guestrowsav, guestcolsav: PRINT CHR$(current + 64)

NEXT current

LOOP WHILE INKEY$ = ""

