

            expand (2) --- convert a template into an EOS-terminated string  03/25/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function expand (template, str, strlen)
                 integer strlen
                 character template (ARB), str (strlen)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Expand'  is  used  to convert Subsystem path templates into
                 strings.  Templates are used to make the directory structure
                 of the Subsystem user-selectable without the expense of code
                 modification.  The first argument of 'expand' should  be  an
                 EOS-terminated  string containing a template to be expanded;
                 the second argument  should  be  a  string  to  receive  the
                 result,  and  the  third  argument  should  be  the  maximum
                 allowable length of the result.  The function return is  the
                 length  of  the expanded template, or ERR if an undefined or
                 ill-formed template is present.

                 The template consists of uninterpreted characters, which are
                 passed  through  to  the  expanded  version  unchanged,  and
                 identifiers  surrounded  by equals signs, which are replaced
                 by template text and then rescanned.  If the  template  must
                 contain  uninterpreted  equal  signs, they must be "doubled"
                 (eg.  for one =, use ==).

                 See 'lutemp' for a list of templates currently supported.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Expand' maintains indices into the template, the  receiving
                 string, and a pushback buffer, which is initially empty.  As
                 long  as  the  pushback  buffer  is  empty,  'expand' copies
                 characters from the template to the receiving string.   When
                 a  single  equals  sign ("=") is encountered, characters are
                 stored in another buffer until a  trailing  equals  sign  is
                 seen.   This  buffer is passed to 'lutemp', which places the
                 resulting template expansion in  the  pushback  buffer.   As
                 long  as  the pushback buffer is nonempty, 'expand' scans it
                 instead of  the  original  template;  this  allows  template
                 expansions to contain additional templates.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _C_a_l_l_s

                 lutemp



            expand (2)                    - 1 -                    expand (2)




            expand (2) --- convert a template into an EOS-terminated string  03/25/82


            _S_e_e _A_l_s_o

                 lutemp (6), follow (2), getto (2)























































            expand (2)                    - 2 -                    expand (2)


