# dprint_com.r.i --- common block declarations for 'dprint'

   ARG_DECL
   integer     Pos,              # Current column position
               Line,             # Current line number on page
               Chunk,            # Number of chars sent since last poll
               Page_length,      # Number of lines per page
               Fd,               # Input file descriptor
               Direction         # Current printing direction
   bool        Outstanding_poll  # TRUE if there is an outstanding poll
   longreal    Quit_label        # Exit label for QUITs

   common /dp$com/ Pos, Line, Chunk, Page_length, Fd,
      Direction, Outstanding_poll, Quit_label, ARG_BUF
