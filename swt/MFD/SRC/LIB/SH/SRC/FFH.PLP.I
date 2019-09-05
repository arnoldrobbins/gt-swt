/*
 * ffh.plp.i --- standard fault frame header declaration
 */
%nolist;

declare
   1  ffh based,                    /* standard fault frame header */
      2  flags,
         3  backup_inh bit (1),     /* will be '0'b */
         3  cond_fr bit (1),        /* will be '0' */
         3  cleanup_done bit (1),
         3  efh_present bit (1),    /* will be '0'b */
         3  user_proc bit (1),
         3  mbz bit (9),
         3  fault_fr bit (2),       /* will be '10'b or '01'b */
      2  root,
         3  mbz bit (4),
         3  seg_no bit (12),
      2  ret_pb pointer,
      2  ret_sb pointer,
      2  ret_lb pointer,
      2  ret_keys bit (16) aligned,
      2  fault_type bin (15),
      2  fault_code bin (15),
      2  fault_addr pointer,
      2  hdr_reserved (7) bin (15),
      2  regs,
         3  save_mask bit (16) aligned,
         3  fac_1 (2) bin (31),
         3  fac_0 (2) bin (31),
         3  genr (0:7) bin (31),
         3  xb_reg pointer,
      2  saved_cleanup_pb pointer,
      2  pad bin;

%replace
   ffh_size by 50;

declare
   hw_data_chars char (100) aligned based,
   regs_chars char (54) aligned based;

%list;
