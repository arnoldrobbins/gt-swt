include "dmach_def.r.i"

# dmach --- Burroughs D-machine simulator

   include DMACH_COMMON

   call initialize_simulation

   for (Clock = 1; Clock <= Max_clock; Clock += 1) {
      call initiate_clock_cycle
      call micro_fetch
      if (Micro_instruction == HALT)
         break
      if (~ M_type_1)
         call execute_type_2
      call adder_op
      call barrel_switch
      if (M_type_1)
         call execute_type_1
      call terminate_clock_cycle
      call trace_info
      call select_successor_address
      }

   call terminate_simulation

   stop
   end


# adder_op --- perform adder operation

   subroutine adder_op

   include DMACH_COMMON

   longint x, y
   longint add_without_carry
   integer op_type (16)
   data op_type / _
      ARITH, LOGIC, LOGIC, ARITH, LOGIC, ARITH, LOGIC, LOGIC,
      LOGIC, LOGIC, ARITH, LOGIC, ARITH, LOGIC, LOGIC, ARITH /

   call x_input_select
   call y_input_select
   x = X_input
   y = Y_input

   select (Lu_adder_op)

      when ( 0)      # X + Y
         if (Lu_inhibit_carry)
            Adder_output = add_without_carry (x, y)
         else
            Adder_output = x + y

      when ( 1)      # ~(X | Y)
         Adder_output = not (or (x, y))

      when ( 2)      # ~X & Y
         Adder_output = and (not (x), y)

      when ( 3) {    # X + Y + 1
         y += 1
         if (Lu_inhibit_carry)
            Adder_output = add_without_carry (x, y)
         else
            Adder_output = x + y
         }

      when ( 4)      # ~(X & Y)
         Adder_output = not (and (x, y))

      when ( 5) {    # X + (X | Y)
         y |= x
         if (Lu_inhibit_carry)
            Adder_output = add_without_carry (x, y)
         else
            Adder_output = x + y
         }

      when ( 6)      # X xor Y
         Adder_output = xor (x, y)

      when ( 7)      # X & ~Y
         Adder_output = and (x, not (y))

      when ( 8)      # ~X | Y
         Adder_output = or (not (x), y)

      when ( 9)      # X & Y | ~(X | Y)
         Adder_output = or (and (x, y), not (or (x, y)))

      when (10) {    # X + (X & Y)
         y &= x
         if (Lu_inhibit_carry)
            Adder_output = add_without_carry (x, y)
         else
            Adder_output = x + y
         }

      when (11)      # X & Y
         Adder_output = and (x, y)

      when (12) {    # X - Y - 1
         y = -y - 1
         if (Lu_inhibit_carry)
            Adder_output = add_without_carry (x, y)
         else
            Adder_output = x + y
         }

      when (13)      # X | ~Y
         Adder_output = or (x, not (y))

      when (14)      # X | Y
         Adder_output = or (x, y)

      when (15) {    # X - Y
         y = -y
         if (Lu_inhibit_carry)
            Adder_output = add_without_carry (x, y)
         else
            Adder_output = x + y
         }
   else
      call error ("in adder_op: can't happen"s)

   if (op_type (Lu_adder_op + 1) == ARITH) {
      Carry_in  = xor (x, y, Adder_output)
      Carry_out = or (and (x, y), and (y, Carry_in), and (x, Carry_in))
      }
   else {
      Carry_in = 0
      Carry_out = 0
      }

   Mst = (Adder_output < 0)
   Lst = (and (Adder_output, 1) ~= 0)
   Abt = (Adder_output == ALL_BITS_TRUE)
   Aov = (Carry_out < 0)

DB call print (ERROUT, "Adder output:*21t*l*n"s, Adder_output)
DB call print (ERROUT, "Aov=*b, Mst=*b, Lst=*b, Abt=*b*n"s,
DB                      Aov,    Mst,    Lst,    Abt)

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
      add_without_carry ^= ls (rt (xx + yy, 8), i - 1)
      xx = rs (xx, 8)
      yy = rs (yy, 8)
      }

   return
   end


