# sol --- the game of solitaire

   include "sol_def.r.i"

   include SOL_COMMON

   integer i
   character ans (2)
   shortcall mkonu$ (18)
   external quit_finish

   call mkonu$ ("QUIT$"v, loc (quit_finish))

   call initialize
   repeat {
      call message (EOS)
      Game_over = FALSE
      Times_thru = 0
      call set_game_type
      call shuffle
      call deal
      repeat {
         call display
         call turn
         } until (Game_over)
      if (Game_type == CASINO)
         call tally
      else {
         call count_unplayed (i)
         if (i <= 0)
            call message ("Congratulations, You won!"s)
         else
            call message ("Sorry..."s)
         }
      call prompt ("Play again? "s)
      call vtenb (PROMPT_ROW, 13, 2)
      call vtread (PROMPT_ROW, 13, YES)
      call vtgetl (ans, PROMPT_ROW, 13, 2)
      }
   until (ans (1) ~= 'y'c && ans (1) ~= 'Y'c)

   call log_results
   call vtstop

   stop
   end



# add_card --- place a card on the top of a pile

   subroutine add_card (card, to)
   integer card, to

   include SOL_COMMON

   Pile (COUNT, to) += 1
   Deck (LINK, card) = Pile (TOP_CARD, to)
   Deck (PLACE, card) = to
   Pile (TOP_CARD, to) = card

   return
   end



# card_is_movable --- determine if a card can be moved

   integer function card_is_movable (card)
   integer card

   include SOL_COMMON

   integer loc

   loc = Deck (PLACE, card)
   if (Pile (TOP_CARD, WASTE) == card
         || 1 <= loc - FACE_UP && loc - FACE_UP <= 7)
      return (YES)

   return (NO)
   end



# check_ace --- see if card can be played on the ace stack

   integer function check_ace (card, suit)
   integer card, suit

   include SOL_COMMON

   integer card_rank, card_suit, loc, rank

   card_suit = Deck (VALUE, card) / 16
   card_rank = mod (Deck (VALUE, card), 16)
   loc = Deck (PLACE, card)

   if (Pile (COUNT, ACES + suit) <= 0)
      rank = 0
   else
      rank = mod (Deck (VALUE, Pile (TOP_CARD, ACES + suit)), 16)

   if (card_suit ~= suit || card_rank - rank ~= 1
         || Pile (TOP_CARD, loc) ~= card)
      return (NO)
   else
      return (YES)

   end



# check_king --- see if card is a king and can be moved

   integer function check_king (card, pile)
   integer card, pile

   include SOL_COMMON

   integer rank, i

   rank = mod (Deck (VALUE, card), 16)
   if (rank ~= 13)   # not a king
      return (NO)

   for (i = FACE_UP + 1; i <= FACE_UP + 7; i += 1)
      if (Pile (COUNT, i) <= 0) {
         pile = i
         return (YES)
         }

   return (NO)
   end



# check_stack --- see if card will play on the specified stack

   integer function check_stack (card, stack)
   integer card, stack

   include SOL_COMMON

   integer color (4), card_suit, card_rank, suit, rank

   data color /BLACK, RED, RED, BLACK/

   if (Pile (COUNT, FACE_UP + stack) <= 0)
      return (NO)

   card_suit = Deck (VALUE, card) / 16
   card_rank = mod (Deck (VALUE, card), 16)
   suit = Deck (VALUE, Pile (TOP_CARD, FACE_UP + stack)) / 16
   rank = mod (Deck (VALUE, Pile (TOP_CARD, FACE_UP + stack)), 16)

   if (color (suit) == color (card_suit) || rank - card_rank ~= 1)
      return (NO)

   return (YES)
   end



# count_unplayed --- see how many cards haven't been played out

   subroutine count_unplayed (count)
   integer count

   include SOL_COMMON

   integer i

   count = Pile (COUNT, WASTE) + Pile (COUNT, STOCK)
   do i = 1, 7
      count += Pile (COUNT, FACE_DN + i)

   return
   end



