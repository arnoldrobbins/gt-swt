.hd tee "tee fitting for pipelines" 02/22/82
tee { <pathname> | -[1 | 2 | 3] }
.ds
'Tee' creates multiple copies of data flowing into its first standard
input. By default, it copies this stream of data to its first standard
output. In addition, a copy is made on each of the files named in
its argument list.
If a named file did not previously exist, it is created.
.sp
If an argument consists only of a dash ("-"), optionally followed
by a single digit in the range 1-3, a copy is sent to the standard
output port corresponding to the digit. If the digit is missing,
standard output one is assumed.
.sp
'Tee' is suitable for checkpointing data flowing past a given point
in a pipeline, or for fanning out a data stream to feed multiple,
parallel  pipelines.
.es
lf -c | tee file_names | print -p -n >/dev/lps
memo> tee [cat distribution_list]
.sp
file_names>  tee -2  |P1  |P2 _
   :P1  change % //dir1/  |  cat -n  |$ _
   :P2  change % //dir2/  |  cat -n  |$ _
        lam
.me
.in +5
.ti -5
"<pathname>: can't create" if a file cannot be created.
.in -5
.bu
This function could be performed by the i/o primitives.
.sa
cat (1)
