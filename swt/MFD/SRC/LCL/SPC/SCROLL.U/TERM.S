
enable = <6
pri = 5
stopint = 0320          # location of display stop interrupt vector

.=0400                  # past all interrupt vectors
placate:
      point
      200;  600         # invisible
      statsa ital1 sync
      char int1
      'Scrolling, cursor positionable terminal program.'
      point
      200; 500
      char
      'LOADING -- please wait.'
      .even
#     point
#     100;  100
#     statsa ital0
#     char int7
#     'Copyright (c) 1978, Georgia Institute of Technology'
#     # written by Jack Waugh
#     .even
      djmp; placate
main: .=dpc
      placate
.=main
start':
      reset             # stop display
      jmp   entry

. = 01000         # leaving 0400 bytes or 128. words for the stack
entry:
      mov   $entry, sp
      clr   r0
      mov   (pc)+, (r0)+; jmp *(pc)+      # place jump in loc. 0
      mov   sp, (r0)+                     #     to entry
      mov   $disaster, (r0)+
      mov   $7<pri, (r0)+
1h:   clr   (r0)+
      cmp   r0, sp
      blo   1b
main:  . = data
disaster:
      clr   *$beep
      halt
      reset
      clr   pc

# ivsetup --- set up an interrupt vector
#     call: jsr r5, ivsetup; vec address; service routine; psw image
#     registers: r0 garbaged, others saved.
ivsetup:
      mov   (r5)+, r0         # vector address
      mov   (r5)+, (r0)+      # service routine address
      mov   (r5)+, *r0        # psw image (including priority)
      rts   r5                # thats it!

data:  .=main                   # resume main line of code

      mov   $ivsetup, r1
      jsr r5, *r1; stopint; dstop_service; 4<pri
      jsr r5, *r1; 0330; disaster; 7<pri
      # Above trap occours on a bus timeout to the DPU or on an
      # illegal shifted out character.
      jsr r5, *r1; 060; kbd_service; 0<pri
      jsr r5, *r1; 0300; rcvr_service; 6<pri

      mov   $highest, r0
1h:   clr   -(r0)
      cmp   r0, $end_of_initialized
      bhi   1b

      clr   -(sp)                   # have a scratch place on the stack

# regular housekeeping done.  Now, initialize application.

CRLF = CR < 8 + LF
ROWS = 32
EXTRA = 32                          # number of invisible rows
COLS = 73
.struct line.     line.crlf 2, line.text COLS + 1, line.stop 2
1h = ROWS + EXTRA
.reserve bss      buf 1b * line.    # buffer for lines of text
endbuf = bss
.reserve bss      curline 2         # pointer to line being modified
.reserve bss      botline 2         # pointer to bottom line
.reserve bss      topline 2         # pointer to top line
.reserve bss      disline 2         # line actually being displayed
.reserve bss      charbuf 1024      # buffer for characters received
charbuf.end = bss
.reserve bss      charbuf.out 2     # read pointer
charbuf.in = r4                     # write pointer
.reserve bss      curcol  2         # column number of cursor
.reserve bss      currow 2          # row number of cursor (top is 0)
.reserve bss      precursor 2, cursor line., postcursor 2
next_display = r5

      mov   $charbuf, charbuf.in    # set up character queue
      mov   charbuf.in, charbuf.out # initially empty
      mov   $enable, *$rcsr         # now safe to receive characters
      mov   $enable, *$kcsr         # and send them, too

      mov   $buf, r0                # set up display buffer
1h:   mov   $CRLF, line.crlf (r0)
      mov   r0, *sp                 # put argument on top of stack
      jsr   pc, clrtxt
      mov   $dstop, line.stop (r0)
      add   $line., r0
      cmp   r0, $endbuf
      blo   1b

      mov   $char blkon, precursor
      mov   $CR, cursor + line.crlf # no LF, only CR
      mov   $char blkoff, cursor + line.stop
      mov   $dstop, postcursor
      mov   $cursor, *sp
      jsr   pc, clrtxt

      mov   $buf, topline
