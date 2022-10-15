' Truchet tiles   by J. Graves
' 9/25/93
' Described in "The Magic Machine" by A.K. Dewdeny
' Chapter 5 - Catching Biomorphs   pg 53-55

' Neat combinations to try
' split  md   size    Comments
'  -1    2     12     Starts out /  dissolves to chaos and ends \
' 102   -2     12     Opposite of above
'  50    0     any    Completely random
'  0     0     any    Completely /
' 100    0     any    Completely \


' Some interesting color effects can be seen by locking in the color
' for connecting or opposite quadrants

DEFINT A-Z
SCREEN 12
CONST PI = 3.141593
RANDOMIZE TIMER

DIM tile(100, 100)
split = 50      'if rnd # (1-100) > split; tile 1 *otherwise tile 2
md = 0          'modifies split by adding this amount after each X step
size = 20       'step size (i.e. how big of pattern to make)
rad = size / 2  'needed to draw circle of right size

'Tile 1 colors
ul = 1     'upper left
lr = 1     'lower right

'Tile 2 colors
ur = 1     'upper right
ll = 1     'lower left

FOR x = 0 TO 640 STEP size
FOR y = 0 TO 480 STEP size

q = INT(RND * 100) + 1

'Randomize quadrant colors
'ul = INT(RND * 16 + 1)
'lr = INT(RND * 16 + 1)
'ur = INT(RND * 16 + 1)
'll = INT(RND * 16 + 1)

IF q > split THEN

'Tile 1
CIRCLE (x + 0, y + 0), rad, ul, 3 * PI / 2
CIRCLE (x + size, y + size), rad, lr, PI / 2, PI

ELSE

'Tile 2
CIRCLE (x + 0, y + size), rad, ur, , PI / 2
CIRCLE (x + size, y + 0), rad, ll, PI, 3 * PI / 2

END IF

NEXT y

split = split + md

NEXT x

shimmer:
x = RND * 640
y = RND * 480

xx = x / size
yy = y / size

tile(xx, yy) = tile(xx, yy) + 1

x = xx * size
y = yy * size

CIRCLE (x + 0, y + 0), rad, 0, 3 * PI / 2
CIRCLE (x + size, y + size), rad, 0, PI / 2, PI
CIRCLE (x + 0, y + size), rad, 0, , PI / 2
CIRCLE (x + size, y + 0), rad, 0, PI, 3 * PI / 2

q = INT(RND * 100) + 1

IF q > 50 THEN

'Tile 1
CIRCLE (x + 0, y + 0), rad, tile(xx, yy), 3 * PI / 2
CIRCLE (x + size, y + size), rad, tile(xx, yy), PI / 2, PI

ELSE

'Tile 2
CIRCLE (x + 0, y + size), rad, tile(xx, yy), , PI / 2
CIRCLE (x + size, y + 0), rad, tile(xx, yy), PI, 3 * PI / 2

END IF



GOTO shimmer


