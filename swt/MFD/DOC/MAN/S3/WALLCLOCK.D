[cc]mc |
.hd wallclock "tell the time in a big way" 08/30/84
wallclock [ <delay> [ <fill_char> ]]
.ds
'Wallclock' is a program which uses the CRT as a rather
large (and expensive) digital display timepiece.
It prints out the time that the "clock" was started, in small
characters, and then every <delay> seconds (default is one),
updates the current time, in large characters.
.sp
The characters will be made up of "*"s, unless the user cares
to specify an alternate character in <fill_char>.
.sp
To stop the clock, use the BREAK key, or type a control-p.
.es
wallclock
wallclock 5
wallclock 10 $
.sa
clock (1), vt?* routines (2)
[cc]mc
