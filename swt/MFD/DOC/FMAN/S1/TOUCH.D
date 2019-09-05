

            touch (1) --- set file date/time modification fields     08/21/84


          | _U_s_a_g_e

          |      touch [-d <date>] [-t <time>] {<pathname>}


          | _D_e_s_c_r_i_p_t_i_o_n

          |      Every file system object has a field indicating the date and
          |      time  (to within 4 seconds) it was last modified.  This com-
          |      mand will set the date/time modified field  of  file  system
          |      objects.

          |      The  "-d" option may be used to specify a date as recognized
          |      by the 'parsdt' routine; if no date is  specified  then  the
          |      current  date  is  used.   The  "-t"  option  may be used to
          |      specify a time as recognized by the 'parstm' routine; if  no
          |      time is specified then the current time is used.

          |      The  remaining  command line arguments are taken as names of
          |      files for which to  set  the  modification  time.   If  "-n"
          |      appears  in place of a pathname, pathnames are read from the
          |      standard input.  For more information on  this  syntax,  see
          |      the entry for 'cat' (1).


          | _E_x_a_m_p_l_e_s

          |      lf -c | touch -n
          |      touch -t 1124 foo.r bar.r


          | _M_e_s_s_a_g_e_s

          |      "Usage:  touch ..."  for invalid arguments.
          |      "invalid format in date argument" or "invalid format in time
          |      argument" for improper arguments.
          |      "<pathname>:   can't  "touch"" for protected or non-existant
          |      files.


          | _S_e_e _A_l_s_o

          |      cat (1), lf (1), gfdata (2), parsdt (2), parstm (2),  sfdata
          |      (2)














            touch (1)                     - 1 -                     touch (1)


