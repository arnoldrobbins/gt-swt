# common blocks for solitaire

   common /solcom/ Deck, Deck_index, Pile, Times_thru, Game_type,
      Games_played, Total_winnings, Red, Black, Game_over

   integer _
      Deck (DECK_SIZE, 52),         # Shuffled deck of cards
      Deck_index (52),              # Index to locate specific card
      Pile (PILE_SIZE, NPILES),     # Array of card queues
      Times_thru,                   # Number of passes through the stock
      Game_type,                    # CASINO or REGULAR
      Games_played,                 # Number of CASINO games played
      Total_winnings                # Current casino tab

   character _
      Red,                          # Char. to display with red cards
      Black                         # Char. to display with black cards

   logical _
      Game_over                     # Game ends when set to TRUE
