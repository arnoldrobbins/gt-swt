# type --- returns type of character

   character function type(c)
   character c

   select (c)
      when ('a'c, 'b'c, 'c'c, 'd'c, 'e'c, 'f'c, 'g'c, 'h'c, 'i'c, 'j'c,
            'k'c, 'l'c, 'm'c, 'n'c, 'o'c, 'p'c, 'q'c, 'r'c, 's'c, 't'c,
            'u'c, 'v'c, 'w'c, 'x'c, 'y'c, 'z'c,
            'A'c, 'B'c, 'C'c, 'D'c, 'E'c, 'F'c, 'G'c, 'H'c, 'I'c, 'J'c,
            'K'c, 'L'c, 'M'c, 'N'c, 'O'c, 'P'c, 'Q'c, 'R'c, 'S'c, 'T'c,
            'U'c, 'V'c, 'W'c, 'X'c, 'Y'c, 'Z'c)
         type = LETTER
      when ('0'c, '1'c, '2'c, '3'c, '4'c, '5'c, '6'c, '7'c, '8'c, '9'c)
         type = DIGIT
      else
         type = c

   return
   end
