# swtmlb :  Software Tools mathematical function library

include "swtmlb_link.r.i"

include PRIMOS_KEYS

define(BITS_PER_WORD,16)
define(BITS_PER_LONG_WORD,32)

define(LASTPRIME,78498)

define (PRESENT, 1)
define (NOT_PRESENT, 0)

define (WORDS(bits),((bits+BITS_PER_WORD-1)/BITS_PER_WORD))
      # (the number of words required to contain 'bits' bits)



# prime --- get the ith prime number

   long_int function prime (i)
   long_int i

   integer fd, junk
   integer open, mapfd

   if (i < 1 || i > LASTPRIME)
      return (0)

   fd = open ("=aux=/primes"s, READ)
   if (fd == ERR)
      return (0)

   call prwf$$ (KREAD + KPREA, mapfd (fd), loc (prime), 2, (i-1)*2,
      junk, junk)
   call close (fd)

   return
   end



# invmod --- find the inverse of an integer modulo another integer
#     ERR is returned if the given integers are not relatively prime

   long_int function invmod (x1, x0)
   long_int x1, x0

   long_int x_i, x_im1, x_im2       # for Euclid's algorithm
   long_int a_i, a_im1, a_im2,
            b_i, b_im1, b_im2       # for inverse determination
   long_int factor

   x_im2 = x0; a_im2 = 1; b_im2 = 0
   x_im1 = x1; a_im1 = 0; b_im1 = 1

   repeat {

      if (x_im2 > x_im1) {
         factor = x_im2 / x_im1     # integer division, remember
         x_i = mod (x_im2, x_im1)
         a_i = a_im2 - factor * a_im1
         b_i = b_im2 - factor * b_im1
         }

      else if (x_im1 > x_im2) {
         factor = x_im1 / x_im2
         x_i = mod (x_im1, x_im2)
         a_i = a_im1 - factor * a_im2
         b_i = b_im1 - factor * b_im2
         }

      else                          # egad, they're not relatively prime
         return (ERR)

      x_im2 = x_im1; a_im2 = a_im1; b_im2 = b_im1
      x_im1 = x_i; a_im1 = a_i; b_im1 = b_i

      } until (x_i == 1)

   if (b_i <= 0)
      return (b_i + x0)     # always return positive result
   return (b_i)

   end



# pwrmod --- calculate an exponential, modulo a given modulus
#     (function result is p ** E mod n)

   long_int function pwrmod (p, E, n)
   long_int p, E, n

   integer i
   long_int result
   define(bit_i,rt (rs (E, BITS_PER_LONG_WORD - i), 1)) # i'th bit of E

   result = 1
   for (i = 1; i <= BITS_PER_LONG_WORD; i += 1)
      if (bit_i == 0)
         result = mod (result * result, n)
      else
         result = mod (mod (result * result, n) * p, n)

   return (result)
   end



# gcd --- determine the greatest common divisor of two long integers

   long_int function gcd (x0, x1)
   long_int x0, x1

   long_int x_i, x_im1, x_im2       # for Euclid's algorithm
   long_int max0, min0, iabs

   x_im2 = max0 (x0, x1)
   x_im1 = min0 (x0, x1)

   repeat {
      if (x_im2 > x_im1)
         x_i = mod (x_im2, x_im1)
      else
         x_i = mod (x_im1, x_im2)

      x_im2 = x_im1
      x_im1 = x_i

      } until (x_i == 0)

   return (iabs (x_im2))
   end



# set_create --- generate a new initially empty set

   pointer function set_create (set, size)
   pointer set
   integer size

   integer Mem (ARB)
   common /ds$mem/ Mem

   pointer dsget

   set = dsget (WORDS (size) + 1)
   Mem (set) = size
   call set_init (set)
   return (set)

   end



# set_remove --- remove a set that is no longer needed

   subroutine set_remove (set)

   pointer set

   call dsfree (set)

   return
   end



# set_init --- cause a set to be empty

   subroutine set_init (set)
   pointer set

   integer Mem (ARB)
   common /ds$mem/ Mem

   integer i, size

   size = WORDS (Mem (set))
   do i = 1, size
      Mem (set + i) = 0

   return
   end



