

            cset (1) --- list information about the ASCII character set  11/06/82


          | _U_s_a_g_e

          |      cset [-i <int> | -k <key> | -m <mnemonic>] [-o (i | k | m)]


          | _D_e_s_c_r_i_p_t_i_o_n

          |      'Cset' is a command that lists various information about the
          |      ASCII character set.  The following arguments may be used to
          |      select a certain ASCII character for display:

          |           -i   Information  is  listed  for  the  character whose
          |                integer value is <int>.  If <int> is in the  range
          |                0  through  127  inclusive the character that will
          |                actually be listed is integer value  <int>  +  128
          |                since  Prime  convention  is  mark  parity for all
          |                ASCII characters, otherwise <int> must be  in  the
          |                range  128  to  255  inclusive.   <Integer> may be
          |                entered  in  any  radix  using  the  <radix>r<int>
          |                format.

          |           -k   Information  is  listed  for  the  character whose
          |                keycode matches <key>.  Keycodes  are  the  actual
          |                characters  typed  to  enter  the  character:  the
          |                character itself if it is simply an upper or lower
          |                case character, or an up arrow  (^)  to  represent
          |                the  control  key  followed by the character typed
          |                while holding the  control  key  down.   The  only
          |                exception   is   for  the  rubout  key,  which  is
          |                represented as ^#.

          |           -m   Information is  listed  for  the  character  whose
          |                mnemonic  matches <mnemonic>.  Mnemonics are stan-
          |                dard ASCII mnemonics in upper or lower case.

          |      If none of the above options are  present,  information  for
          |      all ASCII characters is listed.


          |      The  following  argument  may  be  used to select the output
          |      format:

          |           -o   If the string following this argument begins  with
          |                an  "i"  (in upper or lower case), then the output
          |                will be the base 10 integer value of each  charac-
          |                ter  selected  for display by the above arguments.
          |                If the string following this argument begins  with
          |                a  "k",  then  the  output  will  be  the keycodes
          |                corresponding to the selected characters.  And  if
          |                the  string following this argument begins with an
          |                "m", then the output will be the mnemonics for the
          |                selected characters.

          |      If this argument is omitted,  output  will  consist  of  the
          |      integer value of the selected characters in bases 10, 8, and
          |      16,  together  with the keycode and mnemonic associated with


            cset (1)                      - 1 -                      cset (1)




            cset (1) --- list information about the ASCII character set  11/06/82


          |      those characters.


          | _E_x_a_m_p_l_e_s

          |      cset
          |      cset -k ^p
          |      cset -m del -o i
          |      cset -i 8r200 -o m


          | _S_e_e _A_l_s_o

          |      ctomn (2)












































            cset (1)                      - 2 -                      cset (1)


