

            vtop (2) --- convert PL/I varying string to packed string  10/26/83


          | _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

          |      integer function vtop (vstr, pstr, len)
          |      packed_char vstr (ARB), pstr (len)
          |      integer len

          |      Library:  vswtlb (standard Subsystem library)


          | _F_u_n_c_t_i_o_n

          |      'Vtop' converts a PL/I-compatible "character varying" string
          |      into  a  packed character string.  Character varying strings
          |      consist of a one-word length field, followed by up to  32767
          |      words of packed character data.

          |      The  argument  'vstr'  is the character-varying string to be
          |      converted.  'Pstr' is an array  which  receives  the  packed
          |      string; 'len' gives the number of words available in 'pstr'.

          |      The  function  returns  the number of characters copied into
          |      'pstr'.



          | _I_m_p_l_e_m_e_n_t_a_t_i_o_n

          |      'Vtop' first checks that 'len' is large enough to  allow  it
          |      to store characters in 'str' and then computes the number of
          |      characters  it can copy.  If there is room for characters in
          |      'pstr', 'vtop' copies  successive  words  from  'vstr'  into
          |      'pstr'  until it fills 'len' words or runs out of characters
          |      in 'vstr'.  If 'vstr' contains an odd number of  characters,
          |      'vtop' pads the last word with 0's (an EOS character).


          | _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

          |      pstr


          | _S_e_e _A_l_s_o

          |      other    conversion    routines   ('pto?*'   and   '?*tov'),
          |      particularly 'ptov' (2), 'ctop' (2), 'ptoc' (2), 'vtoc' (2),
          |      and 'ctov' (2)












            vtop (2)                      - 1 -                      vtop (2)