# deal --- deal the cards into the appropriate stacks

   subroutine deal

   include SOL_COMMON

   integer i, j

   Pile (COUNT, STOCK) = 0
   Pile (COUNT, WASTE) = 0
   do i = 1, 7; {
      Pile (COUNT, FACE_UP + i) = 0
      Pile (COUNT, FACE_DN + i) = 0
      }
   do i = 1, 4
      Pile (COUNT, ACES + i) = 0

   for (i = 52; i > 0; i -= 1)
      call add_card (i, STOCK)

   do i = 1, 7; {
      call move_card (STOCK, FACE_UP + i)
      for (j = i + 1; j <= 7; j += 1)
         call move_card (STOCK, FACE_DN + j)
      }

   return
   end



# display --- show what the table looks like

   subroutine display

   include SOL_COMMON

   integer col, card, i, j
   character time (9)

   call date (SYS_TIME, time)     # get current time
   time (6) = EOS          # truncate seconds

   call vtputl (time, TIME_ROW, TIME_COL)
   do i = 1, 4       # display the ace stacks
      if (Pile (COUNT, ACES + i) > 0)
         call display_card (ACE_ROW, ACE_COL + (i - 1) * ACE_WIDTH,
               Pile (TOP_CARD, ACES + i))
      else
         call vtputl ("   "s, ACE_ROW, ACE_COL + (i - 1) * ACE_WIDTH)

   call vtprt (STOCK_ROW, STOCK_COL, "(*2i)"s, Pile (COUNT, STOCK))
   call vtprt (PASS_ROW, PASS_COL, "*2i"s, Times_thru)

   if (Pile (COUNT, WASTE) > 0) {
      call display_card (WASTE_ROW, WASTE_COL, Pile (TOP_CARD, WASTE))
      if (Pile (COUNT, WASTE) > 1)
         call vtprt (WASTE_ROW, WASTE_COL + 4, "(*i) "s,
               Pile (COUNT, WASTE) - 1)
      else
         call vtputl ("    "s, WASTE_ROW, WASTE_COL + 4)
      }
   else {
      call vtputl ("   "s, WASTE_ROW, WASTE_COL)
      call vtputl ("    "s, WASTE_ROW, WASTE_COL + 4)
      }

   for (i = 1; i <= 7; i += 1) {
      col = PILE_COL + (i - 1) * PILE_WIDTH
      if (Pile (COUNT, FACE_DN + i) > 0)
         call vtprt (PILE_ROW, col, "(*i)"s, Pile (COUNT, FACE_DN + i))
      else
         call vtputl ("   "s, PILE_ROW, col)
      card = Pile (TOP_CARD, FACE_UP + i)
      for (j = Pile (COUNT, FACE_UP + i); j > 0; j -= 1) {
         call display_card (PILE_ROW + j, col, card)
         card = Deck (LINK, card)
         }
      for (j = Pile (COUNT, FACE_UP + i) + 1; j <= 12; j += 1)
         call vtputl ("   "s, PILE_ROW + j, col)
      }

   call vtupd (NO)

   return
   end



# display_card --- show what a card is in a certain position

   subroutine display_card (row, col, card)
   integer row, col, card

   include SOL_COMMON

   character color
   integer s, v
   string suit "shdc"
   string value "A23456789TJQK"

   s = Deck (VALUE, card) / 16
   v = mod (Deck (VALUE, card), 16)

   if (s == 2 || s == 3)
      color = Red
   else
      color = Black

   call vtprt (row, col, "*c*c*c"s, value (v), suit (s), color)

   return
   end



# flip_stack --- flip to next card on stack

   subroutine flip_stack

   include SOL_COMMON

   integer i

   if (Pile (COUNT, STOCK) <= 0 && Game_type ~= CASINO) {
      Times_thru += 1
      while (Pile (COUNT, WASTE) > 0)
         call move_card (WASTE, STOCK)
      }

   if (Pile (COUNT, STOCK) <= 0) {  # no more cards in stock pile
      Game_over = TRUE
      return
      }

   if (Game_type == CASINO)
      call move_card (STOCK, WASTE)
   else
      for (i = 1; i <= 3 && Pile (COUNT, STOCK) > 0; i += 1)
         call move_card (STOCK, WASTE)

   return
   end



