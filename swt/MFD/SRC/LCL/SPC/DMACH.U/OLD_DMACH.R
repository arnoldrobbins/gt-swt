# dmach --- Burroughs D-machine simulator

include "dmach_def.r.i"

   include "dmach_com.r.i"

   call initialize_simulation

   for (Clock = 1; Clock <= Max_clock; Clock = Clock + 1) {
      call initiate_clock_cycle
      call micro_fetch
      if (Micro_instruction == HALT)
         break
      call adder_op
      if (M_type_1)
         call execute_type_1
      else
         call execute_type_2
      call trace_info
      call select_successor_address
      call terminate_clock_cycle
      }

   call terminate_simulation

   stop
   end


# adder_op --- perform adder operation

   subroutine adder_op

   include "dmach_com.r.i"

   integer op_type (16)

   data op_type / _
      ARITH, LOGIC, LOGIC, ARITH, LOGIC, ARITH, LOGIC, LOGIC,
      LOGIC, LOGIC, ARITH, LOGIC, ARITH, LOGIC, LOGIC, ARITH /

   call x_input_select
   call y_input_select

   case Lu_adder_op {

      #  0 : X + Y
      if (Lu_inhibit_carry)
         Adder_output = add_without_carry (X_input, Y_input)
      else
         Adder_output = X_input + Y_input

      #  1 : ~(X | Y)
      Adder_output = not (or (X_input, Y_input))

      #  2 : ~X & Y
      Adder_output = and (not (X_input), Y_input)

      #  3 : X + Y + 1
      if (Lu_inhibit_carry)
         Adder_output = add_without_carry (X_input, Y_input + 1)
      else
         Adder_output = X_input + Y_input + 1

      #  4 : ~(X & Y)
      Adder_output = not (and (X_input, Y_input))

      #  5 : X + (X | Y)
      if (Lu_inhibit_carry)
         Adder_output = add_without_carry (X_input, or (X_input, Y_input))
      else
         Adder_output = X_input + or (X_input, Y_input)

      #  6 : X xor Y
      Adder_output = xor (X_input, Y_input)

      #  7 : X & ~Y
      Adder_output = and (X_input, not (Y_input))

      #  8 : ~X | Y
      Adder_output = or (not (X_input), Y_input)

      #  9 : X & Y | ~(X | Y)
      Adder_output = or (and (X_input, Y_input),
                           not (or (X_input, Y_input)))

      # 10 : X + (X & Y)
      if (Lu_inhibit_carry)
         Adder_output = add_without_carry (X_input,
                                             and (X_input, Y_input))
      else
         Adder_output = X_input + and (X_input, Y_input)

      # 11 : X & Y
      Adder_output = and (X_input, Y_input)

      # 12 : X - Y - 1
      Adder_output = X_input - Y_input - 1

      # 13 : X | ~Y
      Adder_output = or (X_input, not (Y_input))

      # 14 : X | Y
      Adder_output = or (X_input, Y_input)

      # 15 : X - Y
      if (Lu_inhibit_carry)
         Adder_output = add_without_carry (X_input, - Y_input)
      else
         Adder_output = X_input - Y_input
      }
   else
      call error ("in adder_op: can't happen.")

   Carry_in  = xor (X_input, Y_input, Adder_output)
   Carry_out = xor (and (X_input, Y_input), and (Adder_output, Carry_in))

   if (op_type (Lu_adder_op) == ARITH & ~ Lu_inhibit_carry)
      Aov = xor (Carry_in, Carry_out) < 0

   Mst = Adder_output < 0
   Lst = and (Adder_output, 1) ~= 0
   Abt = Adder_output == ALL_BITS_TRUE

   return
   end


# add_without_carry --- perform addition without byte carries

   longint function add_without_carry (x, y)
   longint x, y

   integer i, xx, yy

   add_without_carry = 0
   xx = x
   yy = y
   do i = 1, 4; {
      add_without_carry = xor (add_without_carry,
                               ls (rt (xx + yy, 8), i - 1))
      xx = rs (xx, 8)
      yy = rs (yy, 8)
      }

   return
   end


