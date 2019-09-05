

            call$$ (6) --- call a P300, SEG, or EPF runfile          09/11/84


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function call$$ (name, length[, onunit])
                 integer name (16), length
                 external onunit

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Call$$'  takes  the  packed  name and name length of a P300
          |      format run file, a SEG segment directory, or EPF  run  file.
          |      First  'call$$'  attempts to restore the file with a call to
          |      the Primos routine REST$$.   If  REST$$  returns  unsuccess-
          |      fully,  'call$$' attempts to load the file as a SEG run file
          |      through a call to 'ldseg$'.  If 'ldseg$' returns because the
          |      file was not a segment directory, R$RUN is called  with  the
          |      restore  option  to  attempt to load the file as an EPF.  If
          |      all attempts to load the file fail,  'call$$'  returns  ERR.
                 'Onunit',  if  specified,  indicates  that  the shell's ANY$
                 onunit is to be created.

                 'Call$$' returns (with value OK) if and only if the  program
                 it  calls  exits by calling 'swt' or does a procedure return
                 from its main procedure.  Otherwise, control  goes  wherever
                 the called program sends it.

                 Before  executing the run file, 'call$$' zeroes out the P300
                 fault vector in  segment  4000,  zeroes  the  program  error
                 return  code,  calls  'iofl$'  to  mark which Subsystem file
                 units are open, and saves the stack  base  register  in  the
                 Subsystem common block for use by 'rtn$$'.



            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Call$$'  first zeroes the program error return code and the
                 P300 fault vector.  It then tries to load the  run  file  in
                 memory  with  a call to REST$$.  If there is an error on the
                 restore, 'call$$' calls 'ldseg$' to load the file as  a  SEG
          |      run  file.  If 'ldseg$' fails because the file is not a seg-
          |      ment directory, R$RUN is  called  to  restore  the  file  in
          |      memory  as  an  EPF.   If  R$RUN  returns an error, 'call$$'
          |      returns ERR.

          |      For P300 run files  and  SEG  segment  directories,  if  the
          |      program  just loaded begins in 64V mode, 'call$$' executes a
                 PCL instruction to the address of  its  main  entry  control
                 block.   Otherwise,  'call$$'  builds  an  R or S mode entry
                 control block for the program in the stack.   After  setting
                 up  an  onunit  for  ANY$  via  a call to the Primos routine
                 MKONU$ (if the user specified a  third  argument),  'call$$'
                 executes  a  PCL  instruction  to  the correct entry control
          |      block.  If the file is an EPF run file, the onunit for  ANY$


            call$$ (6)                    - 1 -                    call$$ (6)




            call$$ (6) --- call a P300, SEG, or EPF runfile          09/11/84


          |      is  still  set  (if requested), but then R$INVK is called to
          |      start execution of the file.

                 When the called program returns directly  to  'call$$'  from
                 'rtn$$',  'call$$' calls 'cof$' to close all files opened by
                 the program, restores the user's terminal configuration word
                 (saving the output  suppressed  bit)  via  calls  to  Primos
                 DUPLX$,  restores the previous saved stack base register and
                 returns with the value OK.


            _C_a_l_l_s

          |      cof$, iofl$, ldseg$, move$, Primos  break$,  Primos  duplx$,
          |      Primos  mkonu$,  Primos rest$$, Primos rvonu$, Primos r$run,
          |      Primos r$invk


            _B_u_g_s

                 Will destroy the  current  executing  memory  image  if  the
          |      object must be loaded at the same addresses.

          |      The  ability  to execute EPF's is not really supported until
          |      Prime decides to support EPF's.


            _S_e_e _A_l_s_o

                 rtn$$ (6), swt (2)




























            call$$ (6)                    - 2 -                    call$$ (6)