# barrel_switch --- simulate operation of barrel switch

   subroutine barrel_switch

   include DMACH_COMMON

   select (Lu_shift_select)
      when (0)
         Bsw_output = Adder_output
      when (1)
         Bsw_output = rs (Adder_output, Sar)
      when (2)
         Bsw_output = ls (Adder_output, 32 - Sar)
      when (3)
         Bsw_output = xor ( _
                         ls (Adder_output, 32 - Sar),
                         rs (Adder_output, Sar))
   else
      call error ("in barrel_switch: can't happen"s)

DB call print (ERROUT, "Bsw output:*21t*l*n"s, Bsw_output)

   return
   end


# condition_adjust --- manipulate static conditions

   subroutine condition_adjust

   include DMACH_COMMON

   integer caj

   caj = bit_field (Nano_instruction (1), 8, 10)
   select (caj)
      when (0)
         ;
      when (1)
         Lc2 = TRUE
      when (2)
         Gc2 = TRUE
      when (3) {
         Gc1 = FALSE
         Gc2 = FALSE
         }
      when (4)
         Int = TRUE
      when (5)
         Lc3 = TRUE
      when (6)
         Gc1 = TRUE
      when (7)
         Lc1 = TRUE
   else
      call error ("in condition_adjust: can't happen"s)

DB call print (ERROUT, "Caj command is *i*n"s, caj)

   return

   include BIT_FIELD_FUNC

   end


# dump_s_memory --- dump contents of S-memory per user instructions

   subroutine dump_s_memory

   include DMACH_COMMON

   integer saddr, eaddr, i, j
   integer isatty
   logical stdin_is_tty

   stdin_is_tty = (isatty (STDIN) ~= NO)

   if (stdin_is_tty)
      call print (TTY,
         "*nS-memory dump -- Enter <return> to quit*n"s)
   repeat {
      if (stdin_is_tty)
         call putch (NEWLINE, TTY)
      call input (STDIN, "Starting address (1-2048): *i"s, saddr)
      if (saddr < 1 || saddr > S_MEMORY_SIZE)
         break
      call input (STDIN, "Ending address           : *i"s, eaddr)
      if (eaddr < 1 || eaddr > S_MEMORY_SIZE) {
         call remark ("Ending address out of range"s)
         next
         }
      elif (saddr > eaddr) {
         call remark ("Addresses in backward order"s)
         next
         }
      j = 0
      do i = saddr, eaddr; {
         if (and (j, 1) == 0)    # list 2 words per line
            call putch (NEWLINE, STDOUT)
         call print (STDOUT, "Smem (*i)*13t= "s, i)
         if (Octal_output)
            call print (STDOUT, "*-15,-8l"s, S_memory (i))
         else
            call print (STDOUT, "*-15l"s, S_memory (i))
         j += 1
         }
      if (mod (j, 4) ~= 1)
         call putch (NEWLINE, STDOUT)
      }

   return
   end


# execute_type_1 --- simulate execution of a type 1 instruction

   subroutine execute_type_1

   include DMACH_COMMON

   call nano_fetch         # fetch enough to test the condition
   call set_condition      # test condition

   if (N_lu_conditional && ~ Condition)   # don't do lu-op for this nano
      Current_phase = 2    # in addition to phase 1

   else {                  # do lu-op for this nano during next cycle
      Current_phase = 3    # do phase 3 for last nano during this cycle
      call update_destinations   # complete last nano instruction
      call update_lu_controls    # set up for phase 3 of this nano
      Next_non_phase_1_fetch_addr = Micro_fetch_addr
      }

   if (~ N_mdop_conditional || Condition) {
      call condition_adjust
      call mem_dev_operation
      }


   return
   end


# execute_type_2 --- simulate execution of a type 2 instruction

   subroutine execute_type_2

   include DMACH_COMMON

   Current_phase = 2    # phase 3 comes only at start of new lu-op

   if (M_set_sar) {
      Sar = xor (ls (bit_field (Micro_instruction, 3, 5), 2),
                     bit_field (Micro_instruction, 7, 8))
DB    call print (ERROUT, "Sar set to:*21t*i*n"s, Sar)
      }

   if (M_set_lit) {
      Lit = bit_field (Micro_instruction, 9, 16)
DB    call print (ERROUT, "Lit set to:*21t*i*n"s, Lit)
      }

   if (M_set_ampcr) {
      Ampcr = bit_field (Micro_instruction, 5, 16)
DB    call print (ERROUT, "Ampcr set to:*21t*i*n"s, Ampcr)
      }

   return

   include BIT_FIELD_FUNC

   end