2h = ROWS * line.
1h = 2b - line.
      mov   $buf + 1b, botline
      mov   $buf, curline
      clr   currow
      mov   $buf, disline
      clr   curcol
      mov   $buf, next_display
      clr   -(sp)                   # fake an interrupt
      mov   $1f, -(sp)
      jmp   dstop_service
1h:

mainloop:
      jsr   pc, getchar
      tst   r0                      # ignore nulls
      beq   mainloop
                              # now interpret the character
      cmp   r0, $' '                # printable?
      blt   1f
print:      mov   curline, r2       # get current line
            add   $line.text, r2    # point to text part
            add   curcol, r2        # index with curcol
            movb  r0, *r2           # store the character
            inc   curcol            # move cursor along
            cmp   curcol, $COLS
            blt   2f
                  clr   curcol      # wraparound
                  br    newline
      2h:   br    mainloop
1h:   cmp   r0, $BEL                # wasn't printable.
      bne   1f
            clr   *$beep
            br    mainloop
1h:   cmp   r0, $CR                 # carriage return
      bne   1f
            clr   curcol
            br    mainloop
1h:   cmp   r0, $LF                 # line feed
      bne   1f
      newline:
            mov   $curline, *sp
            jsr   pc, bumpln
            inc   currow
            cmp   currow, $ROWS
            blt   2f
                  mov   curline, *sp
                  jsr   pc, clrtxt
      2h:   br    mainloop
1h:   cmp   r0, $BS
      bne   1f
            tst   curcol            # is backspace
            ble   2f
                  dec   curcol
      2h:   br    mainloop
1h:   cmp   r0, $FF
      bne   1f
      2h:   cmp   currow, $ROWS     # form feed: clear screen
            ble   3f                # wait until all scrolling done
                  wait
                  br    2b
      3h:
            mov   $buf, r0
      2h:   mov   r0, *sp
            jsr   pc, clrtxt
            add   $line., r0
            cmp   r0, $endbuf
            blo   2b
home:       mov   topline, curline
            clr   currow
            clr   curcol
            br    mainloop
1h:   cmp   r0, $DC4
      bne   1f
            jsr   pc, clreol        # control-t: clear to end of line
            br    mainloop
1h:   cmp   r0, $ESC
      bne   1f
            jsr   pc, rowpos
            jsr   pc, colpos
            br    mainloop
1h:   cmp   r0, $ACK
      bne   1f
            jsr   pc, rowpos
            br    mainloop
1h:   cmp   r0, $NAK
      bne   1f
            jsr   pc, colpos
            br    mainloop
1h:   mov   $DEL, r0                # garbage character.
      br    print


# colpos --- accept absolute column position from host
#     call: jsr pc, colpos
#     registers:
colpos:
      jsr   pc, getaddr
      tst   r0

      blt   1f
      cmp   r0, $COLS
      bge   1f
            mov   r0, curcol
1h:   rts   pc

# rowpos --- accept absolute row position from host
rowpos:
      jsr   pc, getaddr
      cmp   r0, $ROWS
      bge   1f
      tst   r0
      blt   1f
            jsr   pc, quiet
            mov   topline, curline
            clr   currow
      2h:   cmp   currow, r0
            bge   3f
                  mov   $curline, -(sp)
                  jsr   pc, bumpln
                  tst   (sp)+
                  inc   currow
                  br    2b
      3h:
1h:   rts   pc

# getaddr --- get a row or column address from host
#     return in r0
getaddr:
      jsr   pc, getchar
      sub   $' ', r0             # blank is lowest printing character
      rts pc

# getchar --- get a character from host
#     return it in r0
getchar:
      cmp   charbuf.in, charbuf.out # look for received characters
      bne   1f                      # nothing to do yet?
            mov   curcol, r0        # then mess with cursor
            movb  $'_', cursor + line.text (r0)
      2h:   wait                    # idle
            cmp   charbuf.in, charbuf.out # is there a character now?
            beq   2b                # no, idle some more
            movb  $' ', cursor + line.text (r0) # yes, remove cursor
1h:   movb  *charbuf.out, r0        # get the character
      inc   charbuf.out                # bump the pointer around
      cmp   charbuf.out, $charbuf.end
      blo   1f
            mov   $charbuf, charbuf.out
