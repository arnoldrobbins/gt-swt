

            lib (3) --- concatenate cross-assembler object files     01/13/83


            _U_s_a_g_e

                 lib  { <object_file> }


            _D_e_s_c_r_i_p_t_i_o_n

                 'Lib'  is used to concatenate the object code files produced
                 by the 'as6800'  and  'as8080'  cross-assemblers.   This  is
                 usually  done  to generate a library suitable for use by the
                 link editor 'lk'.

                 If  arguments  are  given  on  the   command   line,   'lib'
                 concatenates  the named files and places their concatenation
                 on the file "lib.out".  Otherwise, file names are taken from
                 standard input, and  their  contents  are  concatenated  and
                 placed on "lib.out".


            _E_x_a_m_p_l_e_s

                 files .o$ | lib
                 lib rtrlib new_routine.o


            _F_i_l_e_s

                 "lib.out" is always the output file.


            _M_e_s_s_a_g_e_s

                 "Can't open" for unreadable or unwritable files;


            _B_u_g_s

                 Locally supported.


            _S_e_e _A_l_s_o

                 as6800 (3), as8080 (3), size (3), symbols (3), lk (3)















            lib (3)                       - 1 -                       lib (3)