# initialize_simulation --- initialize the D-machine simulator

   subroutine initialize_simulation

   include DMACH_COMMON

   integer i
   character str (MAXLINE)

   call initialize_m_memory


   ### initialize the logic unit command registers:

   Lu_x_select = 0
   Lu_y_select = 0
   Lu_b_mask_high = 0
   Lu_b_mask_mid = 0
   Lu_b_mask_low = 0
   Lu_inhibit_carry = FALSE
   Lu_adder_op = 0
   Lu_shift_select = 0
   Lu_set_a1 = FALSE
   Lu_set_a2 = FALSE
   Lu_set_a3 = FALSE
   Lu_b_select = 0
   Lu_set_mir = FALSE
   Lu_set_ampcr = FALSE
   Lu_set_mar = FALSE
   Lu_lmar = FALSE
   Lu_set_br1 = FALSE
   Lu_set_br2 = FALSE
   Lu_ctr_select = 0
   Lu_sar_select = 0


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

   call input (STDIN, "Begin execution at address: *i"s, Mpcr)
   Micro_fetch_addr = Mpcr
   call input (STDIN, "Number of clock cycles to simulate: *i"s, Max_clock)
   call input (STDIN, "Number of cycles between traces: *i"s, Trace_interval)
   call input (STDIN, "Begin tracing at address: *i"s, Trace_start_addr)
   call input (STDIN, "End tracing at address: *i"s, Trace_stop_addr)
   call input (STDIN, "Print S-memory and registers in octal? *s"s, str)
   Octal_output = (str (1) == 'y'c | str (1) == 'Y'c)
   call input (STDIN, "Dump S-memory upon termination? *s"s, str)
   Memory_dump = (str (1) == 'y'c | str (1) == 'Y'c)
   call initialize_s_memory

   return
   end


# initialize_m_memory --- read in the contents of micro- and nano-memory

   subroutine initialize_m_memory

   include DMACH_COMMON

   integer i, j, addr, n_addr, fd
   integer open, getlin, gctoi, getarg
   character line (MAXLINE), hex_file (MAXLINE)

   if (getarg (1, hex_file, MAXLINE) == EOF)
      call error ("Usage: dmach <hex file>"s)

   fd = open (hex_file, READ)
   if (fd == ERR)
      call cant (hex_file)

   while (getlin (line, fd) ~= EOF) {
DEBUG call print (ERROUT, "hex input: *s"s, line)
      i = 1
      addr = gctoi (line, i, 16)
      M_memory (addr + 1) = gctoi (line, i, 16)
DEBUG call print (ERROUT, "M_mem (*i) = *,-16i"s,
DEBUG       addr, M_memory (addr + 1))
      if (bit_field (M_memory (addr + 1), 1, 4) == 15) {    # type 1?
         n_addr = bit_field (M_memory (addr + 1), 5, 16)
         N_memory (1, n_addr + 1) = gctoi (line, i, 16)
         N_memory (2, n_addr + 1) = gctoi (line, i, 16)
         N_memory (3, n_addr + 1) = gctoi (line, i, 16)
         N_memory (4, n_addr + 1) = gctoi (line, i, 16)
DEBUG    call print (ERROUT, " N_mem (*i) = *,-16i *,-16i *,-16i *,-16i"s,
DEBUG       n_addr, N_memory (1, n_addr + 1), N_memory (2, n_addr + 1),
DEBUG       N_memory (3, n_addr + 1), N_memory (4, n_addr + 1))
         }
DEBUG call putch (NEWLINE, ERROUT)
      }
   M_memory (addr + 2) = 16r4000    # put in a HALT instruction

   call close (fd)

   return

   include BIT_FIELD_FUNC

   end


