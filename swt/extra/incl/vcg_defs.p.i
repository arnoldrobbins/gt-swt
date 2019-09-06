(* vcg_defs.p.i --- Pascal definitions for VCG *)

CONST
(*  Data types understood at the machine-instruction level *)

   INT_MODE = 1;
   LONG_INT_MODE = 2;
   UNS_MODE = 3;
   LONG_UNS_MODE = 4;
   FLOAT_MODE = 5;
   LONG_FLOAT_MODE = 6;
   STOWED_MODE = 7;


(*  Intermediate Form (IMF) operators *)

   ADDAA_OP = 1;
   ADD_OP = 2;
   ANDAA_OP = 3;
   AND_OP = 4;
   ASSIGN_OP = 5;
   BREAK_OP = 6;
   CASE_OP = 7;
   COMPL_OP = 8;
   CONST_OP = 9;
   CONVERT_OP = 10;
   DECLARE_STAT_OP = 11;
   DEFAULT_OP = 12;
   DEFINE_DYNM_OP = 13;
   DEFINE_STAT_OP = 14;
   DEREF_OP = 15;
   DIVAA_OP = 16;
   DIV_OP = 17;
   DO_LOOP_OP = 18;
   EQ_OP = 19;
   FOR_LOOP_OP = 20;
   GE_OP = 21;
   GOTO_OP = 22;
   GT_OP = 23;
   IF_OP = 24;
   INDEX_OP = 25;
   INITIALIZER_OP = 26;
   LABEL_OP = 27;
   LE_OP = 28;
   LSHIFTAA_OP = 29;
   LSHIFT_OP = 30;
   LT_OP = 31;
   MODULE_OP = 32;
   MULAA_OP = 33;
   MUL_OP = 34;
   NEG_OP = 35;
   NEXT_OP = 36;
   NE_OP = 37;
   NOT_OP = 38;
   NULL_OP = 39;
   OBJECT_OP = 40;
   ORAA_OP = 41;
   OR_OP = 42;
   POSTDEC_OP = 43;
   POSTINC_OP = 44;
   PREDEC_OP = 45;
   PREINC_OP = 46;
   PROC_CALL_ARG_OP = 47;
   PROC_CALL_OP = 48;
   PROC_DEFN_ARG_OP = 49;
   PROC_DEFN_OP = 50;
   REFTO_OP = 51;
   REMAA_OP = 52;
   REM_OP = 53;
   RETURN_OP = 54;
   RSHIFTAA_OP = 55;
   RSHIFT_OP = 56;
   SAND_OP = 57;
   SELECT_OP = 58;
   SEQ_OP = 59;
   SOR_OP = 60;
   SUBAA_OP = 61;
   SUB_OP = 62;
   SWITCH_OP = 63;
   UNDEFINE_DYNM_OP = 64;
   WHILE_LOOP_OP = 65;
   XORAA_OP = 66;
   XOR_OP = 67;
   ZERO_INITIALIZER_OP = 68;
   FIELD_OP = 69;
   CHECK_RANGE_OP = 70;
   CHECK_UPPER_OP = 71;
   CHECK_LOWER_OP = 72;


(*  Argument dispositions *)

   VALUE_DISP = 0;
   REF_DISP = 1;