# barrel_switch --- simulate operation of barrel switch

   subroutine barrel_switch

   include "dmach_com.r.i"

   case Lu_shift_select {
      Bsw_output = Adder_output
      Bsw_output = rs (Adder_output, Sar)
      Bsw_output = ls (Adder_output, 32 - Sar)
      Bsw_output = xor ( _
                      ls (Adder_output, 32 - Sar),
                      rs (Adder_output, Sar))
      }
   else
      call error ("in barrel_switch: can't happen.")

   return
   end


# condition_adjust --- manipulate static conditions

   subroutine condition_adjust

   include "dmach_com.r.i"

   integer caj

   include "bit_field_dcl.r.i"

   caj = bit_field (Nano_instruction (1), 8, 10) + 1

   case caj {
      ;
      Lc2 = TRUE
      Gc2 = TRUE
     {Gc1 = FALSE; Gc2 = FALSE}
      Int = TRUE
      Lc3 = TRUE
      Gc1 = TRUE
      Lc1 = TRUE
      }
   else
      call error ("in condition_adjust: can't happen.")

   return
   end


# dump_s_memory --- dump contents of S-memory per user instructions

   subroutine dump_s_memory

   include "dmach_com.r.i"

   integer saddr, eaddr, i, j

   call input (STDIN,
      "*nS-memory dump -- Enter illegl start addr to quit*n.")
   repeat {
      call input (STDIN, "*nStarting address (1-2048): *i.", saddr)
      if (saddr < 1 | saddr > S_MEMORY_SIZE)
         break
      call input (STDIN, "Ending address           : *i.", eaddr)
      if (eaddr < 1 | eaddr > S_MEMORY_SIZE) {
         call remark ("Ending address out of range.")
         next
         }
      elif (saddr > eaddr) {
         call remark ("Addresses in backward order.")
         next
         }
      j = 0
      do i = saddr, eaddr; {
         if (mod (j, 4) == 0)    # list 4 words per line
            call print (STDOUT, "*n*4i.", i)
         if (Octal_output)
            call print (STDOUT, "*15,-8l.", S_memory (i))
         else
            call print (STDOUT, "*15l.", S_memory (i))
         j = j + 1
         }
      if (mod (j, 4) ~= 1)
         call putch (NEWLINE, STDOUT)
      }

   return
   end


# execute_type_1 --- simulate execution of a type 1 instruction

   subroutine execute_type_1

   include "dmach_com.r.i"

   call nano_fetch
   call set_condition

   if (N_lu_conditional & ~ Condition)
      Current_phase = 2    # in addition to phase 1
   else {
      Current_phase = 3    # in addition to phase 1
      Next_non_phase_1_fetch_addr = Micro_fetch_addr
      call barrel_switch
      call update_destinations
      call update_lu_controls
      }

   if (~ N_mdop_conditional | Condition) {
      call condition_adjust
      call mem_dev_operation
      }

   return
   end


# execute_type_2 --- simulate execution of a type 2 instruction

   subroutine execute_type_2

   include "dmach_com.r.i"
   include "bit_field_dcl.r.i"

   Current_phase = 2

   if (M_set_sar)
      Sar = xor (ls (bit_field (Micro_instruction, 3, 5), 2),
                     bit_field (Micro_instruction, 7, 8))

   if (M_set_lit)
      Lit = bit_field (Micro_instruction, 8, 16)

   if (M_set_ampcr)
      Ampcr = bit_field (Micro_instruction, 5, 16)

   return
   end


