# banner --- produce banner from arguments on Standard Output

# Original Fortran version:
#  by Joseph J. Greiner, Jr.
#  Department of Civil Engineering
#  Virginia Polytechnic Institute
#  Blacksburg, Virginia
#  July, 1975
# With modifications by:
#  Daniel S. Cox
#  Department of Electrical Engineering
#  Georgia Institute of Technology
#  February, 1978


#  Typeface: Fortune Light by Bauer Type Foundry;
#  nominal size, 8 inches high

#  Most 029 (EBCDIC) keypunch symbols, plus lower-case multi-
#  punching, can be interpreted by this program.



   define(div,/)
   define(MAXKARD,78)
   define(MAXSYM,89)
   define(DEFAULT_CHAR,RUBOUT)
   define(TEN2,100)
   define(TEN3,1000)
   define(TEN4,10000)
   define(TEN5,100000)
   define(TEN6,1000000)
   define(TEN7,10000000)
   define(DB,#)

   include "banner_com.r.i"

   integer col, i, maxl, minl, ncols, ntotal, nspare,
      banner_text (MAXKARD), lmax (MAXSYM), lmin (MAXSYM)
   integer index

   data lmax / _
      80,   57,   80,   73,   80,   57,   80,   57,   80,   74,
      80,   57,   80,   57,   80,   80,   80,   57,   80,   80,
      80,   80,   80,   55,   80,   80,   80,   57,   80,   80,
      80,   57,   80,   74,   80,   80,   80,   57,   80,   57,
      80,   57,   80,   55,   80,   55,   80,   55,   80,   55,
      80,   55,   80,   80,   80,   80,   80,   80,   80,   80,
      80,   80,   70,   48,   80,   55,   80,   80,   80,   64,
      80,   80,   80,   80,   80,   80,   80,   88,   80,   80,
      15,   15,   47,   47,   80,   80,   76,   80,   1/

   data lmin / _
       1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
      -1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
       1,    1,    1,   -1,    1,    1,    1,    1,    1,    1,
       1,  -24,    1,  -24,    1,    1,    1,    1,    1,  -24,
     -11,  -24,    1,    1,    1,    1,    1,    1,    1,  -24,
       1,    1,    1,    1,    1,    1,    1,    1,    1,    1,
       1,    1,   11,   33,    1,   26,    1,    1,   61,   19,
       1,    1,    1,    1,    1,    1,    1,   -7,    1,    1,
      -9,    1,    1,   11,   41,   41,    4,    1,    1/

   call do_args (foreground_sym, background_sym, banner_text)
   maxl = -100    # must be less than anything in lmax array
   minl = 100     # must be greater than anything in lmin array
   ntotal = 0
   for (col = 1; banner_text (col) ~= EOS; col += 1) {
      i = index (syma, banner_text (col))
      if (i == 0)
         i = MAXSYM     # index of ' 'c
      if (lmax (i) > maxl)
         maxl = lmax (i)
      if (lmin (i) < minl)
         minl = lmin (i)
      ntotal += symn (i) / TEN4 + 4
      banner_text (col) = i   # replace character by its index
      }
   ncols = maxl - minl + 1
   move = (132 - ncols) / 2 - minl
   nspare = (int (float (ntotal) / 66. + 1.5) * 66 - ntotal - 6) / 2
   call baxx (nspare, 2)
   for (i = 1; i < col; i += 1)
      call prnt (banner_text (i))

   call baxx (nspare + 50, 2)

   stop
   end


# prnt --- manage the printing of a single character
   subroutine prnt (i)
   integer i

   include "banner_com.r.i"

   integer j, k, jout, na, nb, nc, nd, ne, nf, ng, nh, nchk, nsi, ntemp
   integer nshift (MAXSYM)

   longint nch

   data nshift / _
       0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
       2,    0,    0,    0,    0,    0,    0,    0,    0,    0,
       0,    0,    0,    2,    0,    0,    0,    0,    0,    0,
       0,   25,    0,   25,    0,    0,    0,    0,    0,   25,
      12,   25,    0,    0,    0,    0,    0,    0,    0,   25,
       0,    0,    0,    0,    0,    0,    0,    0,    0,    0,
       0,    0,    0,    0,    9,    0,    0,    0,    0,    0,
       0,    0,    0,    0,    0,    0,    0,    8,    0,    0,
      10,    0,    0,    0,    0,    0,    0,    0,    0/

   call baxx (2, 2)
   if (i == MAXSYM) {   # print a blank
      call baxx (50, 2)
      return
      }
   select (i)
      when (16, 22, 36)
         call legl (25, 0)
      when (40)
         call legl (25, 25)
      when (12, 18, 38)
         call legl (0, 0)
      when (8, 20, 28, 42)
         call ohav (1)
      when (1, 9, 15, 17, 19, 21, 25, 29, 35, 39)
         call legu (7)
      when (11, 37)
         call legu (4)
      when (7, 27, 31, 41)
         call ohaf (1)

   if (i ~= 8 && i ~= 12 && i ~= 16) {
      j = mod (symn (i), TEN4) - 1
      jout = mod (symn (i + 1), TEN4)
      nsi = nshift (i)

      repeat {
         ne = 0
         ng = 0
         call baxx (1, 1)
         j += 1
         if (j >= jout)
            break

         nch = nchar (j)   # split character description into its fields
         na = nch div TEN7
         nb = mod (nch div TEN5, TEN2)
         nc = mod (nch div TEN3, TEN2)
         nd = mod (nch div 10, TEN2)
         nchk = mod (nch, 10)
         if (na > nb || nb > nc || nc > nd) {
            ntemp = na
            na = nd
            nd = ntemp
            ntemp = nb
            nb = nc
            nc = ntemp
            }
         if (nchk == 1) {
            j += 1
            nch = nchar (j)
            ne = nch div TEN7
            nf = mod (nch div TEN5, TEN2)
            ng = mod (nch div TEN3, TEN2)
            nh = mod (nch div 10, TEN2)
            nchk = mod (nch, 10)
            if (ne > nf || nf > ng || ng > nh) {
               ntemp = ne
               ne = nh
               nh = ntemp
               ntemp = nf
               nf = ng
               ng = ntemp
               }
            }
         if (nchk == 0)
            nchk = 1
         if (na == 0 && nb == 0) {
            call baxx (nchk, 2)
            next
            }
         call frnt (na - nsi, nb - nsi)
         if (nc ~= 0) {
            call frnt (nc - nsi, nd - nsi)
            if (ne ~= 0) {
               call frnt (ne - nsi, nf - nsi)
               if (ng ~= 0)
                  call frnt (ng - nsi, nh - nsi)
               }
            }
         do k = 1, nchk
            call output (line)
         }
      }

   select (i)
      when (8, 26, 40)
         call ohav (-1)
      when (12, 16)
         call achn
      when (7, 19)
         call ohaf (-1)

   call baxx (2, 2)

   return
   end


# achn --- print the second part of lower case 'h' and 'n'
   subroutine achn

   include "banner_com.r.i"

   integer k, na, nb, nc, nd

   longint kline (30), klk

   data kline / _
         123849,     94249,     84651,     74753,     64854,     64955,
       50550000,  51560000,  51560000,  51570000,  51570000,  51570000,
          65057,     64957,     74857,     84757,     94656,    124156,
         550000,    530000,    520000,    500000,    480000,    440000,
         120000,     90000,     80000,     70000,     60000,     60000/

DB call print (ERROUT, "call achn*n.")

   do k = 1, 30; {
      call baxx (1, 1)
      klk = kline (k)
      na = klk div TEN6
      nb = mod (klk div TEN4, TEN2)
      nc = mod (klk div TEN2, TEN2)
      nd = mod (klk, TEN2)
      call frnt (na, nb)
      if (nc ~= 0)
         call frnt (nc, nd)
      call output (line)
      }

   return
   end


# ohaf --- print common segment of 'C', 'D', 'G', 'O' and 'Q'
   subroutine ohaf (kstep)
   integer kstep

#  kstep == 1 means print left segment
#  kstep == -1 means print right segment

   include "banner_com.r.i"

   integer i, k, n, na, nb, nc, nd

   longint kline (30), klk

   data kline / _
       32480000,  26540000,  23570000,  20600000,  18620000,  16640000,
       14660000,  12680000,  11334769,   9275371,   8245672,   7206073,
        6186274,   5166475,   4146676,   4136776,   3126877,   2116978,
        2107078,   2097178,   1087279,   1087279,   1077379,     77380,
          67480,     67480,     67480,     67480,     67480,     67480/

DB call print (ERROUT, "call ohaf (*i)*n.", kstep)

   if (kstep == 1) {
      k = 0
      n = 17
      }
   else {
      k = 31
      n = 30
      }

   do i = 1, n; {
      call baxx (1, 1)
      k += kstep
      klk = kline (k)   # extract fields
      na = klk div TEN6
      nb = mod (klk div TEN4, TEN2)
      nc = mod (klk div TEN2, TEN2)
      nd = mod (klk, TEN2)
      call frnt (na, nb)
      if (nc ~= 0)
         call frnt (nc, nd)
      call output (line)
      }

   return
   end


# legl --- print initial part of 'h', 'k', 'l', 'm', 'n', 'p' and 'r'
   subroutine legl (n, nx)
   integer n, nx

#  The parameters n and nx indicate the desired letter as follows:

#       h  k  l  m  n  p  r
#   n: 25 25 25  0  0 25  0
#  nx:  0  0  0  0  0 25  0

   include "banner_com.r.i"

   integer i, k
   integer ks (16)

   data ks /6, 7, 48, 51, 7, 8, 47, 48, 8, 9, 46, 47, 9, 12, 43, 46/

DB call print (ERROUT, "call legl (*i, *i)*n.", n, nx)

   call baxx (1, 1)
   call frnt (-nx, 6 - nx)
   call frnt (49 + n - nx, 55 + n - nx)
   call output (line)
   call output (line)

   do i = 1, 4; {
      k = 4 * (i - 1) + 1
      call frnt (ks (k) - nx, ks (k + 1) - nx)
      call frnt (ks (k + 2) + n - nx, ks (k + 3) + n - nx)
      call output (line)
      }

   call frnt (12 - nx, 43 + n - nx)

   do k =1, 6
      call output (line)

   return
   end


# ohav --- print common segment of 'b', 'c', 'd', 'o', 'p' and 'q'
   subroutine ohav (kstep)

#  kstep == 1 means print left segment
#  kstep == -1 means print right segment

   include "banner_com.r.i"

   integer i, k, na, nb, nc, nd

   longint kline (17), klk

   data kline / _
       20370000,  16410000,  13440000,  11460000,   9480000,   7500000,
        6510000,   5203752,   4164153,   3144354,   2124555,   1104756,
        1094856,   1084956,     75057,     75057,     65157/

DB call print (ERROUT, "call ohav (*i)*n.", kstep)

   if  (kstep == 1)
      k = 0
   else
      k = 18

   do i = 1, 17; {
      call baxx (1, 1)
      k += kstep
      klk = kline (k)
      na = klk div TEN6
      nb = mod (klk div TEN4, TEN2)
      nc = mod (klk div TEN2, TEN2)
      nd = mod (klk, TEN2)
      call frnt (na, nb)
      if (nc ~= 0)
         call frnt (nc, nd)
      call output (line)
      }

   return
   end


# legu --- do first part of 'B', 'D', 'E', 'F', 'H', 'I', 'K', 'L', 'M', 'N', 'P' and 'R'
   subroutine legu (n)
   integer n

#  For letters 'M' and 'N', the parameter n has value 4
#  For all other letters, the parameter n has value 7

   include "banner_com.r.i"

   integer i, k
   integer ks (16)

   data ks /7, 8, 72, 73, 8, 9, 71, 72, 9, 10, 70, 71, 10, 13, 67, 70/

DB call print (ERROUT, "call legu (*i)*n.", n)

   call baxx (1, 1)
   call frnt (0, 6)
   call frnt (74, 80)

   do i = 1, 3
      call output (line)

   call frnt (6, 7)
   call frnt (73, 74)

   do i = 1, 3
      call output (line)

   do i = 1, 4; {
      k = 4 * (i - 1) + 1
      call frnt (ks (k), ks (k + 1))
      call frnt (ks (k + 2), ks (k + 3))
      call output (line)
      }

   call frnt (13, 67)
   do i = 1, n
      call output (line)

   return
   end


# baxx --- put background symbols in output lines
   subroutine baxx (n, j)
   integer n, j

#  for j ~= 1,  print n lines of background

   include "banner_com.r.i"

   integer i

DB call print (ERROUT, "call baxx (*i, *i)*n.", n, j)

   do i = 1, 132
      line (i) = background_sym
   if (j == 1)
      return
   do i = 1, n
      call output (line)

   return
   end


# frnt --- put foreground symbols in buffer from na+move through nb+move
   subroutine frnt (na, nb)
   integer na, nb

   include "banner_com.r.i"

   integer i, j, k

DB call print (ERROUT, "call frnt (*i, *i)*n.", na, nb)

   i = na + move
   j = nb + move - 1

DB call print (ERROUT, "start = *i, end = *i*n.", i, j)

   do k = i, j
      line (k) = foreground_sym

   return
   end


# do_args --- get banner text and mode from argument list
   subroutine do_args (foreground_sym, background_sym, banner_text)
   character foreground_sym, background_sym, banner_text (MAXKARD)

   integer getarg
   integer i, reverse_video, junk (2)

   character c, last_arg (MAXKARD)

   if (getarg (1, banner_text, 2) == EOF)
      call error ("Usage: banner { - | -c <char> } <string>.")

   reverse_video = NO
   c = DEFAULT_CHAR
   for (i = 1; getarg (i, last_arg, MAXKARD) ~= EOF; i += 1) {
      if (last_arg (1) == '-'c && last_arg (2) == EOS) {
         if (getarg (i + 1, junk, 1) ~= EOF) # see if there's another arg
            reverse_video = YES
         }
      elif (last_arg (1) == '-'c
        && (last_arg (2) == 'c'c | last_arg (2) == 'C'c)
        && (last_arg (3) == EOS)) {
         if (getarg (i + 2, junk, 1) ~= EOF) {
            i += 1
            if (getarg (i, junk, 2) == 1)
               c = junk (1)
            }
         }
      elif (getarg (i + 1, junk, 1) == EOF)
         break
      }

   call scopy (last_arg, 1, banner_text, 1)
   if (reverse_video == YES) {
      foreground_sym = ' 'c
      background_sym = c
      }
   else {
      foreground_sym = c
      background_sym = ' 'c
      }

   return
   end


# output --- print a line on standard output
   subroutine output (line)
   integer line (ARB)

   integer l (134), i

DB call print (ERROUT, "call output (line)*n.")

   do i = 1, 132
      l (i) = line (i)

   l (133) = NEWLINE
   l (134) = EOS
   call putlin  (l, STDOUT)

   return
   end



# block data for banner program

   include "banner_data.r.i"
