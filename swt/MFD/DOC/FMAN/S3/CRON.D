

            cron (3) --- time driven command processor               08/22/84


          | _U_s_a_g_e

          |      cron


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Cron'  allows  the system administrator to have shell files
          |      executed automatically at a given time.   It  does  this  by
          |      creating  phantoms  to  execute  the  file.   The attributes
          |      (name, project, and associated groups) of the phantom can be
          |      specified,  along  with  the  time,  by  the  administrator.
          |      'Cron' must be started from the system console to retain the
          |      privileges  needed to spawn phantoms for alternate user num-
          |      bers.  It could be started as  a  final  step  in  the  boot
          |      procedure by phantoming it from the boot initialization file
          |      (c_config or primos.comi).

          |      'Cron'  gets its information from the file "=cronfile=".  It
          |      periodically (currently, every minute) wakes  up  and  reads
          |      the information in this file.  If it finds a job that should
          |      be  run,  it  collects  the  attributes  (name, project, and
          |      groups) that the job is to have, creates a temporary file in
          |      the directory "=crondir=" to hold the commands,  copies  the
          |      file  to execute into the temporary file, and calls 'sph' to
          |      attempt to spawn the executing process.   Before  the  spawn
          |      attempt,  'cron'  prints  information, on STDOUT, as to what
          |      file is being phantomed for whom, and the attributes of  the
          |      phantom.

          |      The  file  "=cronfile="  contains  a line for each job to be
          |      processed.  Each line contains a sequence of space seperated
          |      sequences of numbers that  describe  the  time  and  day  to
          |      phantom  the  process,  the  user  name  and project name to
          |      phantom, the name of the file to phantom, and  the  list  of
          |      groups  the  phantom should have.  Each space seperated time
          |      description may contain up  to  10  comma  seperated  fields
          |      indicating  multiple  times when this job is to be run.  The
          |      times specify, in order, the minute, hour, day, day  of  the
          |      month,  and  month  that  a command is to be run.  If a time
          |      does  not  matter,  it  can  specified  by  a  '*'  in   the
          |      appropriate  column.   In  addition to the job descriptions,
          |      the file may contain comments by simply placing a '#' in the
          |      first column of the  line.   For  example,  if  "=cronfile="
          |      contained

          |           # min hrs  day dat mth user   proj file          groups
          |               0 6,18  *   *   *  jeff   lab  //acct/fix    guru

          |      then  the first line would be ignored (because of the '#' in
          |      column 1) and the second line would  cause  the  shell  file
          |      "//acct/fix"  to  be  executed by "jeff" under project "lab"
          |      with the ".guru" group at 6am and 6pm  every  day.   A  more
          |      complicated example would be




            cron (3)                      - 1 -                      cron (3)




            cron (3) --- time driven command processor               08/22/84


          |           # min hrs  day dat mth user   proj file          groups
          |              15  *   1,7  *   12 arnold lab  //system/die  scum

          |      which  would  have  "arnold"  with  project  "lab" and group
          |      ".scum" run the file "//system/die" every 15  minutes  after
          |      the  hour  on weekends (Sunday = 1, Saturday = 7) during the
          |      month of December (January = 1,  December  =  12).   Another
          |      example might be a program to be run on the first day of the
          |      year,  to  send  a happy new year message to everyone.  This
          |      might look like

          |           # min hrs  day dat mth user   proj file
          |              0   0    *   1   1  system lab  //message

          |      which would run "//message" on January 1 at midnight.

          |      When specifying the time, care must be taken  to  prevent  a
          |      command  from being over-executed.  If in the second example
          |      the entry had been

          |           # min hrs  day dat mth user   proj file          groups
          |              *   *   1,7  *   12 arnold lab  //system/die  scum

          |      then the file would have been executed every  minute  during
          |      the weekends in December.


          | _M_e_s_s_a_g_e_s

          |      "can't  open =cronfile=" when "=cronfile=" does not exist or
          |      is unreadable.

          |      "can't open <file>" when the file to spawn does not exist or
          |      ir unreadable.

          |      "can't create <file>" when it can't create  temporary  files
          |      in the directory "=crondir=".

          |      Any message that 'sph' can generate.


          | _E_x_a_m_p_l_e_s

          |      cron


          | _B_u_g_s

          |      Locally  supported until Prime supports EPF's and the SPAWN$
          |      subroutine call.

          |      Generates lots of output if "=cronfile=" does not exist.






            cron (3)                      - 2 -                      cron (3)




            cron (3) --- time driven command processor               08/22/84


          | _S_e_e _A_l_s_o

          |      sph (5)























































            cron (3)                      - 3 -                      cron (3)


