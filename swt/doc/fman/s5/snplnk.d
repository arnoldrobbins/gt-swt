

            snplnk (5) --- snap shared library dynamic links         09/10/84


          | _U_s_a_g_e

          |      x snplnk 1/<segment> [2/1]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Snplnk'  is  a Primos-executable routine that scans a given
          |      segment looking for dynamic library links (DYNT's) and  for-
          |      ces  the  Primos ring 3 pointer fault handler to resolve the
          |      address.  After 'snplnk' has been run on a segment, the seg-
          |      ment may be shared non-writable if it  contains  pure  code.
          |      It  is  actually  meant to be run from Primos during library
          |      initialization rather  than  from  SWT.   <Segment>  is  the
          |      desired  segment  to  snap as an octal number, and the "2/1"
          |      causes 'snplnk' to print the name of the routine it is about
          |      to attempt to resolve along with the location of the pointer
          |      in the segment.

          |      To use 'snplnk', the information should be installed in  the
          |      segment  and  the  segment  should  then  be  left writable.
          |      'Snplnk' is then run on the segment and the segment can then
          |      be made non-writable.  As an example,  Georgia  Tech  has  a
          |      file  that  is run at boot time called "swt.share.comi" that
          |      installs the SWT subsystem.  The file contains:

          |           /* SWT.SHARE.COMI, Share Software Tools Subsystem
          |           /*    Last modified: 06/11/84
          |           
          |           OPR 1
          |           SHARE SYSTEM>SW2035 2035 700  /* Library
          |           SHARE SYSTEM>SH2030 2030 700  /* Shell library
          |           SHARE SYSTEM>ST2030 2030 700  /* SWT Initialization program
          |           SHARE SYSTEM>SE2031 2031 700  /* Screen Editor
          |           R SYSTEM>SW4000 1/1           /* Install the Library
          |           R SYSTEM>SH4000 1/5           /* Shell library
          |           R SYSTEM>INITSWT
          |           
          |           SNPLNK 1/2030; SHARE 2030 600 /* Snap links and make the
          |           SNPLNK 1/2031; SHARE 2031 600 /* segments not writeable
          |           SNPLNK 1/2035; SHARE 2035 600
          |           OPR 0
          |           
          |           CO -CONTINUE 6
          |           CO -END

          |      The command "SNPLNK 1/2035; SHARE 2035 600" first snaps  all
          |      the  dynamic  links  in  segment  2035  (the shared standard
          |      library) and then  makes  the  segment  non-writable.   This
          |      prevents  a user from altering the segment whether malicious
          |      or otherwise.


          | _M_e_s_s_a_g_e_s

          |      "A register setting missing" for missing <segment>


            snplnk (5)                    - 1 -                    snplnk (5)




            snplnk (5) --- snap shared library dynamic links         09/10/84


          |      "Segment range is 2030-2037" for a segment out of that range


          | _B_u_g_s

          |      Should be written to use reasonable argument handling.

          |      Gets a pointer fault when trying to snap a link to a routine
          |      that does not exist.

          |      The program attempts to be as intelligent as possible  about
          |      what  a  link  is  and is not but mistakes can theoretically
          |      happen.













































            snplnk (5)                    - 2 -                    snplnk (5)


