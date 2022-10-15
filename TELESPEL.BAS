' This program will give the telephone number for spelled out
' telephone numbers.  
' For example   DIAL 1-800-EAT-SHIT
'                    1-800-328-7448
' By J. Graves 03-09-92
'
DEFINT A-Z

SCREEN 0
CLS
COLOR 15, 10
PRINT "This program takes an acronym for a phone number and                            "
PRINT "prints the phone number associated by matching the letters                      "
PRINT "to the phone keypad.                                                            "
PRINT "                                                                                "
PRINT "                                                                                "
PRINT "For example   DIAL 1-800-EAT-SHIT                                               "
PRINT "                   1-800-328-7448                                               "


ON ERROR GOTO bottom
VIEW PRINT 10 TO 24

COLOR 7, 0

Top:

x = 0
PRINT
PRINT "Type 'Quit' to end program"
PRINT
INPUT "Word: ", word$
length = LEN(word$)

MoreLetters:
x = x + 1
IF x > length THEN GOTO Done

letter$ = MID$(word$, x, 1)

SELECT CASE letter$

CASE IS = "Q", IS = "q"
number = 1

CASE IS = "Z", IS = "z"
number = 1

CASE "A" TO "C", "a" TO "c"
number = 2

CASE "D" TO "F", "d" TO "f"
number = 3

CASE "G" TO "I", "g" TO "i"
number = 4

CASE "J" TO "L", "j" TO "l"
number = 5

CASE "M" TO "O", "m" TO "o"
number = 6

CASE "P" TO "S", "p" TO "s"
number = 7

CASE "T" TO "V", "t" TO "v"
number = 8

CASE "W" TO "Y", "w" TO "y"
number = 9

END SELECT

IF number = 1 THEN
   PRINT letter$, "Invalid"
 ELSE
   PRINT ; letter$, number
END IF
GOTO MoreLetters

Done:

' Wait 10 seconds or a key press
SLEEP 10

IF word$ = "quit" THEN GOTO bottom
IF word$ = "QUIT" THEN GOTO bottom
IF word$ = "Quit" THEN GOTO bottom



GOTO Top

bottom:
CLS
END

eoj:
CLS
END
RETURN


