' Dominoes  v1.0  J.Graves
' 01-17-94

DEFINT A-Z

CLS

low = 7
high = 7

DIM domino(low, high)
DIM points!(low, high)


GOSUB init

INPUT "Enter Trump: "; trump
getlead:
INPUT "Enter Lead Player: "; lead
IF lead < 1 OR lead > 4 THEN GOTO getlead
index = lead


getdomino:
PRINT "Player "; index
INPUT "Low:"; low
INPUT "High:"; high

IF low < 0 OR low > 6 THEN PRINT "Error": GOTO getdomino
IF high < 0 OR high > 6 THEN PRINT "Error": GOTO getdomino
IF high < low THEN SWAP low, high

IF domino(low, high) <> 0 THEN PRINT "Error": GOTO getdomino ELSE

domino(low, high) = index
'savelow = CSRLIN
'savehigh = POS(0)
'indexstr$ = STR$(index)
'indexstr$ = RTRIM$(indexstr$)
'LOCATE low, high + 50: PRINT indexstr$;
'LOCATE savelow, savehigh
index = index + 1
IF index = 5 THEN index = 1
GOTO getdomino



init:
FOR low = 0 TO 6
FOR high = 0 TO 6

domino(low, high) = 0

IF low <= high THEN
points!(low, high) = .25
work = low + high
       
        IF work = 5 OR work = 10 THEN
        points!(low, high) = points!(low, high) + work
        PRINT low, high, points!(low, high)
        SLEEP 2
        END IF

END IF

NEXT high
NEXT low

RETURN

process:
FOR low = 0 TO 6
FOR high = 0 TO 6

IF low <= high THEN

END IF

NEXT high
NEXT low
RETURN