# initialize --- set up the initial playing board, etc.

   subroutine initialize

   include SOL_COMMON

   integer vtinit
   longint time
   longint read_clock
   character term (MAXTERMTYPE)

   if (vtinit (term) ~= OK) {
      call print (ERROUT, "Terminal type '*s' not supported*n"s, term)
      call error (""p)
      }

   call vtopt (1, STATUS_ROW)

   call rnd (ints (read_clock (time)))

   Red = '*'c
   Black = ' 'c
   Total_winnings = 0
   Games_played = 0
   Game_type = REGULAR

   call vtputl ("Solitaire"s, 1, 30)
   call vtputl ("Stack:"s, STOCK_LABEL_ROW, STOCK_LABEL_COL)
   call vtputl ("Aces:"s, ACE_LABEL_ROW, ACE_LABEL_COL)
   call vtputl ("times thru:"s, PASS_LABEL_ROW, PASS_LABEL_COL)
   call vtputl ("Layout:"s, LAYOUT_LABEL_ROW, LAYOUT_LABEL_COL)

   call vtputl ("Commands:"s, HELP_ROW, 1)
   call vtputl (" <return> -> flip stack"s, HELP_ROW + 2, 1)
   call vtputl (" <card>[<card>] -> move"s, HELP_ROW + 3, 1)
   call vtputl ("    one card to another"s, HELP_ROW + 4, 1)
   call vtputl (" i<red><blk>   ->   set"s, HELP_ROW + 5, 1)
   call vtputl ("       color indicators"s, HELP_ROW + 6, 1)
   call vtputl (" x   ->   exit the game"s, HELP_ROW + 7, 1)
   call vtputl ("<ctrl/q> -> redraw game"s, HELP_ROW + 8, 1)
   call vtupd (YES)

   return
   end



# interpret_card --- return the deck index of a card

   integer function interpret_card (str, pos)
   character str (ARB)
   integer pos

   include SOL_COMMON

   integer s, r, card
   integer index
   character mapup

   string suit "SHDC"
   string rank "A23456789TJQK"

   SKIPBL (str, pos)
   r = index (rank, mapup (str (pos)))
   pos += 1

   SKIPBL (str, pos)
   s = index (suit, mapup (str (pos)))
   pos += 1    # position to next character

   if (r == 0 || s == 0)
      card = EOF              # signal no card
   else
      card = Deck_index (13 * (s - 1) + r)

   return (card)
   end



# log_results --- enter casino results in the log file

   subroutine log_results

   include SOL_COMMON

   file_des fd
   file_des open
   character usr (MAXUSERNAME), dat (9), tim (9)

   if (Total_winnings == 0)
      return

   fd = open (LOG_FILE, WRITE)
   if (fd ~= ERR) {
      call date (SYS_DATE, dat)
      call date (SYS_TIME, tim)
      call date (SYS_USERID, usr)
      call wind (fd)
      call print (fd, "*#s *6i *s *s*n"s, MAXUSERNAME - 1,
                        usr, Total_winnings, dat, tim)
      call close (fd)
      }

   return
   end



# message --- write a message on the message line

   subroutine message (str)
   character str (ARB)

   call vtprt (MSG_ROW, 1, "*80s"s, str)
   call vtupd (NO)

   return
   end