# initialize_simulation --- initialize the D-machine simulator

   subroutine initialize_simulation

   include "dmach_com.r.i"

   integer i
   character str (MAXLINE)

   call initialize_m_memory


   ### initialize the logic unit command registers:

   Lu_x_select = 1
   Lu_y_select = 1
   Lu_b_mask_high = 1
   Lu_b_mask_mid = 1
   Lu_b_mask_low = 1
   Lu_inhibit_carry = FALSE
   Lu_adder_op = 1
   Lu_shift_select = 1
   Lu_set_a1 = FALSE
   Lu_set_a2 = FALSE
   Lu_set_a3 = FALSE
   Lu_b_select = 1
   Lu_set_mir = FALSE
   Lu_set_ampcr = FALSE
   Lu_set_mar = FALSE
   Lu_lmar = FALSE
   Lu_set_br1 = FALSE
   Lu_set_br2 = FALSE
   Lu_ctr_select = 1
   Lu_sar_select = 1


   ### initialize the controlled logic components:

   A1 = 0
   A2 = 0
   A3 = 0
   B  = 0
   Ext = 0
   Mir = 0
   Sar = 0
   Lit = 0
   Ctr = 0
   Br1 = 0
   Br2 = 0
   Mar = 0
   Bmar = 0
   Gc1 = FALSE
   Gc2 = FALSE
   Lc1 = FALSE
   Lc2 = FALSE
   Lc3 = FALSE
   Cov = FALSE
   Sai = FALSE
   Rdc = FALSE
   Ex1 = FALSE
   Ex2 = FALSE
   Ex3 = FALSE
   Int = FALSE


   ### initialize the control logic components:

   Ampcr = 0
   Non_phase_1_fetch_addr = UNDEFINED
   Next_non_phase_1_fetch_addr = UNDEFINED
   Rdc_clock = 0
   Sai_clock = 0


   ### query user for option settings

   call input (STDIN, "Begin execution at address: *i.", Mpcr)
   Micro_fetch_addr = Mpcr
   call input (STDIN, "Number of clock cycles to simulate: *i.", Max_clock)
   call input (STDIN, "Number of cycles between traces: *i.", Trace_interval)
   call input (STDIN, "Begin tracing at address: *i.", Trace_start_addr)
   call input (STDIN, "End tracing at address: *i.", Trace_stop_addr)
   call input (STDIN, "Print S-memory and registers in octal? *s.", str)
   Octal_output = str (1) == 'y'c | str (1) == 'Y'c
   call input (STDIN, "Dump S-memory upon termination? *s.", str)
   Memory_dump = str (1) == 'y'c | str (1) == 'Y'c
   call initialize_s_memory

   return
   end


# initialize_m_memory --- read in the contents of micro- and nano-memory

   subroutine initialize_m_memory

   include "dmach_com.r.i"

   integer i, j, addr, n_addr, fd
   integer open, getlin, gctoi, getarg
   character line (MAXLINE), hex_file (MAXLINE)

   include "bit_field_dcl.r.i"

   if (getarg (1, hex_file, MAXLINE) == EOF)
      call error ("Usage: dmach <hex file>.")

   fd = open (hex_file, READ)
   if (fd == ERR)
      call cant (hex_file)

   while (getlin (line, fd) ~= EOF) {
DEBUG call print (ERROUT, "hex input: *s.", line)
      i = 1
      addr = gctoi (line, i, 10)
      M_memory (addr + 1) = gctoi (line, i, 16)
DEBUG call print (ERROUT, "M_mem (*i) = *,-16i.",
DEBUG       addr, M_memory (addr + 1))
      if (bit_field (M_memory (addr + 1), 1, 4) == 15) {    # type 1?
         n_addr = bit_field (M_memory (addr + 1), 5, 16)
         N_memory (1, n_addr + 1) = gctoi (line, i, 16)
         N_memory (2, n_addr + 1) = gctoi (line, i, 16)
         N_memory (3, n_addr + 1) = gctoi (line, i, 16)
         N_memory (4, n_addr + 1) = gctoi (line, i, 16)
DEBUG    call print (ERROUT, " N_mem (*i) = *,-16i *,-16i *,-16i *,-16i.",
DEBUG       n_addr, N_memory (1, n_addr + 1), N_memory (2, n_addr + 1),
DEBUG       N_memory (3, n_addr + 1), N_memory (4, n_addr + 1))
         }
DEBUG call putch (NEWLINE, ERROUT)
      }

   call close (fd)

   return
   end


# initialize_s_memory --- query the user for S-memory contents

   subroutine initialize_s_memory

   include "dmach_com.r.i"

   integer saddr, eaddr, i
   integer mapsu
   logical stdin_is_tty

   stdin_is_tty = mapsu (STDIN) == TTY

   call input (STDIN,
      "*nLoad S-memory -- Enter illegal start addr to quit*n.")
   repeat {
      call input (STDIN, "*nStarting address (1-2048): *i.", saddr)
      if (saddr < 1 | saddr > S_MEMORY_SIZE)
         break
      call input (STDIN, "Ending address           : *i.", eaddr)
      if (eaddr < 1 | eaddr > S_MEMORY_SIZE) {
         call remark ("Ending address out of range.")
         next
         }
      elif (saddr > eaddr) {
         call remark ("Addresses in backward order.")
         next
         }
      do i = saddr, eaddr; {
         if (stdin_is_tty)
            call print (ERROUT, "Smem (*i) = .", i)
         call input (STDIN, "*l.", S_memory (i))
         }
      }

   return
   end


