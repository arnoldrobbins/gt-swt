

            sph (5) --- system phantom processor                     08/30/84


          | _U_s_a_g_e

          |      x sph <primos tree> [-u <user>] [-p <project>] [-g {<groups>}]
          |                          [-v <privilege>]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Sph'  is  a  SWT  supplied  command that enables the system
          |      administrator to create  phantoms  with  certain  attributes
          |      (name,  project,  groups,  or  special  phantom  privileges)
          |      specified.  It can be run only from the system  console  or,
          |      at  Georgia  Tech,  by  a  user  that  has  the  .GURU group
          |      associated with his job.  'Sph' is a primos command,  so  if
          |      it  is to be run from the subsystem, the 'x' command must be
          |      used to pass it directly to primos, or  it  must  be  called
          |      through the 'sys$$' subroutine.

          |      The  required  argument <primos tree> is the primos treename
          |      of the file to phantom.  This file is a _P_r_i_m_o_s command file,
          |      not a SWT shell file or executable binary.  All the  remain-
          |      ing  arguments are optional and, except for the '-v' option,
          |      default to the attributes that  the  caller  currently  has.
          |      The  '-u'  specifies  the user name of the process to create
          |      and the '-p' option specifies the project.  The '-g'  option
          |      is  followed  by  zero or more groups that the phantom is to
          |      have.  The group names should  not  be  preceded  by  a  '.'
          |      (which  is  the  Primos  standard) because the 'sph' command
          |      will include them automatically.  The '-v' option allows the
          |      caller to set the privilege word (prvl) in the Primos inter-
          |      nal databases for the  process  privilege.   Currently,  the
          |      only  useful  values for this option are zero and one.  Zero
          |      prevents the phantomed process from being  able  to  execute
          |      'sph' and one allows the programs to use 'sph'.


          | _M_e_s_s_a_g_e_s

          |      "Can't  attach  to <primos tree> (SPH)" for a non-attachable
          |      directory.

          |      "Phantom is user <pid> on <date> at <time>" for a successful
          |      phantom.

          |      Any Primos standard error message for  any  other  exception
          |      conditions (by calling Primos ERRPR$).


          | _E_x_a_m_p_l_e_s

          |      x sph "system>cron.comi" -u cron -p lab -g guru -v 1
          |      x sph "jeff>blerf" -u jeff -p blivnoxx -g






            sph (5)                       - 1 -                       sph (5)




            sph (5) --- system phantom processor                     08/30/84


          | _B_u_g_s

          |      Locally  supported until Prime supports EPF's and the SPAWN$
          |      subroutine call.

          |      Should probably be written for SWT, also.


          | _S_e_e _A_l_s_o

          |      cron (3)















































            sph (5)                       - 2 -                       sph (5)