# move --- handle the moving of one card to another

   integer function move (c1, c2)
   integer c1, c2

   include SOL_COMMON

   integer legal_moves, rank, suit, pile, i
   integer check_king, check_ace, check_stack, card_is_movable

   if (card_is_movable (c1) == NO) {
      call message ("You can't move that card"s)
      return (ERR)
      }

   if (c2 == EOF) {
      suit = Deck (VALUE, c1) / 16
      rank = mod (Deck (VALUE, c1), 16)
      if (check_king (c1, pile) == YES)   # form a new king stack
         call move_stack (c1, pile)
      elif (rank == 1)                    # form a new ace stack
         call move_stack (c1, ACES + suit)
      else {
         pile = 0
         legal_moves = 0
         if (check_ace (c1, suit) == YES) {
            legal_moves += 1
            pile = ACES + suit
            }
         do i = 1, 7
            if (check_stack (c1, i) == YES) {
               legal_moves += 1
               pile = FACE_UP + i
               }
         select
            when (legal_moves > 1)
               call message ("Move is ambiguous"s)
            when (legal_moves < 1)
               call message ("Move is impossible"s)
         ifany
            return (ERR)
         else
            call move_stack (c1, pile)
         }
      }
   else {
      pile = Deck (PLACE, c2)
      if (1 <= pile - ACES && pile - ACES <= 4
               && check_ace (c1, pile - ACES) ~= NO
      ||  1 <= pile - FACE_UP && pile - FACE_UP <= 7
               && check_stack (c1, pile - FACE_UP) ~= NO)
         call move_stack (c1, pile)
      else {
         call message ("Move is illegal"s)
         return (ERR)
         }
      }

   return (OK)
   end



# move_card --- move a card from one pile to another

   subroutine move_card (from, to)
   integer from, to

   include SOL_COMMON

   integer card
   integer remove_card

   if (remove_card (from, card) ~= EOF)
      call add_card (card, to)

   return
   end



# move_stack --- move a group of cards from one stack to another

   subroutine move_stack (card, to)
   integer card, to

   include SOL_COMMON

   integer from

   Pile (COUNT, DUMMY) = 0
   from = Deck (PLACE, card)
   while (Pile (TOP_CARD, from) ~= card)
      call move_card (from, DUMMY)
   call move_card (from, to)
   while (Pile (COUNT, DUMMY) > 0)
      call move_card (DUMMY, to)

   if (Pile (COUNT, from) <= 0
         && 1 <= from - FACE_UP && from - FACE_UP <= 7)
      call move_card (FACE_DN + from - FACE_UP, from)

   return
   end



# prompt --- write a prompt on the prompt line

   subroutine prompt (str)
   character str (ARB)

   integer length

   call vtprt (PROMPT_ROW, 1, "*80s"s, str)
   call vtupd (NO)
   call vtmove (PROMPT_ROW, length (str) + 1) # put the cursor at the end
   call vtpad (80)

   return
   end

# quit_finish --- break handler for amateur card players


   subroutine quit_finish (dummy)
   integer dummy

   include SOL_COMMON

   if (Game_type == CASINO)
      call tally

   call log_results
   call vtstop

   stop
   end


# read_clock --- return time since midnite in seconds

   longint function read_clock (time)
   longint time

   integer ar (5)

   call timdat (ar, 5)
   time = 60 * ar (4) + ar (5)

   return (time)
   end



# remove_card --- take the top card off of a pile

   integer function remove_card (from, card)
   integer from, card

   include SOL_COMMON

   if (Pile (COUNT, from) <= 0)
      card = EOF
   else {
      Pile (COUNT, from) -= 1
      card = Pile (TOP_CARD, from)
      Pile (TOP_CARD, from) = Deck (LINK, card)
      }

   return (card)
   end



# set_game_type --- ask player if he wants regular or casino game

   subroutine set_game_type

   include SOL_COMMON

   character ans (2)

   call prompt ("(c)asino or (r)egular game? "s)
   call vtenb (PROMPT_ROW, 29, 2)
   call vtread (PROMPT_ROW, 29, YES)
   call vtgetl (ans, PROMPT_ROW, 29, 2)
   if (ans (1) == 'c'c || ans (1) == 'C'c)
      Game_type = CASINO
   else
      Game_type = REGULAR
   call vtenb (PROMPT_ROW, 29, 0)

   return
   end



# shuffle --- shuffle the deck

   subroutine shuffle

   include SOL_COMMON

   integer i, j, card, rank, suit
   integer uniform

   procedure swap_card (i, j) forward

   card = 1
   do suit = 1, 4
      do rank = 1, 13; {
         Deck (VALUE, card) = 16 * suit + rank
         Deck (LINK,  card) = uniform (1, 1000)
         Deck (PLACE, card) = STOCK
         card += 1
         }

