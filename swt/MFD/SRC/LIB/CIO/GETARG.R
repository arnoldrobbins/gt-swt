# getarg --- an interlude to grab primos command args

   integer function getarg (arg_num, eos_buf, buf_len)
   integer arg_num, buf_len
   character eos_buf (buf_len)

   define (RT_NEXT,2)
   define (RT_RESET,3)
   define (RT_EOF,6)

   integer info (8), buffer (80), code, i
   integer ptoc, equal

# Reset the pointer to the command line first

   call rdtk$$ (RT_RESET, info, buffer, 80, code)

# Check for a user or system program calling us
# If the first arg is an "R" or a "SEG", ignore it.

   call rdtk$$ (RT_NEXT, info, buffer, 80, code)
   call ptoc (buffer, ' 'c, eos_buf, 80)
   call mapstr (eos_buf, LOWER)
   if (equal (eos_buf, "r"s) == YES || equal (eos_buf, "seg"s) == YES)
        call rdtk$$ (RT_NEXT, info, buffer, 80, code)

# Now scan until we get the argument that we wanted

   for (i = 0; i < arg_num && info (1) ~= RT_EOF; i += 1)
      call rdtk$$ (RT_NEXT, info, buffer, 80, code)

# Now process the correct argument

   if (info (1) == RT_EOF)
      return (EOF)

   return (ptoc (buffer, ' 'c, eos_buf, 80))
   end
