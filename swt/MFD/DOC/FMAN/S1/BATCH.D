

            batch (1) --- interface to Primos batch subsystem        08/27/84


          | _U_s_a_g_e

                 batch [[-k] <command>] {<options>}
                 batch -(s | d)[a | t] [<jobname>]
                 batch -(c | a | r) <jobname>
                 batch -m <jobname> {<options>}
                    <options> ::= -a <acct> | -r | -n
                       -h <home dir> | -t <cpu time> | -e <elapsed time> |
                       -p <priority> | -q <queue>    | -f <funit>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Batch' provides a Software Tools Subsystem interface to the
                 Primos  batch  subsystem.   It subsumes the functionality of
                 the Primos JOB command,  providing  in  addition  a  printed
                 listing  of  the  output of the batch job, regardless of its
                 disposition.


                 SSSccchhheeeddduuullliiinnnggg aaa BBBaaatttccchhh JJJooobbb

                 The first alternative of 'batch' allows  the  scheduling  of
                 Subsystem commands as batch jobs.  <Command> is submitted to
                 the  batch queue along with commands to invoke the Subsystem
                 and  catch  its  terminal  output.   If  <command>  contains
                 arguments,  it  should  be  surrounded  by quotes so that it
                 appears as one argument to  'batch'.   If  <command>  begins
                 with  a  hyphen,  it  must  be  preceded by the "-k" flag to
                 identify it as a command.  If <command> is omitted,  'batch'
                 reads commands from standard input.

                 Before  mentioning the available <options>, a few words must
                 be said about the Primos batch subsystem.  As configured  at
                 Georgia  Tech,  the  batch subsystem has three queues, named
                 "fast", "default", and "slow".  When a job is  scheduled  to
                 run  in  one  of  these  queues,  it  takes  on  the default
                 attributes  assigned  to  that   queue,   unless   otherwise
                 specified.  The queue attributes are as follows:

                                       _f_a_s_t       _d_e_f_a_u_l_t        _s_l_o_w

                      Priority          2            1            0
                      Timeslice      1.0 sec      2.0 sec      4.0 sec
                      Cpu Time:
                         Default       4 sec      200 sec       60 min
                         Maximum       8 sec      400 sec      unlimited
                      Elapsed Time:
                         Default      30 sec       50 min       24 hrs
                         Maximum      60 sec      100 min      unlimited

                 When  scheduling  jobs,  several options can be specified on
                 the command line to  change  the  default  behavior.   These
                 options are as follows:

                      -q   <Queue> is the queue name ("fast", "slow", or


            batch (1)                     - 1 -                     batch (1)




            batch (1) --- interface to Primos batch subsystem        08/27/84


                           "default")  in  which  the batch job is to be
                           scheduled.  If this option  is  omitted,  the
                           job will be scheduled in queue "default".

                      -a   <Acct  info>  is  any  string  of  accounting
                           information desired.  This information is for
                           documentation only.

                      -h   <Home dir> is the name of  the  directory  in
                           which  the  batch  job  is to be started.  If
                           this option is omitted, the job will start in
                           the directory from which the 'batch'  command
                           is issued.

                      -t   <Cpu  time> is the maximum allowable cpu time
                           iiinnn ssseeecccooonnndddsss,,,  after  which  the  job  will  be
                           terminated.   It  must not be larger than the
                           maximum allowable elapsed time for the queue.
                           If this option is omitted,  the  default  cpu
                           time  for the selected queue will be enforced
                           as the maximum.

                      -e   <Elapsed time> is the maximum allowable elap-
                           sed (wall-clock) time iiinnn ssseeecccooonnndddsss,,, after which
                           the job will be terminated.  It must  not  be
                           larger  than  the  maximum  allowable elapsed
                           time for the queue.  If this option is  omit-
                           ted,  the default elapsed time for the selec-
                           ted queue will be enforced as the maximum.

                      -p   <Priority> specifies order within  the  queue
                           as  an  integer  from  0  to  9.   It  should
                           normally not be used.

                      -f   <Funit> is the Primos file  unit  from  which
                           the  batch  job  is to obtain its input.  The
                           default is unit 6.

                      -r   This option specifies that the job should  be
                           restarted  upon  system  failure.   If  it is
                           omitted, the job will  not  be  restarted  on
                           system failure.

                      -n   This  option  specifies  that  no batch print
                           file be created for the job.  If this  option
                           is  omitted,  a  batch  print  file  will  be
                           created summarizing the job's execution.



                 OOObbbtttaaaiiinnniiinnnggg BBBaaatttccchhh JJJooobbb SSStttaaatttuuusss

                 The second alternative of the  'batch'  command  allows  the
                 user  to see the status of selected batch jobs.  Normally, a
                 user may only request status information about his own jobs.
                 There are two basic status requests:  "s" (status), and  "d"


            batch (1)                     - 2 -                     batch (1)




            batch (1) --- interface to Primos batch subsystem        08/27/84


                 (display).   "S"  produces  a  one line summary for each job
                 while "d" produces a much more detailed summary.

                 The  additional  option  "a"  with  either  request  returns
                 information  about  active  jobs  (rather  than completed or
                 aborted jobs), while  "t"  returns  information  about  jobs
                 scheduled  "today".  If neither "a" or "t" is specified, all
                 jobs scheduled within the last five days are displayed.

                 If <jobname> is specified, only information about the  named
                 job  will  be  printed, if the job meets the other criterion
                 set by the "a" or "t" option.


                 CCCaaannnccceeelllllliiinnnggg EEExxxiiissstttiiinnnggg JJJooobbbsss

                 The third alternative to  the  'batch'  command  allows  the
                 cancellation  of  existing jobs.  The "-a" option will cause
                 the named job to be immediately aborted if it is  executing,
                 or  cause  it  to  be  removed  from  the queue if it is not
                 executing.  The "-c" option  causes  the  named  job  to  be
                 removed  from  the  queue  if  it  is  not executing, but be
                 allowed to continue if it is  executing.   The  "-r"  option
                 forces  immediate  termination  of  an  executing  job,  but
                 returns it to the queue for re-execution.


                 MMMooodddiiifffyyyiiinnnggg EEExxxiiissstttiiinnnggg JJJooobbbsss

                 Job attributes may be modified after a job is scheduled with
                 the fourth alternative of the 'batch' command.  Any  options
                 specified on the command will cause corresponding changes to
                 the named job.  The "-p <priority>" and "-q <queue>" options
                 may not be specified.


            _F_i_l_e_s

                 Numerous files in "//batchq".
                 =varsdir=/=user=.<line>.<seq>
                 =varsdir=/.batch_seq
                 =temp=/tm?*


            _M_e_s_s_a_g_e_s

                 "Usage:  batch ..."  for erroneous syntax.
                 "=varsdir=/.batch_seq:  can't open"


            _B_u_g_s

          |      Job modification is not implemented.





            batch (1)                     - 3 -                     batch (1)




            batch (1) --- interface to Primos batch subsystem        08/27/84


            _S_e_e _A_l_s_o

                 ph (1), Primos phant$, Primos batch$























































            batch (1)                     - 4 -                     batch (1)