#  for (i = 1; i < 52; i += 1)          # old swapping function
#     for (j = i + 1; j <= 52; j += 1)
#        if (Deck (LINK, i) <= Deck (LINK, j))
#           swap_card (i, j)

   for (i = 1; i < 52; i += 1)          # new swapping function
      for (j = 1; j <= 52; j += 1)
         swap_card (uniform (1, 52), uniform (1, 52))

   do i = 1, 52; {
      suit = Deck (VALUE, i) / 16
      rank = mod (Deck (VALUE, i), 16)
      Deck_index ((suit - 1) * 13 + rank) = i
      }

   return

   # swap_card --- exchange the position of two cards in the deck

      procedure swap_card (i, j) {
      integer i, j

         local t1, t2
         integer t1, t2

         t1 = Deck (LINK, i)
         t2 = Deck (VALUE, i)
         Deck (LINK, i) = Deck (LINK, j)
         Deck (LINK, j) = t1
         Deck (VALUE, i) = Deck (VALUE, j)
         Deck (VALUE, j) = t2
         }

   end



# tally --- show how things turned out in a casino game

   subroutine tally

   include SOL_COMMON

   integer money, sum, i
   character wl (5), msg (MAXLINE)

   Games_played += 1

   call count_unplayed (sum)
   if (sum ~= 0) {
      sum = 0
      do i = 1, 4
         sum += Pile (COUNT, ACES + i)
      }
   else
      sum = 52
   money = 5 * sum - 50
   Total_winnings += money

   call vtprt (CASINO_ROW, CASINO_COL, "Casino results:  Games: *i"s,
         Games_played)
   if (Total_winnings >= 0)
      call vtprt (TALLY_ROW, TALLY_COL, "Won $*-6i"s, Total_winnings)
   else
      call vtprt (TALLY_ROW, TALLY_COL, "Lost $*-5i"s, -Total_winnings)

   select
      when (money > 0)
         call ctoc ("won"s, wl, 5)
      when (money < 0)
         call ctoc ("lost"s, wl, 5)
   ifany {
      call encode (msg, MAXLINE, "You *s $*i"s, wl, iabs (money))
      call message (msg)
      }
   else  # make sure the screen gets updated anyway
      call vtupd (NO)

   Game_type = REGULAR     # in case he BREAKs

   return
   end



# turn --- prompt for and process a move or command

   subroutine turn

   include SOL_COMMON

   character command (MAXLINE)
   integer pos, card1, card2, i
   integer interpret_card, move

   repeat {    # until a valid move or command is seen
      call prompt ("Card to move: "s)
      call vtenb (PROMPT_ROW, 15, 10)
      call vtread (PROMPT_ROW, 15, YES)
      call vtgetl (command, PROMPT_ROW, 15, 10)
      i = 1
      SKIPBL (command, i)
      select
         when (command (i) == 'x'c, command (i) == 'X'c)
            Game_over = TRUE
         when (command (i) == 'i'c, command (i) == 'I'c)
            if (command (i+1) == EOS || command (i+1) == ' 'c) {
               Red = '*'c
               Black = ' 'c
               }
            else {                     # set color indicators
               Red = command (i+1)
               Black = command (i+2)
               }
         when (command (i) == EOS)
            call flip_stack
      ifany {
         call message (EOS)
         break
         }

      pos = 1
      card1 = interpret_card (command, pos)
      if (card1 ~= EOF) {
         card2 = interpret_card (command, pos)
         if (move (card1, card2) == OK) {
            call message (EOS)
            break
            }
         }
      else
         call message ("Enter cards in form <rank><suit>"s)
      }

   return
   end



# uniform --- generate uniform variate

   integer function uniform (lwb, upb)
   integer lwb, upb

   uniform = lwb + (upb - lwb) * rnd (0) + 0.5

   return
   end
