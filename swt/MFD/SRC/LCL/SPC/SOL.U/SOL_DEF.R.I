# Card stack array definitions (viz. solcom.Pile):

define (ACES,14)              # offset in Pile of first ace stack
define (STOCK,19)             # offset in Pile of stock stack
define (DUMMY,21)             # offset in Pile of a dummy card stack
define (FACE_DN,7)            # offset in Pile of first face down stack
define (FACE_UP,0)            # offset in Pile of first face up stack
define (WASTE,20)             # offset in Pile of discard stack


# Card stack field definitions (viz. solcom.Pile):

define (COUNT,1)              # number of cards in the stack
define (TOP_CARD,2)           # Deck index of top card in stack


# Card deck field definitions (viz. solcom.Deck):

define (LINK,1)               # Deck index of next card in the stack
define (PLACE,2)              # Pile index of stack this card is in
define (VALUE,3)              # value of this card (suit * 16 + rank)


# Miscellaneous definitions:

define (RED,0)                # used by 'check_stack' to verify move
define (BLACK,1)              #            --- ditto ---
define (CASINO,0)             # possible value of solcom.Game_type
define (REGULAR,1)            # possible value of solcom.Game_type


# Size constants for array dimensioning:

define (DECK_SIZE,3)          # Number of fields per entry in Deck array
define (NPILES,21)            # Number of card stacks in the Pile array
define (PILE_SIZE,2)          # Number of fields per card stack


# Include file definitions:

define (SOL_COMMON,"sol_com.r.i")
define (LOG_FILE,"//games/sol.log"s)


# Screen position definitions:

define (ACE_LABEL_ROW,3)
define (ACE_LABEL_COL,7)
define (ACE_ROW,3)
define (ACE_COL,18)
define (ACE_WIDTH,7)
define (CASINO_ROW,22)
define (CASINO_COL,50)
define (HELP_ROW,9)
define (LAYOUT_LABEL_ROW,6)
define (LAYOUT_LABEL_COL,17)
define (MSG_ROW,21)
define (PASS_LABEL_ROW,4)
define (PASS_LABEL_COL,48)
define (PASS_ROW,4)
define (PASS_COL,60)
define (PILE_ROW,6)
define (PILE_COL,30)
define (PILE_WIDTH,7)
define (PROMPT_ROW,20)
define (STATUS_ROW,24)
define (STOCK_LABEL_ROW,3)
define (STOCK_LABEL_COL,59)
define (STOCK_ROW,3)
define (STOCK_COL,67)
define (TALLY_ROW,23)
define (TALLY_COL,67)
define (TIME_ROW,1)
define (TIME_COL,41)
define (WASTE_ROW,4)
define (WASTE_COL,68)
