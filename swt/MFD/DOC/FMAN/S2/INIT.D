

            init (2) --- initialize a Subsystem program              08/28/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 subroutine init

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

          |      At version 8.1 of the Subsystem, 'init' became obsolete.  It
          |      remains  to  help  users  find  programs which were compiled
          |      before Release 8.1.  It will print the following error  mes-
          |      sage:

          |           You are trying to run a pre-version 9 compilation.
          |           Please recompile and try again.

          |      and then exit to the Subsystem.

          |      'Init'  should  not be used in new compilations.  The Ratfor
          |      preprocessor 'rp' no longer automatically inserts a call  to
                 'init'  in  each  main  program  it processes.  Users should
                 remove all references to 'init'  from  their  programs,  and
          |      recompile as soon as possible.

          |      The  Version 8  compatibility library, which allowed the use
          |      of programs compiled before Release 8.1, is no  longer  sup-
          |      ported.






























            init (2)                      - 1 -                      init (2)


