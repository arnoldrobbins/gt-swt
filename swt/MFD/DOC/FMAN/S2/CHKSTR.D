

            chkstr (2) --- check a string for printable characters   03/22/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function chkstr (str, len)
                 character str (ARB)
                 integer len

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Chkstr'  looks to see if the characters in a string are all
                 printable.  If an EOS character is  encountered  before  any
                 unprintable  characters  are  encountered  and  before 'len'
                 characters are examined, 'chkstr' returns YES; otherwise, it
                 returns NO.

                 If 'len' is less than or equal to zero, 'chkstr' returns NO.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Chkstr' starts examining the string at the first character;
                 as long as the character is not an EOS and is printable  and
                 'len'  characters have not been examined, 'chkstr' continues
                 to examine the remainder of the string.  When an unprintable
                 or EOS character is found, or when 'len' characters has been
                 examined,  'chkstr'  quits;  it  returns  YES  if   it   has
                 encountered an EOS character, and NO otherwise.


            _S_e_e _A_l_s_o

                 ctomn (2), mntoc (2)
























            chkstr (2)                    - 1 -                    chkstr (2)


