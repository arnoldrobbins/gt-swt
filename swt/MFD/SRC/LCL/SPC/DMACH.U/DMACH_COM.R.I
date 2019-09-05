# dmach.com --- common declarations for the Burroughs D-machine Simulator


   integer Clock,                # microprogram clock
           Rdc_clock,            # clock value of next Rdc event
           Sai_clock,            # clock value of next Sai event
           Max_clock,            # max number of clock cycles to simulate
           Current_phase,        # phase of current type 1 instruction
           Non_phase_1_fetch_addr,        # addr of non phase 1 inst
           Next_non_phase_1_fetch_addr,   # addr of next non phase 1 inst
           Micro_fetch_addr,     # addr of current phase 1 instruction
           Nano_fetch_addr       # nano instruction address

   integer Micro_instruction     # holding area for current micro inst.
   logical M_type_1,             # true if it is a type 1 instruction
           M_set_sar,            # true if Sar to be set from m-inst.
           M_set_lit,            # true if Lit to be set from m-inst.
           M_set_ampcr           # true if Ampcr to be set from m-inst.

   integer Nano_instruction,     # holding area for current nano inst.
           N_condition_select    # cond sel field of current nano inst.
   logical N_true_condition,     # condition sense
           N_lu_conditional,     # true if Lu operation is conditional
           N_mdop_conditional    # true if external op is conditional

   integer M_memory,             # microprogram memory
           N_memory              # nanoprogram memory
   longint S_memory,             # s memory
           Memory_data           # s memory holding buffer

   logical Condition             # cond to be tested by current nano inst
   integer Ampcr,                # alternate microprogram counter
           Mpcr                  # microprogram counter

   longint A1,                   # A1 register
           A2,                   # A2 register
           A3,                   # A3 register
           B                     # B register
   integer Lit,                  # Lit register
           Ctr                   # Ctr register
   longint Ext                   # External data bus

   longint X_input,              # latched x adder input
           Y_input,              # latched y adder input
           Adder_output,         # latched adder output
           Carry_in,             # latched input bit carries
           Carry_out             # latched output bit carries
   logical Aov,                  # adder overflow
           Mst,                  # most significant bit true
           Lst,                  # least significant bit true
           Abt                   # all bits true

   integer Sar                   # Sar register
   longint Bsw_output            # latched barrel switch output

   integer Br1,                  # base register 1
           Br2,                  # base register 2
           Mar,                  # memory address register
           Bmar                  # based memory address register
   longint Mir                   # memory information register

   logical Gc1,                  # global condition 1
           Gc2,                  # global condition 2
           Lc1,                  # local condition 1
           Lc2,                  # local condition 2
           Lc3,                  # local condition 3
           Cov,                  # counter overflow
           Sai,                  # memory write complete
           Rdc,                  # memory read complete
           Ex1,                  # external condition 1
           Ex2,                  # external condition 2
           Ex3,                  # external condition 3
           Int                   # interrupt condition

   integer Lu_x_select,          # x adder input selector
           Lu_y_select,          # y adder input selector
           Lu_b_mask_high,       # B register MSB mask
           Lu_b_mask_mid,        # B register middle bits mask
           Lu_b_mask_low,        # B register LSB mask
           Lu_adder_op,          # adder operation selector
           Lu_shift_select,      # barrel switch shift selector
           Lu_b_select,          # B register input selector
           Lu_sar_select,        # Sar register input selector
           Lu_ctr_select         # Ctr register input selector

   logical Lu_inhibit_carry,     # true if byte carries inhibited
           Lu_set_ampcr,         # true if Ampcr to be updated this cycle
           Lu_set_a1,            # true if A1 to be updated this cycle
           Lu_set_a2,            # true if A2 to be updated this cycle
           Lu_set_a3,            # true if A3 to be updated this cycle
           Lu_set_br1,           # true if Br1 to be updated this cycle
           Lu_set_br2,           # true if Br2 to be updated this cycle
           Lu_set_mar,           # true if Mar to be updated this cycle
           Lu_lmar,              # true if Lit is Mar source
           Lu_set_mir            # true if Mir to be updated this cycle

   integer Trace_start_addr,     # micro addr at which to start trace
           Trace_stop_addr,      # micro addr at which to stop trace
           Trace_interval        # number of clocks between trace output
   logical Memory_dump,          # true if memory dump on termination
           Octal_output          # true if mem and regs output in octal



   common / cdmach / _
      Clock, Rdc_clock, Sai_clock, Max_clock, Current_phase,
      Non_phase_1_fetch_addr, Next_non_phase_1_fetch_addr,
      Micro_fetch_addr, Nano_fetch_addr, Micro_instruction,
      M_type_1, M_set_sar, M_set_lit, M_set_ampcr,
      Nano_instruction (4), N_condition_select, N_true_condition,
      N_lu_conditional, N_mdop_conditional, Condition, Ampcr,
      Mpcr, A1, A2, A3, B, Lit, Ctr, Ext, X_input, Y_input,
      Adder_output, Carry_in, Carry_out, Aov, Mst, Lst, Abt,
      Sar, Bsw_output, Br1, Br2, Mar, Bmar, Mir, Gc1, Gc2,
      Lc1, Lc2, Lc3, Cov, Sai, Rdc, Ex1, Ex2, Ex3, Int,
      Lu_x_select, Lu_y_select, Lu_b_mask_high, Lu_b_mask_mid,
      Lu_b_mask_low, Lu_adder_op, Lu_inhibit_carry, Lu_shift_select,
      Lu_set_ampcr, Lu_set_a1, Lu_set_a2, Lu_set_a3, Lu_b_select,
      Lu_sar_select, Lu_ctr_select, Lu_set_br1, Lu_set_br2,
      Lu_set_mar, Lu_lmar, Lu_set_mir, M_memory (M_MEMORY_SIZE),
      N_memory (4, N_MEMORY_SIZE), S_memory (S_MEMORY_SIZE), Memory_data,
      Trace_start_addr, Trace_stop_addr, Trace_interval, Memory_dump,
      Octal_output
