

            xccl (1) --- compile and load a Prime C program          08/27/84


          | _U_s_a_g_e

          |      xccl <program name> [<'ld' options>] [/ <'xcc' options>]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Xccl'  is  a  shell file that invokes the Primos C compiler
          |      and the Primos segmented loader.  If 'xccl' is invoked  with
          |      no  <program  name> argument, it automatically processes the
          |      last program edited, since it shares the shell variable  'f'
          |      with the shell program 'e'.  The name of the file containing
          |      the  program  to be compiled must end with ".c", although in
          |      <program name> it may be specified with or without the  end-
          |      ing   ".c".    If   no  output  file  is  specified  in  the
          |      <'ld' options>,  the  output  object  file  name   will   be
          |      <program name> with no extension.

          |      Concerning  the  options,  'xcc'  will  be  called  with the
          |      <'xcc' options> specified on the  command  line;  then  'ld'
          |      will be called with the <'ld' options> specified.


          | _E_x_a_m_p_l_e_s

          |      xccl myprog.c
          |      xccl myprog subs.b subs2.b -l mylib
          |      xccl myprog / -l mylist


          | _M_e_s_s_a_g_e_s

          |      "<program name>.c:  cannot open"


          | _S_e_e _A_l_s_o

          |      xcc (1), ld (1), bind (3)




















            xccl (1)                      - 1 -                      xccl (1)