# initialize_s_memory --- query the user for S-memory contents

   subroutine initialize_s_memory

   include DMACH_COMMON

   integer saddr, eaddr, i
   integer isatty
   bool stdin_is_tty

   stdin_is_tty = (isatty (STDIN) ~= NO)

   if (stdin_is_tty)
      call print (TTY,
         "*nLoad S-memory -- Enter <return> to quit*n"s)
   repeat {
      if (stdin_is_tty)
         call putch (NEWLINE, TTY)
      call input (STDIN, "Starting address (1-2048): *i"s, saddr)
      if (saddr < 1 || saddr > S_MEMORY_SIZE)
         break
      call input (STDIN, "Ending address           : *i"s, eaddr)
      if (eaddr < 1 || eaddr > S_MEMORY_SIZE) {
         call remark ("Ending address out of range"s)
         next
         }
      elif (saddr > eaddr) {
         call remark ("Addresses in backward order"s)
         next
         }
      do i = saddr, eaddr; {
         if (stdin_is_tty)
            call print (TTY, "Smem (*i)*13t= "s, i)
         call input (STDIN, "*l"s, S_memory (i))
         }
      }

   return
   end


# initiate_clock_cycle --- set up for a new clock cycle

   subroutine initiate_clock_cycle

   include DMACH_COMMON


   ### check for external events comming due in this cycle

DB call print (ERROUT, "*nStarting cycle *i*n"s, Clock)

   Non_phase_1_fetch_addr = Next_non_phase_1_fetch_addr

   if (Rdc) {
      Ext = Memory_data
DB    call print (ERROUT, "Memory read completed*n"s)
      }

DB if (Sai)
DB    call print (ERROUT, "Memory write completed*n"s)

   return
   end


# mem_dev_operation --- perform requested memory/device operation

   subroutine mem_dev_operation

   include DMACH_COMMON

   integer mdop, temp

   mdop = bit_field (Nano_instruction (4), 3, 6)

   if (mdop == 0)    # nothing to do
      return

   if (mdop ~= 2 && mdop ~= 3 && mdop ~= 6 && mdop ~= 7) {
      call print (STDOUT,
         "*nError -- Bad external operation (*i)*n"s, mdop)
      return
      }

   if (mdop == 2 || mdop == 6)   # MR1 or MW1
      Bmar = xor (ls (Br1, 8), Mar)
   else                          # MR2 or MW2
      Bmar = xor (ls (Br2, 8), Mar)

   if (Bmar < 1 || Bmar > S_MEMORY_SIZE) {
      call print (STDOUT, "*nError -- S-memory address out of range*n"s)
      call terminate_simulation
      stop
      }

   if (mdop == 2 || mdop == 3) {    # memory read
      if (Rdc_clock ~= 0)
         call print (STDOUT, "*nError -- Memory not ready for read*n"s)
      Memory_data = S_memory (Bmar)
      Rdc_clock = Clock + MEMORY_READ_CYCLE_TIME
      }
   else {
      if (Sai_clock ~= 0)
         call print (STDOUT, "*nError -- Memory not ready for write*n"s)
      S_memory (Bmar) = Mir
      Sai_clock = Clock + MEMORY_WRITE_CYCLE_TIME
      }

   return

   include BIT_FIELD_FUNC

   end


# micro_fetch --- fetch and decode the next micro instruction

   subroutine micro_fetch

   include DMACH_COMMON

   Micro_instruction = M_memory (Micro_fetch_addr + 1)
DB call print (ERROUT, "mfetch (*i) = *4,-16,0i*n"s,
DB    Micro_fetch_addr, Micro_instruction)

   M_type_1 = (bit_field (Micro_instruction, 1, 4) == 15)
   if (M_type_1) {
      M_set_sar = FALSE
      M_set_lit = FALSE
      M_set_ampcr = FALSE
      Nano_fetch_addr = bit_field (Micro_instruction, 5, 16)
DB    call print (ERROUT, "type 1, nano at *i*n"s, Nano_fetch_addr)
      }
   else {
      M_set_sar = (bit_field (Micro_instruction, 1, 2) == 0 _
                  | bit_field (Micro_instruction, 1, 2) == 2)
      M_set_lit = (bit_field (Micro_instruction, 1, 2) == 2 _
                  | bit_field (Micro_instruction, 1, 4) == 14)
      M_set_ampcr = (bit_field (Micro_instruction, 1, 4) == 12)
DB    call print (ERROUT, "type 2, sar=*y, lit=*y, ampcr=*y*n"s,
DB       M_set_sar, M_set_lit, M_set_ampcr)
      }

   return

   include BIT_FIELD_FUNC

   end