# initiate_clock_cycle --- set up for a new clock cycle

   subroutine initiate_clock_cycle

   include "dmach_com.r.i"


   ### check for external events comming due in this cycle

   if (Rdc_clock == Clock) {
      Rdc = TRUE
      Rdc_clock = 0
      Ext = Memory_data
      }

   if (Sai_clock == Clock) {
      Sai = TRUE
      Sai_clock = 0
      }

   return
   end


# mem_dev_operation --- perform requested memory/device operation

   subroutine mem_dev_operation

   include "dmach_com.r.i"

   integer mdop, temp

   include "bit_field_dcl.r.i"

   mdop = bit_field (Nano_instruction (4), 3, 6)

   if (mdop == 0)    # nothing to do
      return

   if (mdop ~= 2 & mdop ~= 3 & mdop ~= 6 & mdop ~= 7) {
      call print (STDOUT,
         "*nError -- Bad external operation (*i)*n.", mdop)
      return
      }

   if (mdop == 2 | mdop == 6)    # MR1 or MW1
      Bmar = xor (ls (Br1, 8), Mar)
   else                          # MR2 or MW2
      Bmar = xor (ls (Br2, 8), Mar)

   if (Bmar < 1 | Bmar > S_MEMORY_SIZE) {
      call print (STDOUT, "*nError -- S-memory address out of range*n.")
      call terminate_simulation
      stop
      }

   if (mdop == 2 | mdop == 3) {  # memory read
      if (Rdc_clock ~= 0)
         call print (STDOUT, "*nError -- Memory not ready for read*n.")
      Memory_data = S_memory (Bmar)
      Rdc_clock = Clock + MEMORY_READ_CYCLE_TIME
      }
   else {
      if (Sai_clock ~= 0)
         call print (STDOUT, "*nError -- Memory not ready for write*n.")
      S_memory (Bmar) = Mir
      Sai_clock = Clock + MEMORY_WRITE_CYCLE_TIME
      }

   return
   end


# micro_fetch --- fetch and decode the next micro instruction

   subroutine micro_fetch

   include "dmach_com.r.i"
   include "bit_field_dcl.r.i"

   Micro_instruction = M_memory (Micro_fetch_addr + 1)

   M_type_1 = bit_field (Micro_instruction, 1, 4) == 15
   if (M_type_1) {
      M_set_sar = FALSE
      M_set_lit = FALSE
      M_set_ampcr = FALSE
      Nano_fetch_addr = bit_field (Micro_instruction, 5, 16)
      }
   else {
      M_set_sar = bit_field (Micro_instruction, 1, 2) == 0 _
                | bit_field (Micro_instruction, 1, 2) == 2
      M_set_lit = bit_field (Micro_instruction, 1, 2) == 2 _
                | bit_field (Micro_instruction, 1, 4) == 14
      M_set_ampcr = bit_field (Micro_instruction, 1, 4) == 12
      }

   return
   end


# nano_fetch --- fetch and decode next nano instruction

   subroutine nano_fetch

   include "dmach_com.r.i"
   include "bit_field_dcl.r.i"

   Nano_instruction (1) = N_memory (1, Nano_fetch_addr + 1)
   Nano_instruction (2) = N_memory (2, Nano_fetch_addr + 1)
   Nano_instruction (3) = N_memory (3, Nano_fetch_addr + 1)
   Nano_instruction (4) = N_memory (4, Nano_fetch_addr + 1)

   N_condition_select   = bit_field (Nano_instruction (1),  1,  4) + 1
   N_true_condition     = bit_field (Nano_instruction (1),  5,  5) == 1
   N_lu_conditional     = bit_field (Nano_instruction (1),  6,  6) == 1
   N_mdop_conditional   = bit_field (Nano_instruction (1),  7,  7) == 1

   return
   end


