   integer bit_field, word, start, end
   stmt_func bit_field (word, start, end) = _
      rt (rs (word, BITS_PER_WORD - end), end - start + 1)
