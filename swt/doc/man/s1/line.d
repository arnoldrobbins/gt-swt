.hd line "print user's process id" 03/20/80
line
.ds
'Line' prints the user's process id in decimal on standard output.
.es
cat >=temp=/t$[line]
line
to [caller] Process i.d. is [line]
.bu
A better name for this command would be 'pid'.
.sa
login_name (1), term_type (1), date (2)