# nano_fetch --- fetch and decode next nano instruction

   subroutine nano_fetch

   include DMACH_COMMON

   Nano_instruction (1) = N_memory (1, Nano_fetch_addr + 1)
   Nano_instruction (2) = N_memory (2, Nano_fetch_addr + 1)
   Nano_instruction (3) = N_memory (3, Nano_fetch_addr + 1)
   Nano_instruction (4) = N_memory (4, Nano_fetch_addr + 1)

   N_condition_select   = bit_field (Nano_instruction (1),  1,  4)

   N_true_condition     = (bit_field (Nano_instruction (1),  5,  5) == 1)
   N_lu_conditional     = (bit_field (Nano_instruction (1),  6,  6) == 1)
   N_mdop_conditional   = (bit_field (Nano_instruction (1),  7,  7) == 1)

DB call print (ERROUT, "nfetch (*i) = *4,-16,0u*i *i *i *i*1n"s,
DB    Nano_fetch_addr, Nano_instruction (1), Nano_instruction (2),
DB    Nano_instruction (3), Nano_instruction (4))

   return

   include BIT_FIELD_FUNC

   end


# print_state --- print the state of the D-machine

   subroutine print_state

   include DMACH_COMMON

   call putch (NEWLINE, STDOUT)
   if (Non_phase_1_fetch_addr ~= UNDEFINED)
      call print (STDOUT, "Phase *i Mpcr: *-4i*n"s,
         Current_phase, Non_phase_1_fetch_addr)

   if (Octal_output) {
      call print (STDOUT,
         "Clock: *-5i*4xA1: *-11,-8l*4xB   : *-11,-8l*4x" _
         "Ctr: *-4,-8i*4xBr1: *-4,-8i*n"s,
         Clock, A1, B, Ctr, Br1)

      call print (STDOUT,
         "Mpcr : *-5i*4xA2: *-11,-8l*4xMir : *-11,-8l*4x" _
         "Lit: *-4,-8i*4xBr2: *-4,-8i*n"s,
         Mpcr, A2, Mir, Lit, Br2)

      call print (STDOUT,
         "Ampcr: *-5i*4xA3: *-11,-8l*4xBmar: *-11,-8i*4x" _
         "Sar: *-4,-8i*4xMar: *-4,-8i*n"s,
         Ampcr, A3, Bmar, Sar, Mar)
      }

   else {      # output format is decimal
      call print (STDOUT,
         "Clock: *-5i*4xA1: *-11l*4xB   : *-11l*4x" _
         "Ctr: *-4i*4xBr1: *-4i*n"s,
         Clock, A1, B, Ctr, Br1)

      call print (STDOUT,
         "Mpcr : *-5i*4xA2: *-11l*4xMir : *-11l*4x" _
         "Lit: *-4i*4xBr2: *-4i*n"s,
         Mpcr, A2, Mir, Lit, Br2)

      call print (STDOUT,
         "Ampcr: *-5i*4xA3: *-11l*4xBmar: *-11i*4x" _
         "Sar: *-4i*4xMar: *-4i*n"s,
         Ampcr, A3, Bmar, Sar, Mar)
      }

   call print (STDOUT,
      "Mst  Lst  Abt  Aov  Cov  Sai  Rdc  Gc1  " _
      "Gc2  Lc1  Lc2  Lc3  Ex1  Ex2  Ex3  Int*n"s)

   call print (STDOUT,
      " *i*4x*i*4x*i*4x*i*4x*i*4x*i*4x*i*4x*i*4x"s,
      Mst, Lst, Abt, Aov, Cov, Sai, Rdc, Gc1)

   call print (STDOUT,
      "*i*4x*i*4x*i*4x*i*4x*i*4x*i*4x*i*4x*i*n"s,
      Gc2, Lc1, Lc2, Lc3, Ex1, Ex2, Ex3, Int)

   return
   end


