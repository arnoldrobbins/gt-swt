

            rsa (3) --- toy RSA public-key cryptosystem              01/15/83


            _U_s_a_g_e

                 rsa (-i | -e <correspondent> | -d)


            _D_e_s_c_r_i_p_t_i_o_n

                 'Rsa'  is  a  simplified  implementation  of an RSA (Rivest-
                 Shamir-Adleman) public-key cryptosystem.  While  interesting
                 as  a  novelty,  it  does not provide sufficient security to
                 resist an informed attack.

                 'Rsa' has three options.  The "-i" (initialize) option  must
                 be  selected  by  a user before any other users can send him
                 encrypted information.  The  "-e  correspondent"  (encipher)
                 option  is used to encrypt standard input to standard output
                 using the public key of the named  user.   (In  a  practical
                 system,  only  the  named user would then be able to decrypt
                 the result, using his private  key.)   The  "-d"  (decipher)
                 option  is used to decrypt standard input to standard output
                 using the private key of the current  user.   Thus,  if  the
                 current user has login name "BOZO", the network

                           rsa -e bozo | rsa -d

                 effects an identity transformation.

                 Further  information  on public-key cryptosystems in general
                 and the RSA algorithm in particular can be found in the fol-
                 lowing references:

                      Hellman, Martin  E.   "The  Mathematics  of  Public-Key
                      Cryptography,"  in  _S_c_i_e_n_t_i_f_i_c _A_m_e_r_i_c_a_n, Vol.  241, No.
                      2, pp.  146-157, August, 1979

                      Rivest, R.  L., Adi Shamir, and Len Adleman _O_n  _D_i_g_i_t_a_l
                      _S_i_g_n_a_t_u_r_e_s   _a_n_d   _P_u_b_l_i_c_-_K_e_y   _C_r_y_p_t_o_s_y_s_t_e_m_s,   Report
                      MIT/LCS/Tm-82, Laboratory for  Computer  Science,  Mas-
                      sachusetts Institute of Technology, April, 1977

                      Rivest,  R.   L., A.  Shamir, and A.  Adleman "A Method
                      for Obtaining Digital Signatures and  Public-Key  Cryp-
                      tosystems," in _C_o_m_m_u_n_i_c_a_t_i_o_n_s _o_f _t_h_e _A_C_M, Vol.  21, No.
                      2, pages 120-126, February, 1978.


            _E_x_a_m_p_l_e_s

                 rsa -i   # initializes public and private key files
                 plaintext> rsa -e system >ciphertext
                 ciphertext> rsa -d >plaintext
                 rsa -e bozo >>=extra=/mail/bozo






            rsa (3)                       - 1 -                       rsa (3)




            rsa (3) --- toy RSA public-key cryptosystem              01/15/83


            _F_i_l_e_s

                 "=varsdir=/.rsa_encipher" for public-key information;
                 "=varsdir=/.rsa_decipher" for private-key information.


            _M_e_s_s_a_g_e_s

                 "Usage:  rsa ..."  for invalid argument syntax.
                 Various  self-explanatory  messages  if  key  files  are not
                 present or unreadable.


            _B_u_g_s

                 32 bit arithmetic is insufficient to guarantee security.

                 Locally supported.


            _S_e_e _A_l_s_o

                 Subsystem Mathematical Function Library ('vswtml')



































            rsa (3)                       - 2 -                       rsa (3)


