/* vcg_defs.h --- C definitions for VCG */

/* Data types understood at the machine-instruction level:      */

#define INT_MODE        1
#define LONG_INT_MODE   2
#define UNS_MODE        3
#define LONG_UNS_MODE   4
#define FLOAT_MODE      5
#define LONG_FLOAT_MODE 6
#define STOWED_MODE     7


/* Intermediate Form (IMF) operators:   */

#define ADDAA_OP        1
#define ADD_OP          2
#define ANDAA_OP        3
#define AND_OP          4
#define ASSIGN_OP       5
#define BREAK_OP        6
#define CASE_OP         7
#define COMPL_OP        8
#define CONST_OP        9
#define CONVERT_OP      10
#define DECLARE_STAT_OP 11
#define DEFAULT_OP      12
#define DEFINE_DYNM_OP  13
#define DEFINE_STAT_OP  14
#define DEREF_OP        15
#define DIVAA_OP        16
#define DIV_OP          17
#define DO_LOOP_OP      18
#define EQ_OP           19
#define FOR_LOOP_OP     20
#define GE_OP           21
#define GOTO_OP         22
#define GT_OP           23
#define IF_OP           24
#define INDEX_OP        25
#define INITIALIZER_OP  26
#define LABEL_OP        27
#define LE_OP           28
#define LSHIFTAA_OP     29
#define LSHIFT_OP       30
#define LT_OP           31
#define MODULE_OP       32
#define MULAA_OP        33
#define MUL_OP          34
#define NEG_OP          35
#define NEXT_OP         36
#define NE_OP           37
#define NOT_OP          38
#define NULL_OP         39
#define OBJECT_OP       40
#define ORAA_OP         41
#define OR_OP           42
#define POSTDEC_OP      43
#define POSTINC_OP      44
#define PREDEC_OP       45
#define PREINC_OP       46
#define PROC_CALL_ARG_OP        47
#define PROC_CALL_OP    48
#define PROC_DEFN_ARG_OP        49
#define PROC_DEFN_OP    50
#define REFTO_OP        51
#define REMAA_OP        52
#define REM_OP          53
#define RETURN_OP       54
#define RSHIFTAA_OP     55
#define RSHIFT_OP       56
#define SAND_OP         57
#define SELECT_OP       58
#define SEQ_OP          59
#define SOR_OP          60
#define SUBAA_OP        61
#define SUB_OP          62
#define SWITCH_OP       63
#define UNDEFINE_DYNM_OP        64
#define WHILE_LOOP_OP   65
#define XORAA_OP        66
#define XOR_OP          67
#define ZERO_INITIALIZER_OP     68
#define FIELD_OP        69
#define CHECK_RANGE_OP  70
#define CHECK_UPPER_OP  71
#define CHECK_LOWER_OP  72


/* Argument dispositions:       */

#define VALUE_DISP      0
#define REF_DISP        1
