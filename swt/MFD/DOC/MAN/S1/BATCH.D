[cc]mc |
.hd batch "interface to Primos batch subsystem" 08/27/84
[cc]mc
batch [[-k] <command>] {<options>}
batch -(s | d)[a | t] [<jobname>]
batch -(c | a | r) <jobname>
batch -m <jobname> {<options>}
   <options> ::= -a <acct> | -r | -n
      -h <home dir> | -t <cpu time> | -e <elapsed time> |
      -p <priority> | -q <queue>    | -f <funit>
.ds
'Batch' provides a Software Tools Subsystem interface to the
Primos batch subsystem.  It subsumes the functionality of the
Primos JOB command, providing in addition a printed listing of the
output of the batch job, regardless of its disposition.
.sp 2
.bf
Scheduling a Batch Job
.sp
The first alternative of 'batch' allows the scheduling of Subsystem
commands as batch jobs.  <Command> is submitted to the batch queue
along with commands to invoke the Subsystem and catch its terminal
output.
If <command> contains arguments, it should be surrounded by quotes
so that it appears as one argument to 'batch'.
If <command> begins with a hyphen, it must be preceded by the "-k"
flag to identify it as a command.
If <command> is omitted, 'batch' reads commands from standard input.
.sp
Before mentioning the available <options>, a few words must
be said about the Primos batch subsystem.  As configured at Georgia
Tech, the batch subsystem has three queues, named "fast", "default",
and "slow".
When a job is scheduled to run in one of these queues, it takes on
the default attributes assigned to that queue, unless otherwise
specified.  The queue attributes are as follows:
.sp
.nf
.in +5
.ul
                 fast       default        slow
.sp
Priority          2            1            0
Timeslice      1.0 sec      2.0 sec      4.0 sec
Cpu Time:
   Default       4 sec      200 sec       60 min
   Maximum       8 sec      400 sec      unlimited
Elapsed Time:
   Default      30 sec       50 min       24 hrs
   Maximum      60 sec      100 min      unlimited
.in -5
.sp
.fi
When scheduling jobs, several options can be specified
on the command line to change the default behavior.  These
options are as follows:
.sp
.in +10
.rm -5
.lt +5
.tc \
.ta 6
.ti -5
-q\<Queue> is the queue name ("fast", "slow", or "default") in
which the batch job is to be scheduled.  If this option is
omitted, the job will be scheduled in queue "default".
.sp
.ti -5
-a\<Acct info> is any string of accounting information desired.
This information is for documentation only.
.sp
.ti -5
-h\<Home dir> is the name of the directory in which the batch
job is to be started.  If this option is omitted, the job will
start in the directory from which the 'batch' command is issued.
.sp
.ti -5
-t\<Cpu time> is the maximum allowable cpu time
.bf
in seconds,
after which the job will be terminated.  It must not be larger
than the maximum allowable elapsed time for the queue.  If this
option is omitted,
the default cpu time for the selected queue will be enforced as
the maximum.
.sp
.ti -5
-e\<Elapsed time> is the maximum allowable elapsed (wall-clock) time
.bf
in seconds,
after which the job will be terminated.  It must not be larger
than the maximum allowable elapsed time for the queue.  If this
option is omitted, the default elapsed time for the selected
queue will be enforced as the maximum.
.sp
.ti -5
-p\<Priority> specifies order within the queue as an integer
from 0 to 9.  It should normally not be used.
.sp
.ti -5
-f\<Funit> is the Primos file unit from which the batch job
is to obtain its input.  The default is unit 6.
.sp
.ti -5
-r\This option specifies that the job should be restarted upon
system failure.  If it is omitted, the job will not be
restarted on system failure.
.sp
.ti -5
-n\This option specifies that no batch print file be created
for the job.  If this option is omitted, a batch print file
will be created summarizing the job's execution.
.sp
.in -10
.rm +5
.sp 2
.bf
Obtaining Batch Job Status
.sp
The second alternative of the 'batch' command allows the user to
see the status of selected batch jobs.  Normally, a user may
only request status information about his own jobs.  There
are two basic status requests:  "s" (status), and "d" (display).
"S" produces a one line summary for each job while "d" produces
a much more detailed summary.
.sp
The additional option "a" with
either request returns information about active jobs (rather than
completed or aborted jobs),
while "t" returns information about jobs scheduled
"today".  If neither "a" or "t" is specified, all jobs scheduled
within the last five days are displayed.
.sp
If <jobname> is specified, only information about the named
job will be printed, if the job meets the other criterion set
by the "a" or "t" option.
.sp 2
.bf
Cancelling Existing Jobs
.sp
The third alternative to the 'batch' command allows the cancellation
of existing jobs.  The "-a" option will cause the named job to be
immediately aborted if it is executing, or cause it to be removed
from the queue if it is not executing.  The "-c" option causes
the named job to be removed from the queue if it is not executing,
but be allowed to continue if it is executing.  The "-r" option
forces immediate termination of an executing job, but returns it
to the queue for re-execution.
.sp 2
.bf
Modifying Existing Jobs
.sp
Job attributes may be modified after a job is scheduled with the
fourth alternative of the 'batch' command.  Any options specified
on the command will cause corresponding changes to the named job.
The "-p <priority>" and "-q <queue>" options may not be specified.
.fl
Numerous files in "//batchq".
.br
=varsdir=/=user=.<line>.<seq>
.br
=varsdir=/.batch_seq
.br
=temp=/tm?*
.me
"Usage: batch ..." for erroneous syntax.
.br
"=varsdir=/.batch_seq: can't open"
.bu
.in +5
.ti -5
[cc]mc |
Job modification is not implemented.
[cc]mc
.in -5
.sa
ph (1), Primos phant$, Primos batch$
