

            quota (1) --- read and set disk record quota limits      09/05/84


          | _U_s_a_g_e

          |      quota [-s <quota limit>] [-v] {<file_spec>}


          | _D_e_s_c_r_i_p_t_i_o_n

          |      It  is  possible to set an upper limit to the number of disk
          |      records that may be used in a directory.  This  command  may
          |      be  used  to  read or set the quota limits on any directory.
          |      Use of the 'quota' command without the  "-s"  argument  will
          |      result in a display of the form:

          |                              a/b (c)

          |      where  'a'  is the total number of records currently used in
          |      the directory and all of its descendants, 'b' is the current
          |      quota, and 'c' is the time-record product; the  time  record
          |      product  is  a  measure of how many records have been in use
          |      over time in this directory and may be used in accounting.

          |      Use of the "-s" option will set  the  quota  for  the  named
          |      directory.   The  argument  after  the "-s" must decode to a
          |      positive-valued long integer.  If the  value  is  zero  then
          |      quota limits are removed from the directory.

          |      Note  that  _n_o  error is reported if the user should set the
          |      maximum quota to a value less than  the  number  of  records
          |      currently used.  Should this event occur, no files or direc-
          |      tories may be created in the directory, nor may any existing
          |      files be expanded.

          |      See  the help on 'cat' for a full description of the meaning
          |      of <file_spec>.


          | _E_x_a_m_p_l_e_s

          |      quota /u(a b c)/spaf -s 0
          |      quota foobar/junk


          | _M_e_s_s_a_g_e_s

          |      "Usage:  quota ..."  for improper arguments.
          |      "<pathname>:  can't get quota information" for various  file
          |      system errors or lack of access rights.
          |      "<pathname>:  not a quota directory"; self-explanatory.
          |      "improper quota value" for invalid value of <quota limit>.
          |      "<pathname>:   can't  set  quota"  for  various  file system
          |      errors or lack of access rights.


          | _S_e_e _A_l_s_o

          |      cat (1), gfdata (2), sfdata (2)


            quota (1)                     - 1 -                     quota (1)


