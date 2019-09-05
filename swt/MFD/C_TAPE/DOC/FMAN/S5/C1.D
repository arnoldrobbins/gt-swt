

            c1 (5) --- C compiler front end                          10/10/84


          | _U_s_a_g_e

          |      c1 [-afuy] { -D<name>[=<value>] } { -I<dir> } { <file> }


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'C1'  is  a  classical  recursive-descent compiler for the C
          |      programming   language,   performing    lexical    analysis,
          |      preprocessing  and  parsing.  'C1' produces an "intermediate
          |      form" which can  be  used  by  the  virtual  code  generator
          |      ('vcg') to produce 64V-mode relocatable object code, or PMA.
          |      'C1'  produces  three  files:   "<file>.ct1"  contains entry
          |      points,  "<file>.ct2"  contains  external  definitions,  and
          |      "<file>.ct3" contains the intermediate form.

          |      The following options are available:

          |           -a   Abort all active shell programs if any errors were
          |                encountered  during  processing.   This  option is
          |                useful in shell programs like 'ccl' that  wish  to
          |                inhibit  compilation  and  loading  if  processing
          |                failed.  By default, this option is not  selected;
          |                that  is,  errors  in  processing do not terminate
          |                active shell programs.

          |           -f   Suppress  automatic  inclusion  of  the   standard
          |                definitions   file.    Macro   and   common  block
          |                definitions for the C Standard I/O Library and for
          |                interfacing with the Subsystem reside in the  file
          |                "=cdefs=".   'C1'  will  process these definitions
          |                automatically,   unless   the   "-f"   option   is
          |                specified.

          |           -u   Reserved.

          |           -y   Check  for  potential  problems,  e.g.   type mis-
          |                matches.  If this option is selected, messages are
          |                output in "<file>.ck".

          |           -D   Defines  the  identifier  <name>   with   optional
          |                <value> for program internal use (maximum of 10).

          |           -I   Specifies  a  directory where include files reside
          |                (maximum of 10).  All "-I" directories  are  sear-
          |                ched   after  the  current  directory  and  before
          |                "=incl=".

          |      NNNOOOTTTEEE:::  This command is not meant to be directly  invoked  by
          |      the  user.  Use one of the compiler interludes, 'cc', 'ccl',
          |      'ucc', or 'compile'.


          | _E_x_a_m_p_l_e_s

          |      c1 file.c


            c1 (5)                        - 1 -                        c1 (5)




            c1 (5) --- C compiler front end                          10/10/84


          |      c1 prog.c -af


          | _M_e_s_s_a_g_e_s

          |      Numerous and self-explanatory.


          | _B_u_g_s

          |      Several known compiler bugs exist.  See the _U_s_e_r_'_s _G_u_i_d_e _f_o_r
          |      _t_h_e _G_e_o_r_g_i_a _T_e_c_h _C _C_o_m_p_i_l_e_r.


          | _S_e_e _A_l_s_o


          |      TTThhhiiisss ppprrrooogggrrraaammm iiisss ooonnnlllyyy aaavvvaaaiiilllaaabbbllleee tttooo llliiiccceeennnssseeeeeesss ooofff  VVVeeerrrsssiiiooonnn  222...000
          |      ooofff  ttthhheee  GGGeeeooorrrgggiiiaaa  TTTeeeccchhh CCC CCCooommmpppiiillleeerrr...  cc (1), ccl (1), compile
          |      (1), ucc (1), vcg (1), _U_s_e_r_'_s _G_u_i_d_e _f_o_r _t_h_e _G_e_o_r_g_i_a  _T_e_c_h  _C
          |      _C_o_m_p_i_l_e_r





































            c1 (5)                        - 2 -                        c1 (5)


