

            rtoc (2) --- convert real value to ASCII string          02/24/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function rtoc (v, str, w, d)
                 real v
                 character str (ARB)
                 integer w, d

                 Library:  vswtlb (standard Subsystem library)


            _F_u_n_c_t_i_o_n

                 'Rtoc'  converts the (single precision) real value in 'v' to
                 a character string in 'str'.  The length of  the  string  is
                 returned as the value of 'rtoc'.

                 The  values  of  'w'  and 'd' control the format of the con-
                 verted string.  Generally speaking, 'd' controls the  number
                 of   decimal   positions  or  significant  digits,  and  'w'
                 specifies the maximum length of the  field.   The  following
                 table  explains  the  operation of 'rtoc' for different com-
                 binations of 'w' and 'd'.  (Fortran  and  Basic  programmers
                 take  note:   d>12  corresponds  to  Basic  output, 12>=d>=0
                 corresponds to Fortran 'F' format, and  0>d>=12  corresponds
                 to Fortran 'E' format)

                 _'_d_'        _'_w_'    _R_e_s_u_l_t

                 d>12       w>16   If  the value is in the range 1e7>v>=1e-2,
                                   it is converted into a  BASIC-like  fixed-
                                   point  with  no  trailing zeroes after the
                                   decimal point.  Otherwise, it is converted
                                   into a BASIC-like exponential format  with
                                   no   trailing  zeroes  after  the  decimal
                                   point.

                            w<=16  An error is returned.

                 12>=d>=0   -      If possible, the value is converted  to  a
                                   fixed-point   format  with  'd'  positions
                                   after the decimal point.  Otherwise, it is
                                   converted to an exponential format with as
                                   many significant digits as  possible.   If
                                   'w' is less than 8, an exponential conver-
                                   sion  is not possible and an error will be
                                   returned.

                 0>d>-12    w>d+6  The number is converted to an  exponential
                                   format with 'd' significant digits.

                            w<=d+6 An error is returned.

                 To  return  an error, 'rtoc' places a string consisting of a
                 single question mark in 'str'.

                 It should be noted that 'w' is  roughly  equivalent  to  the


            rtoc (2)                      - 1 -                      rtoc (2)




            rtoc (2) --- convert real value to ASCII string          02/24/82


                 'size' parameter in other conversion routines such as 'itoc'
                 and  'ltoc'; 'w' specifies the maximum number of digits that
                 may be produced.  Thus  the  maximum  number  of  characters
                 returned in 'str' will never exceed 'w + 1'.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 'Rtoc'  converts  the  number  to  double precision and then
                 calls 'dtoc'.  'Rtoc' then returns whatever 'dtoc' returns.


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 str


            _C_a_l_l_s

                 dtoc


            _B_u_g_s

                 Has been thoroughly tested, but has not stood  the  test  of
                 time.


            _S_e_e _A_l_s_o

                 other conversion routines ('cto?*' and '?*toc') (2)



























            rtoc (2)                      - 2 -                      rtoc (2)