# select_successor_address --- select next micro instruction address

   subroutine select_successor_address

   include DMACH_COMMON

   integer successor, temp

   if (~ M_type_1) {    # this was a type 2 instruction
      Mpcr += 1         # successor is STEP
      Micro_fetch_addr = Mpcr
      }
   else {               # this was a type 1 instruction
      if (Condition)
         successor = bit_field (Nano_instruction (1), 11, 13)
      else
         successor = bit_field (Nano_instruction (1), 14, 16)

      select (successor)
         when (0)    # WAIT
            ;
         when (1)    # STEP
            Mpcr += 1
         when (2) {  # SAVE
            Ampcr = Mpcr
            Mpcr += 1
            }
         when (3)    # SKIP
            Mpcr += 2
         when (4)    # JUMP
            Mpcr = Ampcr + 1
         when (5)    # EXEC
            Micro_fetch_addr = Ampcr + 1
         when (6) {  # CALL
            temp = Mpcr
            Mpcr = Ampcr + 1
            Ampcr = temp
            }
         when (7)    # RETN
            Mpcr = Ampcr + 2
      else
         call error ("in select_successor_address: can't happen"s)

      if (successor ~= 5)  # if not EXEC then ...
         Micro_fetch_addr = Mpcr
      }

   return

   include BIT_FIELD_FUNC

   end


# set_condition --- decide if conditional commands are to be performed

   subroutine set_condition

   include DMACH_COMMON

   logical test

   select (N_condition_select)
      when ( 0)
         test = Gc1
      when ( 1)
         test = Gc2
      when ( 2) {
         test = Lc1
         Lc1 = FALSE
         }
      when ( 3) {
         test = Lc2
         Lc2 = FALSE
         }
      when ( 4)
         test = Mst
      when ( 5)
         test = Lst
      when ( 6)
         test = Abt
      when ( 7)
         test = Aov
      when ( 8) {
         test = Cov
         Cov = FALSE
         }
      when ( 9) {
         test = Sai
         Sai = FALSE
         }
      when (10) {
         test = Rdc
         Rdc = FALSE
         }
      when (11) {
         test = Lc3
         Lc3 = FALSE
         }
      when (12) {
         test = Ex1
         Ex1 = FALSE
         }
      when (13) {
         test = Int
         Int = FALSE
         }
      when (14) {
         test = Ex2
         Ex2 = FALSE
         }
      when (15) {
         test = Ex3
         Ex3 = FALSE
         }
   else
      call error ("in set_condition: can't happen"s)

   if (N_true_condition)
      Condition = test
   else
      Condition = ~test

DB call print (ERROUT, "tested condition is *b"s, test)
DB if (N_true_condition)
DB    call putch (NEWLINE, ERROUT)
DB else
DB    call print (ERROUT, " (negated)*n"s)

   return
   end


# terminate_clock_cycle --- clean up at the end of a clock cycle

   subroutine terminate_clock_cycle

   include DMACH_COMMON

   if (Rdc_clock == Clock + 1) {
      Rdc = TRUE
      Rdc_clock = 0
      }

   if (Sai_clock == Clock + 1) {
      Sai = TRUE
      Sai_clock = 0
      }

   return
   end


# terminate_simulation --- clean up the D-machine simulator

   subroutine terminate_simulation

   include DMACH_COMMON

   call print (STDOUT, "*nEnd of Simulation - Machine State is:*n"s)
   call print_state
   if (Memory_dump)
      call dump_s_memory

   return
   end


# trace_info --- print trace information for last cycle per options

   subroutine trace_info

   include DMACH_COMMON

   if (Micro_fetch_addr >= Trace_start_addr
         && Micro_fetch_addr <= Trace_stop_addr
         && mod (Clock, Trace_interval) == 0)
      call print_state

   return
   end


# update_b_register --- select the input to the B register

   subroutine update_b_register

   include DMACH_COMMON

   select (Lu_b_select)
      when (0)
         ;                                   # No change
      when (1)
         B = 0                               # BC4
      when (8)
         B = Adder_output                    # BAD
      when (9)
         B = 0                               # BC8
      when (10)
         B = or (Bsw_output, Adder_output)   # BBA
      when (11)
         B = Bsw_output                      # B
      when (12)
         B = Ext                             # BEX
      when (13)
         B = Mir                             # BMI
      when (14)
         B = or (Bsw_output, Ext)            # BBE
      when (15)
         B = or (Bsw_output, Mir)            # BBI
   else
      call error ("in update_b_register: can't happen"s)

