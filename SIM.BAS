DECLARE SUB Scan ()
'
'                                       
' Synthetic Organism Simulation   V1.0  
'
'
DEFINT A-Z
DECLARE SUB Movement (MoveWhere, x1, y1, x2, y2)
DECLARE SUB Initialize (Simnumber, StartEnergy)
COMMON SHARED i
RANDOMIZE TIMER
CONST Sim = 15, Food = 2, Poison = 5
CLS 0
SCREEN 12
VIEW (20, 90)-(620, 390), , 1

Simnumber = 1
StartEnergy = 1000
DIM SHARED Energy(Simnumber), XPos(Simnumber), YPos(Simnumber)
DIM SHARED Age(Simnumber), Distance(Simnumber)
DIM SHARED XFoodGoal(Simnumber), YFoodGoal(Simnumber)
DIM SHARED ScanTop(Simnumber), ScanBottom(Simnumber)
DIM SHARED ScanLeft(Simnumber), ScanRight(Simnumber)
DIM SHARED MoveTo1(Simnumber), MoveTo2(Simnumber), MoveTo3(Simnumber)
DIM SHARED Moveto4(Simnumber), MoveTo5(Simnumber), MoveTo6(Simnumber)
DIM SHARED Moveto7(Simnumber), MoveTo8(Simnumber), Moveto9(Simnumber)

'Place food on screen
FOR i = 1 TO 500
x = RND * 598 + 1
y = RND * 298 + 1
PSET (x, y), Food
NEXT i

'Place Poison on screen
FOR i = 1 TO 100
x = RND * 598 + 1
y = RND * 298 + 1
PSET (x, y), Poison
NEXT i


Initialize Simnumber, StartEnergy

TheTop:

FOR i = 1 TO Simnumber
IF Energy(i) <= 0 THEN GOTO Die
Scan
'IF XFoodGoal = 9999 AND YFoodGoal = 9999 THEN

RandomNum = RND * 100
x1 = XPos(i)
y1 = YPos(i)

SELECT CASE RandomNum

'Move to Position 1
CASE 0 TO MoveTo1(i)
x2 = x1 - 1
y2 = y1 - 1
Movement MoveWhere, x1, y1, x2, y2

'Move to Position 2
CASE MoveTo1(i) + 1 TO MoveTo2(i)
x2 = x1
y2 = y1 - 1
Movement MoveWhere, x1, y1, x2, y2

'Move to Position 3
CASE MoveTo2(i) + 1 TO MoveTo3(i)
x2 = x1 + 1
y2 = y1 - 1
Movement MoveWhere, x1, y1, x2, y2

'Move to Position 4
CASE MoveTo3(i) + 1 TO Moveto4(i)
x2 = x1 - 1
y2 = y1
Movement MoveWhere, x1, y1, x2, y2

'Move to Position 5
CASE Moveto4(i) + 1 TO MoveTo5(i)
x2 = x1 + 1
y2 = y1
Movement MoveWhere, x1, y1, x2, y2

'Move to Position 6
CASE MoveTo5(i) + 1 TO MoveTo6(i)
x2 = x1 - 1
y2 = y1 + 1
Movement MoveWhere, x1, y1, x2, y2

'Move to Position 7
CASE MoveTo6(i) + 1 TO Moveto7(i)
x2 = x1
y2 = y1 + 1
Movement MoveWhere, x1, y1, x2, y2

'Move to Position 8
CASE Moveto7(i) + 1 TO MoveTo8(i)
x2 = x1 + 1
y2 = y1 + 1
Movement MoveWhere, x1, y1, x2, y2

'Remain at current position
CASE MoveTo8(i) + 1 TO Moveto9(i)
x2 = x1
y2 = y1
Movement MoveWhere, x1, y1, x2, y2

'Self Destruct Gene --Too Harsh
CASE Moveto9(i) + 1 TO 100
x2 = x1
y2 = y1
'Energy(i) = Energy(i) - Energy(i)
Movement MoveWhere, x1, y1, x2, y2

END SELECT

Energy(i) = Energy(i) - 1
AllDead$ = "N"

GOTO NextSim

Die:

AllDead$ = "Y"

PRESET (XPos(i), YPos(i))

NextSim:
NEXT i
IF AllDead$ = "Y" THEN GOTO TheEnd
GOTO TheTop
TheEnd:

SUB Initialize (Simnumber, StartEnergy)

'Initialize Sims
FOR i = 1 TO Simnumber
x = RND * 600
y = RND * 300
PSET (x, y), Sim
XPos(i) = x
YPos(i) = y
Energy(i) = StartEnergy
Age(i) = 1
MoveTo1(i) = 11
MoveTo2(i) = 22
MoveTo3(i) = 33
Moveto4(i) = 44
MoveTo5(i) = 55
MoveTo6(i) = 66
Moveto7(i) = 77
MoveTo8(i) = 88
Moveto9(i) = 99
NEXT i

END SUB

SUB Movement (MoveWhere, x1, y1, x2, y2)
'LOCATE 1, 10, 0: PRINT x2
'LOCATE 2, 10, 0: PRINT r
'LOCATE 3, 10, 0: PRINT Energy(i)

' Check boundaries and recalculate
IF x2 > 600 THEN x2 = 1
IF y2 > 300 THEN y2 = 1
IF x2 < 1 THEN x2 = 600
IF y2 < 1 THEN y2 = 300

NewPosition = POINT(x2, y2)

IF NewPosition = Food THEN Energy(i) = Energy(i) + 100
IF NewPosition = Poison THEN Energy(i) = Energy(i) - 10

'Erase old Sim and Draw new Sim
PRESET (x1, y1)
PSET (x2, y2), Sim

XPos(i) = x2
YPos(i) = y2

END SUB

SUB Scan
ScanTop(i) = YPos(i) + Distance(i)
ScanBottom(i) = YPos(i) - Distance(i)
ScanLeft(i) = XPos(i) - Distance(i)
ScanRight(i) = XPos(i) + Distance(i)
ScanDim = ScanTop - ScanBottom + 1
ScanDim = ScanDim * 2
REDIM XPoison(ScanDim), YPoison(ScanDim)
FOR j = ScanTop TO ScanBottom
FOR k = ScanLeft TO ScanRight
ScanPoint = POINT(j, k)
'IF ScanPoint = Poison THEN
END SUB

