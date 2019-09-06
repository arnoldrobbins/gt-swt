[cc]mc |
.hd ring "network communication server" 09/18/84
ring
.ds
'Ring' is a network communication server for Prime computers. When
run as a privileged process on a node of the ringnet, it figures out
who it is and who all the other nodes are, and then procedes to connect
itself in a ring with its predecessor and successor using
virtual circuits. Once connected, it will (currently) accept requests
from users to execute commands on a legal remote node and pass the
status back to the user. It also ensures that the system time (time of
day, and date) is consistent among all the machines in the network.
.sp
'Ring' is unfinished but has many possibilities. The plans before the
SWT project ended and its creator found another job were to set up a
method for load sharing among computers in a network under the Software
Tools Subsystem. The idea was to make a "/dev/net" device that would
have its port number returned by a port server ('ring', or course) on
the remote system. A shell would be cranked up on the remote system
who's standard input would be a NET device.
The source of the NET device would be
the system where the user actually resided. This would allow the user
(only under the Subsystem) to communicate with his process remotely.
.me
Numerous. Sorry, but see the source code.
.bu
Simply unfinished. Has tremendous possibilities.
.sa
broadcast (3), execute (3), setime (3),
[ul Ring -- The Software Tools Subsystem Network Utility]
[cc]mc
