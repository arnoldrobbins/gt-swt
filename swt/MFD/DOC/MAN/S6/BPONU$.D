.hd bponu$ "on-unit for BAD_PASSWORD$ condition" 03/22/82
subroutine bponu$ (cp)
longint cp
.sp
Library: vswtlb (standard Subsystem library)
.fs
'Bponu$' is an on-unit handler for the "BAD_PASSWORD$" condition.
It is used by 'getto' to catch directory attaches which fail because
of a bad password.
.sp
'Bponu$' should never be called by the user as such; it is invoked
when the on-unit mechanism detects the "BAD_PASSWORD$" condition.
.im
'Bponu$' calls the Primos PL1$NL routine with the
"bad[bl]password[bl]label"
(i.e., address of the password error return location) to execute
a "nonlocal[bl]goto" to that routine.
.ca
Primos pl1$nl
.sa
getto (2), Primos mkonu$
