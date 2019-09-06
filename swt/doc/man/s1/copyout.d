.hd copyout "copy user's terminal session to printer" 02/22/82
copyout
.ds
'Copyout' opens a file in the spool queue and
diverts the user's command output into the file.
This diversion
can be stopped by logging out or issuing a 'como' command.
.sp
'Copyout' is intended for use by 'batch' to produce a batch job
listing, but it may accidentally find use in other situations.
.es
copyout
.fl
//spoolq/prt??? for spool output
.bu
Diverting a screen editor session to the line printer is very messy.
.sa
batch (1), como (1)
