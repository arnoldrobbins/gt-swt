

            amatch (2) --- look for pattern match at specific location  05/29/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function amatch (lin, from, pat, tagbeg, tagend)
                 character lin (ARB), pat (MAXPAT)
                 integer from, tagbeg (9), tagend (9)

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Amatch'  checks the substring of the line 'lin' starting at
                 position 'from' to see if it matches the pattern  in  'pat'.
                 'Pat' must have been created by the utility routine 'makpat'
                 beforehand.  If a match occurs, then the arrays 'tagbeg' and
                 'tagend'  are  used  to  record the beginning and end of any
                 tagged subpatterns  that  appeared  in  'pat'  (i.e.,  'tag-
                 beg(N+1)'  contains  the  index in 'lin' of the start of the
                 Nth tagged subpattern, 'tagend(N+1)' contains the  index  in
                 'lin'  of  the  end of the Nth subpattern, while 'tagbeg(1)'
                 and 'tagend(1)' bracket the  entire  matched  string).   The
                 function  return is the index of the next unexamined charac-
                 ter in 'lin' if a match was found, zero otherwise.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Amatch' steps through successive entries  in  the  pattern,
                 attempting  to match them against the line of text.  Most of
                 the complexity arises in handling closures;  'amatch'  calls
                 'omatch' repeatedly to match the longest possible substring,
                 then backs up as necessary to make the remainder of the pat-
                 tern  match.  This may involve multiple backups, since there
                 may be more than one closure in a pattern.

                 'Omatch' is called to match all single  non-closure  pattern
                 elements.   If  'omatch'  fails,  then  the stack of pending
                 closures is examined.  If empty, 'amatch' returns  zero;  if
                 non-empty, 'amatch' reduces the last closure and attempts to
                 match again.

                 Whenever  a  pattern  tag  (open  brace  or  close brace) is
                 encountered in the pattern,  'amatch'  records  the  current
                 offset  in  the  line  in 'tagbeg' or 'tagend', whichever is
                 appropriate.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 tagbeg, tagend


            _C_a_l_l_s

                 omatch, patsiz



            amatch (2)                    - 1 -                    amatch (2)




            amatch (2) --- look for pattern match at specific location  05/29/82


            _B_u_g_s

                 Rather slow.


            _S_e_e _A_l_s_o

                 match (2), makpat (2), omatch (2), find (1), ed (1), se (1)


















































            amatch (2)                    - 2 -                    amatch (2)


