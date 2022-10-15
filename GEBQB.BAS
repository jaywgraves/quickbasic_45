CLS
start = 1
finish = 1000


FOR i = start TO finish
x = i
check:
PRINT i, , x
IF x = 1 THEN GOTO found
z = x / 2
IF z = INT(z) THEN GOSUB even ELSE GOSUB odd
'SLEEP
GOTO check
found:
PRINT , i
NEXT i
END

even:
x = x / 2
RETURN

odd:
x = (3 * x) + 1
RETURN

