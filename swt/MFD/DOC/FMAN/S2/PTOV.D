

            ptov (2) --- convert packed string to PL/I varying string  09/23/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function ptov (pstr, term, vstr, len)
          |      packed_char pstr (ARB), vstr (len)
          |      integer len
          |      character term

          |      Library:  vswtlb (standard Subsystem library)


          | _F_u_n_c_t_i_o_n

          |      'Ptov'  converts  a  packed  character string (e.g., Fortran
          |      Hollerith  literals)  into  a   PL/I-compatible   "character
          |      varying"  string.   Character  varying  strings consist of a
          |      one-word length field, followed by up to 32767 words of pac-
          |      ked character data.

          |      The argument 'pstr' is the packed  array  to  be  converted.
          |      'Term'  specifies a "termination character"; if the termina-
          |      tion character appears unescaped in the packed string,  then
          |      'ptov'  terminates  the  copying  operation  without copying
          |      'term'.  (For  example,  most  uses  of  packed  strings  in
          |      _S_o_f_t_w_a_r_e _T_o_o_l_s included a period as a termination character,
          |      since  in  general there is no other way for a subprogram to
          |      tell where a Hollerith literal ends.)  The  argument  'vstr'
          |      is  an  array  which  receives the character-varying string;
          |      'len' gives the number of words available in 'vstr', includ-
          |      ing the leading one-word length field.

          |      The function returns the number of  characters  copied  into
          |      'vstr'.

          |      Many Primos routines return packed character strings that do
          |      not  have  a  termination  character,  but do have a maximum
          |      length.  When using 'ptov' to convert the  output  of  these
          |      routines,  one  may  use EOS as the termination character to
          |      obtain a fixed-length result.


          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      'Ptov' first checks that 'len' is large enough to  allow  it
          |      to store characters in 'vstr'.  If there is room for charac-
          |      ters in 'vstr', 'ptov' fetches successive words from 'pstr',
          |      unpacks  the  characters,  checks for escaped characters and
          |      'term', and then packs the characters into 'vstr'.  When  it
          |      encounters  'term'  or  if  it  fills 'len' words with data,
          |      'ptov' returns the number of characters copied.


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      vstr




            ptov (2)                      - 1 -                      ptov (2)




            ptov (2) --- convert packed string to PL/I varying string  09/23/83


          | _S_e_e _A_l_s_o

          |      other   conversion   routines   ('pto?*'    and    '?*tov'),
          |      particularly 'vtop' (2), 'ctop' (2), 'ptoc' (2), 'vtoc' (2),
          |      and 'ctov' (2)





















































            ptov (2)                      - 2 -                      ptov (2)