DB if (Lu_b_select ~= 0)
DB    call print (ERROUT, "B set to:*21t*l*n"s, B)

   return
   end


# update_ctr --- update the Ctr register

   subroutine update_ctr

   include DMACH_COMMON

   select (Lu_ctr_select)
      when (0)
         ;
      when (1) {  # ~ Lit
         Cov = FALSE
         Ctr = and (not (Lit), MASK_LOW_BYTE)
         }
      when (2) {  # Inc
         Ctr += 1
         if (Ctr > 255) {
            Ctr = 0
            Cov = TRUE
            }
         }
      when (3) {  # ~ Bsw
         Cov = FALSE
         Ctr = and (not (Bsw_output), MASK_LOW_BYTE)
         }
   else
      call error ("in update_ctr: can't happen"s)

DB if (Lu_ctr_select ~= 0)
DB    call print (ERROUT, "Ctr set to:*21t*i, Cov set to *b*n"s, Ctr, Cov)

   return
   end


# update_destinations --- clock all selected destination registers

   subroutine update_destinations

   include DMACH_COMMON

   if (Lu_set_a1) {
      A1 = Bsw_output
DB    call print (ERROUT, "A1 set to:*21t*l*n"s, A1)
      }
   if (Lu_set_a2) {
      A2 = Bsw_output
DB    call print (ERROUT, "A2 set to:*21t*l*n"s, A2)
      }
   if (Lu_set_a3) {
      A3 = Bsw_output
DB    call print (ERROUT, "A3 set to:*21t*l*n"s, A3)
      }

   call update_b_register

   if (Lu_set_mir) {
      Mir = Bsw_output
DB    call print (ERROUT, "Mir set to:*21t*l*n"s, Mir)
      }
   if (Lu_set_ampcr) {
      Ampcr = and (Bsw_output, MASK_LOW_12_BITS)
DB    call print (ERROUT, "Ampcr set to:*21t*i*n"s, Ampcr)
      }
   if (Lu_set_br1) {
      Br1 = and (rs (Bsw_output, 8), MASK_LOW_BYTE)
DB    call print (ERROUT, "Br1 set to:*21t*i*n"s, Br1)
      }
   if (Lu_set_br2) {
      Br2 = and (rs (Bsw_output, 8), MASK_LOW_BYTE)
DB    call print (ERROUT, "Br2 set to:*21t*i*n"s, Br2)
      }
   if (Lu_set_mar) {
      if (Lu_lmar)
         Mar = Lit
      else
         Mar = and (Bsw_output, MASK_LOW_BYTE)
DB    call print (ERROUT, "Mar set to:*21t*i*n"s, Mar)
      }

   call update_ctr
   call update_sar

   return
   end


# update_lu_controls --- update logic unit control register

   subroutine update_lu_controls

   include DMACH_COMMON

   Lu_x_select       = bit_field (Nano_instruction (2),  1,  3)
   Lu_y_select       = bit_field (Nano_instruction (2),  6,  8)
   Lu_b_mask_high    = bit_field (Nano_instruction (2),  4,  5)
   Lu_b_mask_mid     = bit_field (Nano_instruction (2),  6,  6)
   Lu_b_mask_low     = bit_field (Nano_instruction (2),  9, 10)
   Lu_adder_op       = bit_field (Nano_instruction (2), 12, 15)
   Lu_shift_select   = bit_field (Nano_instruction (2), 16, 16) * 2 _
                     + bit_field (Nano_instruction (3),  1,  1)
   Lu_b_select       = bit_field (Nano_instruction (3),  5,  8)
   Lu_ctr_select     = bit_field (Nano_instruction (3), 15, 16)
   if (Lu_ctr_select == 1   # from Lit or Barrel Switch?
         && bit_field (Nano_instruction (3), 14, 14) == 1)
      Lu_ctr_select = 3
   Lu_sar_select     = bit_field (Nano_instruction (4),  1,  2)

   Lu_inhibit_carry  = (bit_field (Nano_instruction (2), 11, 11) == 1)
   Lu_set_a1         = (bit_field (Nano_instruction (3),  2,  2) == 1)
   Lu_set_a2         = (bit_field (Nano_instruction (3),  3,  3) == 1)
   Lu_set_a3         = (bit_field (Nano_instruction (3),  4,  4) == 1)
   Lu_set_mir        = (bit_field (Nano_instruction (3),  9,  9) == 1)
   Lu_set_ampcr      = (bit_field (Nano_instruction (3), 10, 10) == 1)
   Lu_set_mar        = (bit_field (Nano_instruction (3), 13, 13) == 1)
   Lu_lmar           = (bit_field (Nano_instruction (3), 13, 14) == 2)
   Lu_set_br1        = (bit_field (Nano_instruction (3), 11, 11) == 1)
   Lu_set_br2        = (bit_field (Nano_instruction (3), 12, 12) == 1)