1h:   bic   $~DEL, r0               # strip parity bit
      rts   pc

# quiet --- wait until scrolling is finished
quiet:
      cmp   currow, $ROWS  # does display stop routine have to scroll?
      bgt   1f             # yes, wait for it
      rts   pc             # no, return

1h:   wait
      br    quiet

# clrtxt --- clear out the text of a line to blanks
#     call:       (pointer to line on stack) jsr pc, clrtxt
#     registers:  all saved.
clrtxt:
clrtxt.ptr = 2                            # stack offset of argument
      mov   r0, -(sp); depth = 2          # save r0
      mov   clrtxt.ptr + depth (sp), r0   # get argument
      add   $line.text, r0                # make point to text portion
      mov   r1, -(sp); depth = 4          # save r1
      mov   r0, r1
      add   $COLS, r1                     # points to end of text
1h:   movb  $' ', (r0)+                   # store blank, point to next
      cmp   r0, r1                        # end of text portion?
      blo   1b                            # no, loop back

      mov   (sp)+, r1; depth = 2          # restore registers and return
      mov   (sp)+, r0; depth = 0
      rts   pc

# clreol --- clear from current column to end of current line
#     call:       jsr pc, clreol
#     registers:  all saved.
clreol:
      mov   r0, -(sp)                     # save r0
      mov   curline,r0                    # get ptr to current line
      add   $line.text, r0                # make point to text portion
      mov   r1, -(sp)                     # save r1
      mov   r0, r1
      add   curcol, r0                    # make point to current col
      add   $COLS, r1                     # points to end of text
1h:   movb  $' ', (r0)+                   # store blank, point to next
      cmp   r0, r1                        # end of text portion?
      blo   1b                            # no, loop back

      mov   (sp)+, r1                     # restore registers and return
      mov   (sp)+, r0
      rts   pc

# bumpln --- point a line pointer to the next line in the buffer
#     call: (pointer to pointer on stack) jsr pc, bumpln
#     registers:  all saved.
bumpln:
arg = 2
      add   $line., *arg (sp)
      cmp   *arg (sp), $endbuf
      bhis  1f
            rts   pc
1h:   mov   $buf, *arg (sp)
      rts   pc


# interrupt service routines

dstop_service:                      # display stopped on dstop
      mov   next_display, *$dpc     # start it up again NOW
      cmp   curline, disline
      bne   1f
            mov   $precursor, next_display
            mov   $2f, *$stopint
            rti
      2h:
            mov   next_display, *$dpc
            mov   $dstop_service, *$stopint
1h:   cmp   botline, disline        # did we just display the last line
      bne   1f
            cmp   currow, $ROWS
            blt   2f
            3h:   dec   currow
                  mov   $topline, -(sp)
                  jsr   pc, bumpln
                  mov   $botline, *sp
                  jsr   pc, bumpln
                  tst   (sp)+
                  cmp   currow, $ROWS + EXTRA
                  bge   3b
      2h:   mov   topline, disline
            mov   disline, frog
            mov   $dfile, next_display
            rti
1h:
      add   $line., disline
      cmp   disline, $endbuf
      blo   1f
            mov   $buf, disline
1h:   mov   disline, next_display
      rti

dfile:
      point
      0;    767;                    # top left corner of screen
      longv int1                    # draw border
      0 intx;     minusy 767
      1023 intx;  0
      0 intx;     767
      minusx 1023 intx; 0
      0;          2    # move up just a bit to make room for one more row
      char int3
      djmp
frog: frog                          # gets changed

kbd_service:                        # key pressed on keyboard
      mov   *$kbuf, *$xbuf          # send it along
      rti

rcvr_service:                       # character received from host
      movb  *$rbuf, (charbuf.in)+   # get from DL11 receiver
      cmp   charbuf.in, $charbuf.end   # and enqueue
      bhis  1f
            rti
1h:   mov   $charbuf, charbuf.in
      rti

# final assignment of code placement symbols
end_of_initialized = data
bss = data
data:    # sole definition in first pass