# print_state --- print the state of the D-machine

   subroutine print_state

   include "dmach_com.r.i"

   call print (STDOUT,
      "*nClock: *5i               Phase 1 addr: *4i.",
      Clock, Micro_fetch_addr)
   if (Non_phase_1_fetch_addr ~= UNDEFINED)
      call print (STDOUT, "            Phase *i addr: *4i.",
         Current_phase, Non_phase_1_fetch_addr)
   call putch (NEWLINE, STDOUT)

   if (Octal_output) {
      call print (STDOUT,
         "A1: *11,-8l     Lit :  *3,8i     Ctr :  *3,8i"_
         "Sar :   *2,8i     Ampc: *4,8i*n.",
         A1, Lit, Ctr, Sar, Ampcr)

      call print (STDOUT,
         "A2: *11,-8l     Br1 :  *3,8i     Br2 :  *3,8i"_
         "Mar :  *3,8i     Bmar: *4,8i*n.",
         A2, Br1, Br2, Mar, Bmar)

      call print (STDOUT,
         "A3: *11,-8l     B   : *11,-8l             Mir : *11,-8l*n.",
         A3, B, Mir)
      }

   else {      # output format is decimal
      call print (STDOUT,
         "A1: *11l     Lit :  *3i     Ctr :  *3i"_
         "Sar :   *2i     Ampc: *4i*n.",
         A1, Lit, Ctr, Sar, Ampcr)

      call print (STDOUT,
         "A2: *11l     Br1 :  *3i     Br2 :  *3i"_
         "Mar :  *3i     Bmar: *4i*n.",
         A2, Br1, Br2, Mar, Bmar)

      call print (STDOUT,
         "A3: *11l     B   : *11l             Mir: *11l*n.",
         A3, B, Mir)
      }

   call print (STDOUT,
      "Mst  Lst  Abt  Aov  Cov  Sai  Rdc  Gc1"_
      "Gc2  Lc1  Lc2  Lc3  Ex1  Ex2  Ex3  Int*n.")

   call print (STDOUT,
      " *i    *i    *i    *i    *i    *i    *i    *i   .",
      Mst, Lst, Abt, Aov, Cov, Sai, Rdc, Gc1)

   call print (STDOUT,
      " *i    *i    *i    *i    *i    *i    *i    *i*n.",
      Gc2, Lc1, Lc2, Lc3, Ex1, Ex2, Ex3, Int)

   return
   end


# select_successor_address --- select next micro instruction address

   subroutine select_successor_address

   include "dmach_com.r.i"

   integer successor, temp

   include "bit_field_dcl.r.i"

   if (~ M_type_1) {    # this was a type 2 instruction
      Mpcr = Mpcr + 1   # successor is STEP
      Micro_fetch_addr = Mpcr
      }
   else {               # this was a type 1 instruction
      if (Condition)
         successor = bit_field (Nano_instruction (1), 11, 13) + 1
      else
         successor = bit_field (Nano_instruction (1), 14, 16) + 1

      case successor {
         ;                                # WAIT
         Mpcr = Mpcr + 1                  # STEP
         {                                # SAVE
            Ampcr = Mpcr
            Mpcr = Mpcr + 1
            }
         Mpcr = Mpcr + 2                  # SKIP
         Mpcr = Ampcr + 1                 # JUMP
         Micro_fetch_addr = Ampcr + 1     # EXEC
         {                                # CALL
            temp = Mpcr
            Mpcr = Ampcr + 1
            Ampcr = temp
            }
         Mpcr = Ampcr + 2                 # RETN
         }
      else
         call error ("in select_successor_address: can't happen.")

      if (successor ~= 6)  # if not EXEC then ...
         Micro_fetch_addr = Mpcr
      }

   return
   end


# set_condition --- decide if conditional commands are to be performed

   subroutine set_condition

   include "dmach_com.r.i"

   logical test

   case N_condition_select {
      test = Gc1
      test = Gc2
     {test = Lc1; Lc1 = FALSE}
     {test = Lc2; Lc2 = FALSE}
      test = Mst
      test = Lst
      test = Abt
      test = Aov
     {test = Cov; Cov = FALSE}
     {test = Sai; Sai = FALSE}
     {test = Rdc; Rdc = FALSE}
     {test = Lc3; Lc3 = FALSE}
     {test = Ex1; Ex1 = FALSE}
     {test = Int; Int = FALSE}
     {test = Ex2; Ex2 = FALSE}
     {test = Ex3; Ex3 = FALSE}
      }
   else
      call error ("in set_condition: can't happen.")

   if (N_true_condition)
      Condition = test
   else
      Condition = ~test

   return
   end


