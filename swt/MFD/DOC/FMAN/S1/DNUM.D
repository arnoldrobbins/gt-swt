

            dnum (1) --- generate or interpret legal disk numbers    03/20/80


            _U_s_a_g_e

                 dnum [<disk_number>]


            _D_e_s_c_r_i_p_t_i_o_n

                 If  given  a disk number as an argument, 'dnum' will print a
                 short  description  of  the  corresponding  disk   partition
                 (controller type, number of heads, first head number, etc.).
                 If  the argument is missing, 'dnum' will prompt the user for
                 the required information and generate the corresponding disk
                 number.


            _E_x_a_m_p_l_e_s

                 dnum 21060
                 Controller 4004 storage module disk
                    controller 0, unit 0
                    first head: 4, number of heads: 4


            _M_e_s_s_a_g_e_s

                 Many; 'dnum' is interactive.


            _B_u_g_s

                 When given a cartridge module disk number  as  an  argument,
                 'dnum'  always  considers  it  a  storage  module  and gives
                 incorrect results for the fixed surfaces.

























            dnum (1)                      - 1 -                      dnum (1)


