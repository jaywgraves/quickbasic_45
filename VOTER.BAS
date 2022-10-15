' Voter  V1.0  J. Graves
' 10/09/93
' Described in "The Armchair Universe" by A.K. Dewdeny
' Page 221-223


DEFINT A-Z

CLS
RANDOMIZE TIMER

wdepth = 22     'full screen = 23
wwidth = 79     'full screen = 79
fedcolor = 14
natcolor = 4
fedsym$ = "#"
natsym$ = "*"
tick = 0

DIM world$(wdepth, wwidth)


'Initialize
FOR row = 1 TO wdepth
FOR col = 1 TO wwidth
r = RND * 100
IF r > 50 THEN
world$(row, col) = fedsym$
fed = fed + 1
ELSE
world$(row, col) = natsym$
nat = nat + 1
END IF
NEXT col
NEXT row

FOR row = 1 TO wdepth
FOR col = 1 TO wwidth
IF world$(row, col) = fedsym$ THEN COLOR fedcolor ELSE COLOR natcolor
LOCATE row, col: PRINT world$(row, col);
NEXT col
NEXT row


' Main Loop

DO
tick# = tick# + 1
savfed = fed
savnat = nat

row = RND * 21 + 1
col = RND * 78 + 1
savrow = row
savcol = col
neighbor = RND * 8
old$ = world$(savrow, savcol)

SELECT CASE neighbor

CASE IS = 1
IF row = 1 THEN row = 23
IF col = 1 THEN col = 80
world$(savrow, savcol) = world$(row - 1, col - 1)

CASE IS = 2
IF col = 1 THEN col = 80
world$(savrow, savcol) = world$(row, col - 1)

CASE IS = 3
IF row = 22 THEN row = 0
IF col = 1 THEN col = 80
world$(savrow, savcol) = world$(row + 1, col - 1)

CASE IS = 4
IF row = 1 THEN row = 23
world$(savrow, savcol) = world$(row - 1, col)

CASE IS = 5
IF row = 22 THEN row = 0
world$(savrow, savcol) = world$(row + 1, col)

CASE IS = 6
IF row = 1 THEN row = 23
IF col = 79 THEN col = 0
world$(savrow, savcol) = world$(row - 1, col + 1)

CASE IS = 7
IF col = 79 THEN col = 0
world$(savrow, savcol) = world$(row, col + 1)

CASE IS = 8
IF row = 22 THEN row = 0
IF col = 79 THEN col = 0
world$(savrow, savcol) = world$(row + 1, col + 1)

END SELECT

IF world$(savrow, savcol) = fedsym$ THEN
COLOR fedcolor
        IF old$ <> world$(savrow, savcol) THEN
        fed = fed + 1
        nat = nat - 1
        END IF
ELSEIF world$(savrow, savcol) = natsym$ THEN
COLOR natcolor
        IF old$ <> world$(savrow, savcol) THEN
        nat = nat + 1
        fed = fed - 1
        END IF
END IF

LOCATE savrow, savcol: PRINT world$(savrow, savcol)
LOCATE 23, 1
COLOR fedcolor
PRINT "Fed ";
COLOR 7
PRINT fed;
COLOR natcolor
PRINT "Nat ";
COLOR 7
PRINT nat;
COLOR 15
PRINT "Tick ";
COLOR 7
PRINT tick#
IF fed = 1738 THEN GOTO bottom
IF nat = 1738 THEN GOTO bottom


LOOP WHILE INKEY$ = ""

bottom:

