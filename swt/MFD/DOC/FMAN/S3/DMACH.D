

            dmach (3) --- Burroughs D-machine simulator              03/25/82


            _U_s_a_g_e

                 dmach <hex file>


            _D_e_s_c_r_i_p_t_i_o_n

                 'Dmach'  is  a  simulator  for the microprogrammed Burroughs
                 D-machine described in  _M_i_c_r_o_p_r_o_g_r_a_m_m_i_n_g  _P_r_i_m_e_r,  by  Harry
                 Katzan,  Jr.   (McGraw-Hill, 1977).  Because of the detailed
                 treatment of the machine architecture and programming  tech-
                 niques  given  in  that  text,  these topics are not covered
                 here.

                 'Dmach' requires one command line argument:  the name  of  a
                 file  that  contains  the  hexadecimal  representation  of a
                 microprogram.  The file will typically have  been  generated
                 by  the 'translang' command, which is the translator for the
                 symbolic  microprogramming  language  described  by  Katzan.
                 (See the documentation for 'translang' for further details.)

                 Upon  invocation,  'dmach'  prompts the user for information
                 that it needs to control the simulation environment  and  to
                 provide  a  trace  of  its  activities.   What  follows is a
                 description of the prompt messages that are printed and  the
                 proper user responses:

                 Begin execution at address:

                      The user should enter the microprogram address at which
                      execution  is  to  begin.   Possible  values lie in the
                      range 0 to 1023 (decimal).

                 Number of clock cycles to simulate:

                      The response is used as an upper bound on the number of
                      microprogram clock cycles that are to be simulated.  If
                      the microprogram  consumes  this  many  cycles  without
                      executing a halt instruction, simulation is terminated.

                 Number of cycles between traces:

                      This  determines  the number of clock cycles that occur
                      between each trace point.

                 Begin tracing at address:
                 End tracing at address:

                      These parameters delimit a region of  the  microprogram
                      that  is  to  be  traced.  Trace output is generated at
                      trace points only if the address of  the  microinstruc-
                      tion just executed falls within this region.

                 Print S-memory and registers in octal?

                      If  the  response is "yes", the values of registers and


            dmach (3)                     - 1 -                     dmach (3)




            dmach (3) --- Burroughs D-machine simulator              03/25/82


                      S-memory locations  will  be  represented  as  unsigned
                      octal  numbers  in  the  trace  and memory dump output;
                      otherwise, the representation is signed decimal.

                 Dump S-memory upon termination?

                      If  the  response  is  "yes"  the  user  is  given  the
                      opportunity  to  view  the  contents  of  S-memory when
                      simulation  is  terminated;  otherwise,  no   dump   is
                      provided.

                 Load S-memory -- Enter <return> to quit
                 Starting address (1-2048):
                 Ending address           :

                      The user should enter the starting and ending addresses
                      of  a  contiguous  block  of S-memory to be initialized
                      before execution of the microprogram  begins.   'Dmach'
                      then issues a series of prompts of the form

                           Smem (n) =

                      where  n  is  the  address of a cell to be initialized.
                      Such a prompt is issued for  each  cell  in  the  block
                      delimited  by  the  starting  and ending addresses, and
                      then another pair  of  addresses  is  requested.   This
                      dialogue  continues until the user enters an empty line
                      for the starting address.

                 All numeric items are expected in decimal; however, if input
                 in another radix is desired, the item may be preceded by the
                 radix followed by a letter "r".  For example:

                      8r177

                 is interpreted as octal 177 (127 decimal).

                 Since all input is read from 'dmach's first  standard  input
                 port, the responses may be stored in a file to eliminate the
                 need  for  redundant  typing.   Normally,  such a file would
                 contain one response per line.  When  input  is  being  read
                 from a file, no prompt messages are printed.

                 After  the  last  block  of  S-memory  has been initialized,
                 microprogram execution begins.  Depending  upon  the  user's
                 responses to the above questions, trace output is printed at
                 selected  trace  points  in  the  microprogram.  This output
                 takes the following form:

                      Phase 3 Mpcr: 0
                      Clock: 2     A1: 0       B   : 0       Ctr: 0    Br1: 0
                      Mpcr : 1     A2: 0       Mir : 0       Lit: 0    Br2: 0
                      Ampcr: 0     A3: 0       Bmar: 0       Sar: 0    Mar: 0
                      Mst Lst Abt Aov Cov Sai Rdc Gc1 Gc2 Lc1 ... Ex1 ... Int
                       F   F   F   T   F   T   F   T   F   F  ...  F  ...  F



            dmach (3)                     - 2 -                     dmach (3)




            dmach (3) --- Burroughs D-machine simulator              03/25/82


                 The various fields should  be  self  explanatory  for  users
                 familiar  with  the  D-machine architecture.  The only field
                 present in the trace output not covered  by  Katzan  is  the
                 'Bmar'  field, which simply contains the address of the last
                 S-memory location fetched or written  by  the  microprogram.
                 It  is  obtained  by  concatenating  one  of  the  two  base
                 registers 'Br1' or 'Br2' with the  memory  address  register
                 'Mar'.

                 Upon  termination  of  the  microprogram,  either because of
                 executing a HALT instruction or exceeding the specified num-
                 ber of clock cycles, 'dmach' prints one final trace sequence
                 summarizing the final machine state.  If a memory  dump  was
                 requested  during  the initial dialogue, a series of prompts
                 similar to that for S-memory initialization  is  issued  and
                 the  user is allowed to inspect selected blocks of the final
                 S-memory.


            _E_x_a_m_p_l_e_s

                 dmach mult.h
                 parameters> dmach microprogram.h
                 dmach divide.h >trace_output


            _M_e_s_s_a_g_e_s

                 "Usage:  dmach <hex file>" for incorrect argument syntax.
                 "Error -- Bad external operation" when an external operation
                      other than memory read or write  is  requested  by  the
                      microprogram.
                 "Error  --  S-memory  address out of range" when the address
                      supplied for a memory read or write command is  not  in
                      the range 1 to 2048.
                 "Error -- Memory not ready for read" when a memory read com-
                      mand is issued before the previous one is complete.
                 "Error  --  Memory  not ready for write" when a memory write
                      command is issued before the previous one is complete.


            _S_e_e _A_l_s_o

                 translang (3), _M_i_c_r_o_p_r_o_g_r_a_m_m_i_n_g _P_r_i_m_e_r














            dmach (3)                     - 3 -                     dmach (3)


