# ctomn --- translate ASCII control character to mnemonic string

   integer function ctomn (c, rep)
   character c, rep (4)

   integer i
   integer scopy

   string_table mnpos, mntext
      "NUL"/ "SOH"/ "STX"/ "ETX"/ "EOT"/ "ENQ"/ "ACK"/ "BEL"/
      "BS"/  "HT"/  "LF"/  "VT"/  "FF"/  "CR"/  "SO"/  "SI"/
      "DLE"/ "DC1"/ "DC2"/ "DC3"/ "DC4"/ "NAK"/ "SYN"/ "ETB"/
      "CAN"/ "EM"/  "SUB"/ "ESC"/ "FS"/  "GS"/  "RS"/  "US"/
      "SP"/  "DEL"

   i = and (c, 8r177)
   if (0 <= i && i <= 32)     # non-printing character
      return (scopy (mntext, mnpos (i + 2), rep, 1))
   elif (i == 127)            # rubout (DEL)
      return (scopy (mntext, mnpos (33 + 2), rep, 1))
   else {                     # printing character
      rep (1) = c
      rep (2) = EOS
      return (1)
      }

   end
