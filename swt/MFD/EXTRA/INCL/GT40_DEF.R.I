# gt40_def.r.i --- definitions for Subsystem software for the DEC GT40

define(CHAR,:100000)         # character mode
define(SHORTV,:104000)       # short vector mode
define(LONGV,:110000)        # long vector mode
define(POINT,:114000)        # point mode
define(GRAPHX,:120000)       # graphplot x mode
define(GRAPHY,:124000)       # graphplot y mode
define(RELATV,:130000)       # relative point mode
define(INT0,:2000)           # intensity 0 (dimmest)
define(INT1,:2200)           # intensity 1
define(INT2,:2400)           # intensity 2
define(INT3,:2600)           # intensity 3
define(INT4,:3000)           # intensity 4
define(INT5,:3200)           # intensity 5
define(INT6,:3400)           # intensity 6
define(INT7,:3600)           # intensity 7 (brightest)
define(LPOFF,:100)           # light pen off
define(LPON,:140)            # light pen on
define(BLKOFF,:20)           # blink off
define(BLKON,:30)            # blink on
define(LINE0,:4)             # solid line
define(LINE1,:5)             # long dash line
define(LINE2,:6)             # short dash line
define(LINE3,:7)             # dot dash line
define(DJMP,:160000)         # display jump
define(DNOP,:164000)         # display no operation
define(STATSA,:170000)       # load status a instruction
define(DSTOP,:173400)        # display stop and interrupt
define(SINON,:1400)          # stop interrupt on
define(SINOF,:1000)          # stop interrupt off
define(LPLITE,:200)          # light pen hit on
define(LPDARK,:300)          # light pen hit off
define(ITAL0,:40)            # italics off
define(ITAL1,:60)            # italics on
define(SYNC,:4)              # halt and resume in sync
define(STATSB,:174000)       # load status b instruction
define(INCR,:100)            # graphplot increment
define(INTX,:40000)          # intensify vector or point
define(MINUSX,:20000)        # negative change in x component
define(MINUSY,:20000)        # negative change in y component
define(MISVX,:20000)         # negative change in x component
define(MISVY,:100)           # negative change in y component
define(HALT,:0)              # halt
define(WAIT,:1)              # wait for interrupt
define(RTI,:2)               # return from interrupt
define(RESET,:5)             # reset all
define(PSW,:177776)          # processor status word
define(DSR,:172002)          # display status register
define(BEEP,:172002)         # write beeps keyboard
define(XSR,:172004)          # x status register
define(YSR,:172006)          # y status register
define(RCSR,:175610)         # receiver command and status register
define(RBUF,:175612)         # receiver data buffer
define(XCSR,:175614)         # transmitter command and status register
define(XBUF,:175616)         # transmitter data buffer
define(SWR,:177570)          # switch register
define(HIGHEST,:40000)       # highest address in core plus one
define(KBUF,:177562)         # keyboard data buffer
define(KCSR,:177560)         # keyboard command and status register
define(CLCSR,:177546)        # clock command and status register
define(DPC,:172000)          # display program counter
define(BOOT,:166000)         # address of bootstrap loader
