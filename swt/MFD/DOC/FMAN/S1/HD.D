

            hd (1) --- summarize available disk space                08/27/84


          | _U_s_a_g_e

                 hd [ -n | -u | -v ] { <pack id> }


            _D_e_s_c_r_i_p_t_i_o_n

          |      'Hd'  ("how's  disk?")  prints  a  summary of available disk
          |      space.  Zero or more <pack id>  arguments  may  be  used  to
                 specify the disk partitions of interest.  A <pack id> may be
                 the  packname  of  the  partition  (the  name  of the record
          |      availability table file) or its _o_c_t_a_l logical disk number in
                 the range 0:76 or an asterisk indicating the disk containing
                 the user's current directory.  If no <pack id> arguments are
                 given,  information  for  all  online  disks,  in  order  of
                 increasing logical disk number, is provided.

                 The format of each line of output is as follows:

                      nn:  rrrrrr free pppppp% full ssss...

                 where  'nn' is the logical disk number in octal (if the disk
                 number is  known),  'rrrrrr'  is  the  (decimal)  number  of
                 records  available  on  the  partition, 'pppppp' is the per-
                 centage of total records on the partition that are currently
                 in use, and 'ssss...'  is the packname of the partition.

                 The "-n" and "-u" options may be used to determine the  base
                 record size for reporting the number of available records on
                 storage  module  partitions  (whose  physical record size is
                 1024 words).  If the "-n" option is specified, the number of
                 physical records available is "normalized" to an  equivalent
                 number   of  440  word  records.   If  the  "-u"  option  is
                 specified, the  number  of  available  physical  records  is
                 reported as is, without normalization.  If neither option is
                 given, "-u" is assumed.

                 If  the "-v" option is used, 'hd' will also print the number
                 of heads and total number of records in each partition.


            _E_x_a_m_p_l_e_s

                 hd
                 hd swtsys user_a 10
                 hd -v *
                 hd -n cc


            _F_i_l_e_s

                 Record availability tables and master  file  directories  on
                 all reported disks.





            hd (1)                        - 1 -                        hd (1)




            hd (1) --- summarize available disk space                08/27/84


            _M_e_s_s_a_g_e_s

                 "Usage:  hd ..."  for incorrect argument syntax.
                 "bad  packname"  for  unrecognized packnames or out-of-range
                      logical disk numbers.
                 "disk-rat unreadable" if the record availability table can't
                      be opened for reading.
                 "disk-rat badly formatted" for a record  availability  table
                      that does not conform to the standard format.
                 "mfd  unreadable" if the master file directory on the parti-
                      tion can't be opened for reading.
                 "-n and -u are mutually exclusive" if  both  "-n"  and  "-u"
                      options are specified.


          | _B_u_g_s

          |      The  name  is  not terribly mnemonic.  It is a holdover from
          |      the long defunct Georgia Tech Burroughs B5500.


            _S_e_e _A_l_s_o

                 fsize (1), lf (1)


































            hd (1)                        - 2 -                        hd (1)


