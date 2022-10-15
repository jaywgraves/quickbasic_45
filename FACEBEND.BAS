DEFINT A-Z
CLS

SCREEN 12

DIM feature$(39), NumberOfPoints(39)
DIM x(186), y(186)

k = 0
sz! = 1
xmin = 9999
ymin = 9999
xmax = 0
ymax = 0
       
'xoff = 250
'yoff = 0

'FOR xoff = 0 TO 250 STEP 250

'COLOR 7
k = 0
FOR i = 1 TO 39
READ feature$(i), NumberOfPoints(i)
'COLOR k MOD 15 + 1
FOR j = 1 TO NumberOfPoints(i)
k = k + 1
READ x(k), y(k)

IF x(k) < xmin THEN xmin = x(k)
IF y(k) < ymin THEN ymin = y(k)
IF x(k) > xmax THEN xmax = x(k)
IF y(k) > ymax THEN ymax = y(k)

IF j = 1 THEN PSET (x(k) * sz! + xoff, y(k) * sz! + yoff) ELSE
LINE -(x(k) * sz! + xoff, y(k) * sz! + yoff)
LOCATE 23, 1
PRINT "Max", xmax, ymax
LOCATE 24, 1
PRINT "Min", xmin, ymin
LOCATE 25, 1
PRINT feature$(i), x(k), y(k)
'SLEEP 1
NEXT j
NEXT i

'RESTORE
'NEXT xoff
'PRINT xmin, ymin

'Data for a "normal" face
DATA "left pupil",1
DATA 135,145
DATA "right pupil",1
DATA 190,145
DATA "left iris",5
DATA 134,141,128,144,133,149,140,144,135,141
DATA "right iris",5
DATA 190,141,184,144,189,149,196,144,190,141
DATA "bottom of left eyelid",3
DATA 119,147,133,140,147,146
DATA "bottom of right eyelid",3
DATA 177,147,190,141,203,147
DATA "bottom of left eye",3
DATA 121,147,133,150,147,146
DATA "bottom of right eye",3
DATA 177,147,191,150,201,148
DATA "top of left eye",3
DATA 118,143,132,137,148,142
DATA "top of right eye",3
DATA 176,143,191,137,204,134
DATA "left eye line",3
DATA 127,154,135,153,144,150
DATA "right eye line",3
DATA 178,151,187,154,196,154
DATA "left side of nose",6
DATA 156,140,156,153,156,165,154,172,156,179,161,182
DATA "right side of nose",6
DATA 166,140,166,153,166,166,168,172,167,179,161,182
DATA "left nostril",6
DATA 150,169,147,173,146,178,148,182,153,179,161,182
DATA "right nostril",6
DATA 173,169,176,172,177,178,174,182,170,179,163,182
DATA "top of left eyebrow",6
DATA 112,137,113,132,125,127,139,128,150,131,152,136
DATA "top of right eyebrow",6
DATA 171,136,173,132,186,129,199,128,208,132,211,137
DATA "bottom of left eyebrow",4
DATA 112,138,124,132,138,134,152,136
DATA "bottom of right eyebrow",4
DATA 171,136,187,134,200,132,210,137
DATA "top of upper lip",7
DATA 137,203,149,199,156,196,162,199,168,197,177,199,187,202
DATA "bottom of upper lip",7
DATA 138,203,148,203,156,202,163,203,170,202,178,203,186,202
DATA "top of lower lip",7
DATA 138,203,149,203,156,202,163,203,170,202,177,202,186,203
DATA "bottom of lower lip",7
DATA 141,204,148,207,155,210,163,211,171,210,179,207,185,203
DATA "left side of face",3
DATA 103,141,101,160,104,181
DATA "right side of face",3
DATA 219,140,222,159,218,179
DATA "left ear",7
DATA 99,150,92,144,88,149,90,160,94,174,99,187,104,184
DATA "right ear",7
DATA 224,149,231,144,234,151,232,160,230,173,224,185,219,184
DATA "jaw",11
DATA 104,181,108,199,115,214,129,228,147,240,162,243,180,239,196,228,207,215,215,199,219,178
DATA "hairline",13
DATA 101,144,107,129,114,114,120,104,131,95,146,92,160,93,174,95,188,96,201,103,210,114,217,126,222,143
DATA "top of head",13
DATA 93,204,78,173,76,142,82,101,99,70,129,46,158,44,188,45,217,64,236,94,245,134,250,168,233,200
DATA "left cheek line",3
DATA 145,175,139,182,135,190
DATA "right cheek line",3
DATA 178,176,185,183,190,191
DATA "left cheekbone",3
DATA 105,178,109,184,112,190
DATA "right cheekbone",3
DATA 218,178,214,183,211,189
DATA "left upper lip line",2
DATA 159,186,159,193
DATA "right upper lip line",2
DATA 165,186,165,193
DATA "chin cleft",2
DATA 162,232,162,238
DATA "chin line",3
DATA 153,218,162,216,173,219

