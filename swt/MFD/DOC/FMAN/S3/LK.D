

            lk (3) --- link cross-assembler object files             01/18/83


            _U_s_a_g_e

                 lk -(6800 | 8080) { [-(i | l | n)] file }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Lk' is used to link together the object code files produced
                 by  the 'as6800' and 'as8080' cross-assemblers.  It produces
                 a file of the same type as the input files, so the output of
                 'lk' may itself be linked with other code files.

                 If no arguments are given on the command line then they  are
                 taken from standard input.  'Lk' always writes its output to
                 the file "l.out".

                 The first argument selects the machine that the object files
                 have  been  compiled  for:   "-6800"  refers to the Motorola
                 6800, while "-8080" indicates the Intel 8080.  The remaining
                 options select the mode the linker is running under and  the
                 input files that are to be linked.  The available modes are:

                 -i   INCLUDE   This is the default mode.  When in this mode,
                                all  object segments encountered in the files
                                specified are linked together onto "l.out".
                 -l   LIBRARY   In this mode, the arguments are taken  to  be
                                libraries,  that is, concatenations of object
                                code files made with 'lib'.  Each segment  is
          |                     examined  to see if it satisfies a previously
          |                     unresolved external reference, and is  linked
          |                     in only if it does.
                 -n   NAMELIST  Any  file  read in this mode is considered to
                                be a program  that  can  be  expected  to  be
                                resident  at the time that the output file is
                                to be run on the target machine.  Any entries
                                encountered in this file's symbol table  that
                                satisfy   a  previously  unresolved  external
                                reference are used to resolve that reference,
                                but the segment itself is not linked in.


            _E_x_a_m_p_l_e_s

                 lk -6800 tpart1.o tpart2.o -n mux.o -l [libs]


            _F_i_l_e_s

                 "l.out" for the output code file.


            _M_e_s_s_a_g_e_s

                 "Usage:  lk ..."  for invalid argument syntax.
                 Many other error messages, hopefully some of which are self-
                 explanatory.


            lk (3)                        - 1 -                        lk (3)




            lk (3) --- link cross-assembler object files             01/18/83


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 as8080 (3), intel (3), size (3), symbols (3)


















































            lk (3)                        - 2 -                        lk (3)


