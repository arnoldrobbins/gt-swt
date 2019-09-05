.hd clear "clear terminal screen" 02/22/82
clear
.ds
'Clear' outputs the correct characters to clear a terminal
screen. It calls 'vtinit' to get the user's terminal characteristics.
If the terminal type is found, the screen is updated with the
blank screen to clear it, otherwise 25 blank lines are output
to clear the screen.
.es
clear
.fl
=vth=/<terminal_type>
.sa
vtinit (2), vtupd (2), and other VTH routines (vt?*) (2)
