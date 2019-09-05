# masks --- character bit masks for 'block'

#     The data contained in this file are organized as follows:

#  Each character is printed as a 9x5 matrix where rows 1 - 7
#  are printed above the line and rows 8 and 9 are printed
#  below the line (e.g., for descenders).

#  Each group of 3 words describes one of the 96 printable ASCII
#  characters (blank is considered printable here).  Each word
#  of a group describes three rows of the character with bit 16
#  (least significant) of the word corresponding to the leftmost
#  column of the first row, and bit 2 of the word corresponding to
#  the rightmost column of the third row.  Rows 1 - 3 are described
#  by the first word in the group, rows 4 - 6 by the second, and
#  rows 7 - 9 by the third.

#  Pictorially, the format is as follows:

#              1.16  1.15  1.14  1.13  1.12
#              1.11  1.10  1.09  1.08  1.07
#              1.06  1.05  1.04  1.03  1.02
#              2.16  2.15  2.14  2.13  2.12
#              2.11  2.10  2.09  2.08  2.07
#              2.06  2.05  2.04  2.03  2.02
#              3.16  3.15  3.14  3.13  3.12
#              3.11  3.10  3.09  3.08  3.07
#              3.06  3.05  3.04  3.03  3.02

#  Note that each pixel has the form w.bb where w indicates
#  the word number in the group of three words for the given
#  character, and bb indicates a particular bit in the word
#  (bit 16 being the least significant bit).

#  Note also that the correspondence of bits to pixels is
#  reversed from what you would normally expect.

#  If a given bit in the word has the value '1', the corresponding
#  pixel is printed black; otherwise, it is left blank.



   integer masks (WORDS_PER_CHAR, 96)  # 96 printable ASCII chars

   data masks /                      0,     0,     0, #     BLANK
       4228,   132,     4,       10570,     0,     0, #  !     "
      32074, 11242,    10,        6084, 16014,     4, #  #     $
       8803, 25668,    24,        5282,  9890,    22, #  %     &
       1090,     0,     0,        2184,  4162,     8, #  '     (
       8322,  4360,     2,       15012, 21956,     4, #  )     *
       4224,  4255,     0,           0,  2048,    34, #  +     ,
          0,    31,     0,           0,     0,     2, #  -     .
       8704,  1092,     0,       26158, 18037,    14, #  /     0
       4292,  4228,    14,       16942,  1100,    31, #  1     2
       8735, 17932,    14,       10632,  9193,     8, #  3     4
      15423, 17936,    14,        1582, 17967,    14, #  5     6
       8735,  2116,     2,       17966, 17966,    14, #  7     8
      17966, 17950,    14,           0,  2050,     0, #  9     :
          0,  2050,    34,        2184,  4161,     8, #  ;     <
      31744,   992,     0,        8322,  4368,     2, #  =     >
       8750,   132,     4,       26158,  1461,    30, #  ?     @
      17732, 18417,    17,       17967, 17967,    15, #  A     B
       1582, 17441,    14,       17967, 17969,    15, #  C     D
       1087,  1071,    31,        1087,  1071,     1, #  E     F
       1086, 18209,    30,       17969, 17983,    17, #  G     H
       4238,  4228,    14,       16912, 17936,    14, #  I     J
       5425,  9379,    17,        1057,  1057,    31, #  K     L
      22385, 17973,    17,       20017, 18229,    17, #  M     N
      17966, 17969,    14,       17967,  1071,     1, #  O     P
      17966,  9905,    22,       17967,  9391,    17, #  Q     R
       1582, 17934,    14,        4255,  4228,     4, #  S     T
      17969, 17969,    14,       17969, 10801,     4, #  U     V
      17969, 28341,    17,       10801, 17732,    17, #  W     X
      10801,  4228,     4,        8735,  1092,    31, #  Y     Z
       2142,  2114,    30,        2080, 16644,     0, #  [     /
       8463,  8456,    15,       21956,  4228,     4, #  ]     ^
          0,     0,   992,       16648,     0,     0, #  _     `
      14336, 18384,    30,       15393, 17969,    15, #  a     b
      30720,  1057,    30,       31248, 17969,    30, #  c     d
      14336,  2033,    14,        4232,  4238,     4, #  e     f
      14336, 17969, 14878,       15393, 17969,    17, #  g     h
       6148,  4228,    14,         128,  4228,  2180, #  i     j
      18498, 10442,    18,        4230,  4228,    14, #  k     l
      11264, 22197,    21,       15360, 17969,    17, #  m     n
      14336, 17969,    14,       15360, 17969,  1071, #  o     p
      30720, 17969, 16926,       26624,  2118,     2, #  q     r
      30720, 16833,    15,       14468,  4228,     8, #  s     t
      17408, 17969,    30,       17408, 10801,     4, #  u     v
      17408, 22065,    10,       17408, 10378,    17, #  w     x
      17408, 17969, 14878,       31744,  2184,    31, #  y     z
       4248,  4226,    24,        4228,  4228,     4, #  {     |
       4227,  4232,     3,        2048,   277,     0, #  }     ~
      32767, 32767,    31 /                           #  DEL
