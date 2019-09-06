

            ring (5) --- network communication server                09/18/84


          | _U_s_a_g_e

          |      ring


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Ring'  is  a  network  communication  server for Prime com-
          |      puters.  When run as a privileged process on a node  of  the
          |      ringnet,  it  figures  out  who  it is and who all the other
          |      nodes are, and then procedes to connect  itself  in  a  ring
          |      with  its  predecessor and successor using virtual circuits.
          |      Once connected, it will  (currently)  accept  requests  from
          |      users  to  execute  commands on a legal remote node and pass
          |      the status back to the  user.   It  also  ensures  that  the
          |      system  time (time of day, and date) is consistent among all
          |      the machines in the network.

          |      'Ring' is unfinished but has many possibilities.  The  plans
          |      before  the  SWT project ended and its creator found another
          |      job were to set up a method for load sharing among computers
          |      in a network under the Software Tools Subsystem.   The  idea
          |      was  to  make  a  "/dev/net" device that would have its port
          |      number returned by a port server ('ring', or course) on  the
          |      remote  system.   A  shell would be cranked up on the remote
          |      system who's standard input would  be  a  NET  device.   The
          |      source  of the NET device would be the system where the user
          |      actually resided.  This would allow the user (only under the
          |      Subsystem) to communicate with his process remotely.


          | _M_e_s_s_a_g_e_s

          |      Numerous.  Sorry, but see the source code.


          | _B_u_g_s

          |      Simply unfinished.  Has tremendous possibilities.


          | _S_e_e _A_l_s_o

          |      broadcast (3), execute (3), setime (3), _R_i_n_g _-_- _T_h_e _S_o_f_t_w_a_r_e
          |      _T_o_o_l_s _S_u_b_s_y_s_t_e_m _N_e_t_w_o_r_k _U_t_i_l_i_t_y













            ring (5)                      - 1 -                      ring (5)


