

            mkq$xs (4) --- initialize a hardware defined queue       06/28/82


            _C_a_l_l_i_n_g _I_n_f_o_r_m_a_t_i_o_n

                 integer function mkq$xs (ptr_to_free, room, qu)
                 shortcall mkq$xs (4)

                 pointer ptr_to_free
                 integer room
                 queue_control_block qu

                 Library: shortlb
                 Also declared in =incl=/shortlb.r.i


            _F_u_n_c_t_i_o_n

                 This function initializes a queue control block so it can be
                 used  by  the  other queue functions.  Queues are a machine-
                 defined  data  type  on  higher-level  Prime  machines,  and
                 operations   on   queues   are   guaranteed  "atomic"  (non-
                 interruptable).  However, queues require special definition.

                 Queues must be a fixed size in length, and that length  must
                 be  2  ** k words long, with 4 <= k <= 16.  Furthermore, the
                 queue must start on a 2 ** k word boundary.

                 To make things easier for the  user,  this  function  simply
                 requires  that  the  user  pass  a pointer to a free area in
                 memory, and the  length  of  that  area  ('ptr_to_free'  and
                 'room',  respectively).   The  function  then determines the
                 largest queue that can fit into that  free  area  and  still
                 meet  the  queue-related requirements.  The function updates
                 the queue control block 'qu' to reflect this placement,  and
                 then  returns  the number of available words in the queue as
                 the function value.

                 If no queue can be allocated  in  the  space  provided,  the
                 function  returns  a zero value.  It should be noted that it
                 is possible that the size of the queue created may  be  only
                 half  of  the free area due to the address boundary restric-
                 tions.  Non-zero function returns are always (2 ** k) - 1.

                 The  declaration   'queue_control_block'   is   defined   in
                 =incl=/shortlb.r.i;  this  file  should  be included if this
                 routine is used.


            _I_m_p_l_e_m_e_n_t_a_t_i_o_n

                 Implemented as a PMA routine entered via a JSXB (shortcall).

                 Note that any routine using this call must be compiled using
                 the "-q" option of 'fc'.






            mkq$xs (4)                    - 1 -                    mkq$xs (4)




            mkq$xs (4) --- initialize a hardware defined queue       06/28/82


            _A_r_g_u_m_e_n_t_s _M_o_d_i_f_i_e_d

                 qu


            _B_u_g_s

                 The function uses 'qu' for some temporary values;  'qu'  may
                 be partially initialized even if no queue can be created.

                 Locally supported.


            _S_e_e _A_l_s_o

                 abq$xs  (4),  atq$xs  (4),  fc  (1), rbq$xs (4), rtq$xs (4),
                 tsq$xs (4), _S_y_s_t_e_m _A_r_c_h_i_t_e_c_t_u_r_e _R_e_f_e_r_e_n_c_e _G_u_i_d_e  (Prime  PDR
                 3060)








































            mkq$xs (4)                    - 2 -                    mkq$xs (4)