# terminate_clock_cycle --- clean up at the end of a clock cycle

   subroutine terminate_clock_cycle

   include "dmach_com.r.i"

   Non_phase_1_fetch_addr = Next_non_phase_1_fetch_addr

   return
   end


# terminate_simulation --- clean up the D-machine simulator

   subroutine terminate_simulation

   include "dmach_com.r.i"

   call print (STDOUT, "*nEnd of Simulation - Machine State is:*n.")
   call print_state
   if (Memory_dump)
      call dump_s_memory

   return
   end


# trace_info --- print trace information for last cycle per options

   subroutine trace_info

   include "dmach_com.r.i"

   if (Micro_fetch_addr >= Trace_start_addr
     && Micro_fetch_addr <= Trace_stop_addr
     && mod (Clock, Trace_interval) == 0)
      call print_state

   return
   end


# update_b_register --- select the input to the B register

   subroutine update_b_register

   include "dmach_com.r.i"

   case Lu_b_select {
      ;                                   # No change
      B = 0                               # BC4
      B = Adder_output                    # BAD
      B = 0                               # BC8
      B = or (Bsw_output, Adder_output)   # BBA
      B = Bsw_output                      # B
      B = Ext                             # BEX
      B = Mir                             # BMI
      B = or (Bsw_output, Ext)            # BBE
      B = or (Bsw_output, Mir)            # BBI
      }
   else
      call error ("in update_b_register: can't happen.")

   return
   end


# update_ctr --- update the Ctr register

   subroutine update_ctr

   include "dmach_com.r.i"

   case Lu_ctr_select {
      ;
      {  # ~ Lit
         Cov = FALSE
         Ctr = and (not (Lit), MASK_LOW_BYTE)
         }
      {  # Inc
         Ctr = Ctr + 1
         if (Ctr > 255) {
            Ctr = 0
            Cov = TRUE
            }
         }
      {  # ~ Bsw
         Cov = FALSE
         Ctr = and (not (Bsw_output), MASK_LOW_BYTE)
         }
      }
   else
      call error ("in update_ctr: can't happen.")

   return
   end


# update_destinations --- clock all selected destination registers

   subroutine update_destinations

   include "dmach_com.r.i"

   if (Lu_set_a1)
      A1 = Bsw_output
   if (Lu_set_a2)
      A2 = Bsw_output
   if (Lu_set_a3)
      A3 = Bsw_output

   call update_b_register

   if (Lu_set_mir)
      Mir = Bsw_output
   if (Lu_set_ampcr)
      Ampcr = and (Bsw_output, MASK_LOW_12_BITS)
   if (Lu_set_br1)
      Br1 = and (rs (Bsw_output, 8), MASK_LOW_BYTE)
   if (Lu_set_br2)
      Br2 = and (rs (Bsw_output, 8), MASK_LOW_BYTE)
   if (Lu_set_mar)
      if (Lu_lmar)
         Mar = Lit
      else
         Mar = and (Bsw_output, MASK_LOW_BYTE)

   call update_ctr
   call update_sar

   return
   end


