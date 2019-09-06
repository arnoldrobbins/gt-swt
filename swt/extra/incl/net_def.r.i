# net_def.r.i --- definitions for "gtnetlb"

# linkages --- the linkages for the gtnetlb

   linkage _
      net_assign,
      net_unassign,
      net_code,
      net_connect,
      net_connect_info,
      net_accept_connect,
      net_disconnect,
      net_send,
      net_receive,
      net_wait,
      net_clear


# re-define the PRIMOS keys to SWT keys

# Error and Status Codes:

   define (ARGS_BAD,XS$BPM)
   define (COMPLETE,XS$CMP)
   define (NET_BUSY,XS$MEM)
   define (NET_DOWN,XS$NET)
   define (NO_REQUESTS,XS$NOP)
   define (OVERFLOW,XS$MAX)
   define (PENDING,XS$IP)
   define (PORT_BUSY,XS$QUE)
   define (SYS_BAD,XS$UNK)
   define (SYS_BUSY,XS$BSY)
   define (SYS_DOWN,XS$DWN)
   define (VC_BAD,XS$BVC)
   define (VC_CLEAR,XS$CLR)
   define (VC_IDLE,XS$IDL)
   define (VC_ILL,XS$ILL)
   define (VC_RESET,XS$RST)

# Clear Codes (For Primenet or explicit user clears only)

   define (LOCAL,CC$CLR)


# Diagnostic Byte Definitions

   define (PORT_UNASN,CD$PNA)
   define (SYS_BUSY,CD$BSY)
   define (SYS_BAD,CD$IAD)
   define (SYS_DOWN,CD$DWN)

# Connection types (for 'net_accept_connect')

   define (NEW,1)
   define (PASSED,2)


# Message types

   define (DATA,0)
   define (CTRL,1)
   define (INTERRUPT,2)

# other network definitions

   include "=incl=/x$keys.r.i"
