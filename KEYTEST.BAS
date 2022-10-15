KEY 15, CHR$(20)
ON KEY(15) GOSUB tkey
KEY(15) ON
PRINT "press q to end."
DO
LOOP UNTIL INKEY$ = "q"
END
tkey:
PRINT "pressed t key"
RETURN