# update_lu_controls --- update logic unit control register

   subroutine update_lu_controls

   include "dmach_com.r.i"
   include "bit_field_dcl.r.i"

   Lu_x_select           = bit_field (Nano_instruction (2),  1,  3) + 1
   Lu_y_select           = bit_field (Nano_instruction (2),  6,  8) + 1
   Lu_b_mask_high        = bit_field (Nano_instruction (2),  4,  5) + 1
   Lu_b_mask_mid         = bit_field (Nano_instruction (2),  6,  6) + 1
   Lu_b_mask_low         = bit_field (Nano_instruction (2),  9, 10) + 1
   Lu_inhibit_carry      = bit_field (Nano_instruction (2), 11, 11) == 1
   Lu_adder_op           = bit_field (Nano_instruction (2), 12, 15) + 1
   Lu_shift_select       = bit_field (Nano_instruction (2), 16, 16) * 2 _
                         + bit_field (Nano_instruction (3),  1,  1) + 1
   Lu_set_a1             = bit_field (Nano_instruction (3),  2,  2) == 1
   Lu_set_a2             = bit_field (Nano_instruction (3),  3,  3) == 1
   Lu_set_a3             = bit_field (Nano_instruction (3),  4,  4) == 1
   Lu_b_select           = bit_field (Nano_instruction (3),  5,  8) - 5
   if (Lu_b_select < 0)
      Lu_b_select = Lu_b_select + 6
   Lu_set_mir            = bit_field (Nano_instruction (3),  9,  9) == 1
   Lu_set_ampcr          = bit_field (Nano_instruction (3), 10, 10) == 1
   Lu_set_mar            = bit_field (Nano_instruction (3), 13, 13) == 1
   Lu_lmar               = bit_field (Nano_instruction (3), 13, 14) == 2
   Lu_set_br1            = bit_field (Nano_instruction (3), 11, 11) == 1
   Lu_set_br2            = bit_field (Nano_instruction (3), 12, 12) == 1
   Lu_ctr_select         = bit_field (Nano_instruction (3), 15, 16) + 1
   if (Lu_ctr_select == 2   # from Lit or Barrel Switch?
     && bit_field (Nano_instruction (3), 14, 14) == 1)
      Lu_ctr_select = 4
   Lu_sar_select         = bit_field (Nano_instruction (4),  1,  2) + 1

   return
   end


# update_sar --- update the Shift Amount Register

   subroutine update_sar

   include "dmach_com.r.i"

   case Lu_sar_select {
      ;                 # No change
      Sar = 32 - Sar    # CSAR
      Sar = and ( _     # SAR
               xor ( _
                  and (rs (Bsw_output, 1), not (MASK_LOW_2_BITS)),
                  and (Bsw_output, MASK_LOW_2_BITS)),
               MASK_LOW_5_BITS)
      }
   else
      call error ("in update_sar: can't happen.")

   return
   end


# x_input_select --- select the X adder input

   subroutine x_input_select

   include "dmach_com.r.i"

   case Lu_x_select {
      X_input = 0
      X_input = Lit
      X_input = Ext
      X_input = ls (Ctr, 24)
      X_input = xor (ls (Ctr, 24), Lit)
      X_input = A1
      X_input = A2
      X_input = A3
      }
   else
      call error ("in x_input_select: can't happen.")

   return
   end


# y_input_from_masked_b_register --- the name is self-explanatory

   subroutine y_input_from_masked_b_register

   include "dmach_com.r.i"

   longint b_high, b_mid, b_low

   case Lu_b_mask_high {
      b_high = 0                             # B.0xx
      b_high = and (B, MASK_HIGH_BIT)        # B.Txx
      b_high = and (not (B), MASK_HIGH_BIT)  # B.Fxx
      b_high = MASK_HIGH_BIT                 # B.1xx
      }
   else
      call error ("in y_input_from_masked_b_register: can't happen.")

   case Lu_b_mask_mid {
      b_mid = 0                              # B.x0x
      b_mid = and (B, MASK_CENTER_BITS)      # B.xTx
      }
   else
      call error ("in y_input_from_masked_b_register: can't happen.")

   case Lu_b_mask_low {
      b_low = 0                              # B.xx0
      b_low = and (B, MASK_LOW_BIT)          # B.xxT
      b_low = and (not (B), MASK_LOW_BIT)    # B.xxF
      b_low = MASK_LOW_BIT                   # B.xx1
      }
   else
      call error ("in y_input_from_masked_b_register: can't happen.")

   Y_input = xor (b_high, b_mid, b_low)

   return
   end


# y_input_select --- select the Y adder input

   subroutine y_input_select

   include "dmach_com.r.i"

   case Lu_y_select {
      call y_input_from_masked_b_register
      Y_input = Lit
      Y_input = Ext
      Y_input = ls (Ctr, 24)
      call y_input_from_masked_b_register
      Y_input = xor (ls (Ctr, 24), Lit)
      Y_input = Ampcr
      Y_input = Bmar
      }

   return
   end
