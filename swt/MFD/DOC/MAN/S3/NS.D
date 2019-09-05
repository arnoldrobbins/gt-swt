.hd ns "print out network status" 01/15/83
ns
.ds
'Ns' prints the status of all active virtual circuits.
For each virtual circuit, it prints the name and process
id of the user holding it, the port number, the virtual
circuit number, and the system to which it connects.
.me
"network not configured" for no network.
.br
"x$stat error. Shouldn't happen" for unexpected network errors.
.es
ns
.bu
Locally supported.
.sa
nodes (3), nstat (3)