DB call print (ERROUT, "Logic unit control registers set*n"s)

   return

   include BIT_FIELD_FUNC

   end


# update_sar --- update the Shift Amount Register

   subroutine update_sar

   include DMACH_COMMON

   select (Lu_sar_select)
      when (0)
         ;                 # No change
      when (1)
         Sar = 32 - Sar    # CSAR
      when (2)
         Sar = and ( _     # SAR
                  xor ( _
                     and (rs (Bsw_output, 1), not (MASK_LOW_2_BITS)),
                     and (Bsw_output, MASK_LOW_2_BITS)),
                  MASK_LOW_5_BITS)
   else
      call error ("in update_sar: can't happen"s)

DB if (Lu_sar_select ~= 0)
DB    call print (ERROUT, "Sar set to:*21t*i*n"s, Sar)

   return
   end


# x_input_select --- select the X adder input

   subroutine x_input_select

   include DMACH_COMMON

   select (Lu_x_select)
      when (0)
         X_input = 0
      when (1)
         X_input = Lit
      when (2)
         X_input = Ext
      when (3)
         X_input = ls (intl (Ctr), 24)
      when (4)
         X_input = xor (ls (intl (Ctr), 24), Lit)
      when (5)
         X_input = A1
      when (6)
         X_input = A2
      when (7)
         X_input = A3
   else
      call error ("in x_input_select: can't happen"s)

DB call print (ERROUT, "Adder X input is:*21t*l*n"s, X_input)

   return
   end


# y_input_from_masked_b_register --- the name is self-explanatory

   subroutine y_input_from_masked_b_register

   include DMACH_COMMON

   longint b_high, b_mid, b_low

   select (Lu_b_mask_high)
      when (0)
         b_high = 0                             # B.0xx
      when (1)
         b_high = and (B, MASK_HIGH_BIT)        # B.Txx
      when (2)
         b_high = and (not (B), MASK_HIGH_BIT)  # B.Fxx
      when (3)
         b_high = MASK_HIGH_BIT                 # B.1xx
   else
      call error ("in y_input_from_masked_b_register: can't happen"s)

   select (Lu_b_mask_mid)
      when (0)
         b_mid = 0                              # B.x0x
      when (1)
         b_mid = and (B, MASK_CENTER_BITS)      # B.xTx
   else
      call error ("in y_input_from_masked_b_register: can't happen"s)

   select (Lu_b_mask_low)
      when (0)
         b_low = 0                              # B.xx0
      when (1)
         b_low = and (B, MASK_LOW_BIT)          # B.xxT
      when (2)
         b_low = and (not (B), MASK_LOW_BIT)    # B.xxF
      when (3)
         b_low = MASK_LOW_BIT                   # B.xx1
   else
      call error ("in y_input_from_masked_b_register: can't happen"s)

   Y_input = xor (b_high, b_mid, b_low)

   return
   end


# y_input_select --- select the Y adder input

   subroutine y_input_select

   include DMACH_COMMON

   select (Lu_y_select)
      when (0)
         call y_input_from_masked_b_register
      when (1)
         Y_input = Lit
      when (2)
         Y_input = Ext
      when (3)
         Y_input = ls (intl (Ctr), 24)
      when (4)
         call y_input_from_masked_b_register
      when (5)
         Y_input = xor (ls (intl (Ctr), 24), Lit)
      when (6)
         Y_input = Ampcr
      when (7)
         Y_input = Bmar
   else
      call error ("in y_input_select: can't happen"s)

DB call print (ERROUT, "Adder Y input is:*21t*l*n"s, Y_input)

   return
   end