# set_copy --- make a copy of one set in another

   subroutine set_copy (source, destination)
   pointer source, destination

   integer Mem (ARB)
   common /ds$mem/ Mem

   integer i, size

   size = WORDS (min0 (Mem (source), Mem (destination)))
   do i = 1, size
      Mem (destination + i) = Mem (source + i)

   return
   end



# set_intersect --- place intersection of two sets in a third

   subroutine set_intersect (set1, set2, destination)
   pointer set1, set2, destination

   integer Mem (ARB)
   common /ds$mem/ Mem

   integer i, size
   integer and

   size = WORDS (min0 (Mem (destination), min0 (Mem (set1), Mem (set2))))
   do i = 1, size
      Mem (destination + i) = and (Mem (set1 + i), Mem (set2 + i))

   return
   end



# set_union --- place union of two sets in a third

   subroutine set_union (set1, set2, destination)
   pointer set1, set2, destination

   integer Mem (ARB)
   common /ds$mem/ Mem

   integer i, size
   integer or

   size = WORDS (min0 (Mem (destination), min0 (Mem (set1), Mem (set2))))
   do i = 1, size
      Mem (destination + i) = or (Mem (set1 + i), Mem (set2 + i))

   return
   end



# set_insert --- place given element in a set

   subroutine set_insert (element, set)
   integer element
   pointer set

   integer Mem (ARB)
   common /ds$mem/ Mem

   integer word
   integer or, ls

   if (element > Mem (set) || element < 1)
      call error ("in set_insert:  element out of range"p)
   word = set + (element - 1) / BITS_PER_WORD + 1
   Mem (word) = or (Mem (word),
      ls (1, BITS_PER_WORD - 1 - mod (element - 1, BITS_PER_WORD)))

   return
   end



# set_delete --- remove given element from a set

   subroutine set_delete (element, set)
   integer element
   pointer set

   integer Mem (ARB)
   common /ds$mem/ Mem

   integer word
   integer and, not, ls

   if (element > Mem (set) || element < 1)
      call error ("in set_delete:  element out of range"p)
   word = set + (element - 1) / BITS_PER_WORD + 1
   Mem (word) = and (Mem (word),
      not (ls (1, BITS_PER_WORD - 1 - mod (element - 1, BITS_PER_WORD))))

   return
   end



# set_element --- see if a given element is in a set

   integer function set_element (element, set)
   integer element
   pointer set

   integer Mem (ARB)
   common /ds$mem/ Mem

   integer word
   integer and, ls

   if (element > Mem (set) || element < 1)
      call error ("in set_element:  element out of range"p)
   word = set + (element - 1) / BITS_PER_WORD + 1
   if (and (Mem (word),
     ls (1, BITS_PER_WORD - 1 - mod (element - 1, BITS_PER_WORD))) ~= 0)
      return (PRESENT)
   return (NOT_PRESENT)

   end



# set_equal --- return .true. if two sets contain the same members

   logical function set_equal (set1, set2)
   pointer set1, set2

   logical set_subset

   return (set_subset (set1, set2) & set_subset (set2, set1))

   end



# set_subset --- return .true. if set1 is a subset of set2

   logical function set_subset (set1, set2)
   pointer set1, set2

   integer Mem (ARB)
   common /ds$mem/ Mem

   integer i, size, size1, size2
   integer and, not, set_element

   size1 = Mem (set1)
   size2 = Mem (set2)

   if (size1 > size2)      # must have all larger elements NOT_PRESENT
      for (i = size2 + 1; i <= size1; i += 1)
         if (set_element (i, set1) == PRESENT)
            return (.false.)

   if (size2 > size1)      # same if right-hand set is larger
      for (i = size1 + 1; i <= size2; i += 1)
         if (set_element (i, set2) == PRESENT)
            return (.false.)

   size = WORDS (min0 (size1, size2))
   do i = 1, size
      if (and (Mem (set1 + i), not (Mem (set2 + i))) ~= 0)
         return (.false.)

   return (.true.)
   end



# set_subtract --- place difference of two sets in a third

   subroutine set_subtract (set1, set2, destination)
   pointer set1, set2, destination

   integer Mem (ARB)
   common /ds$mem/ Mem

   integer i, size
   integer and, not

   size = WORDS (min0 (Mem (destination), min0 (Mem (set1), Mem (set2))))
   do i = 1, size
      Mem (destination + i) = and (Mem (set1 + i), not (Mem (set2 + i)))

   return
   end
