/*
 * cfh.plp.i --- standard condition frame header declaration
 */
%nolist;

declare
   1  cfh based,                    /* standard condition frame header */
      2  flags,
         3  backup_inh bit (1),     /* will be '0'b */
         3  cond_fr bit (1),        /* will be '1'b */
         3  cleanup_done bit (1),
         3  efh_present bit (1),
         3  user_proc bit (1),
         3  mbz bit (9),
         3  fault_fr bit (2),       /* will be '00'b */
      2  root,
         3  mbz bit (4),
         3  seg_no bit (12),
      2  ret_pb pointer,
      2  ret_sb pointer,
      2  ret_lb pointer,
      2  ret_keys bit (16) aligned,
      2  after_pcl bin (15),
      2  hdr_reserved (8) bin (15),
      2  owner_ptr pointer,
      2  cflags,
         3  crawlout bit (1),
         3  continue_sw bit (1),
         3  return_ok bit (1),
         3  inaction_ok bit (1),
         3  specifier bit (1),
         3  mbz bit (11),
      2  version bin (15),          /* init (1) */
      2  cond_name_ptr pointer,
      2  ms_ptr pointer,            /* machine state at time of signal */
      2  info_ptr pointer,
      2  ms_len bin (15),
      2  info_len bin (15),
      2  saved_cleanup_pb pointer;

%replace
   cfh_size by 32;

%list;
