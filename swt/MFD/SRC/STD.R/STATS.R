# stats --- generate statistics from list of measurements

   define (MAXMEASURES, 4000)

   call options
   call sadistics

   stop
   end



# options --- fetch options from command line

   subroutine options

   include "stats_com.r.i"

   character arg (MAXLINE)

   integer i
   integer getarg, ctoi

  # defaults:
   Print_total = NO
   Print_average = YES
   Print_mode = NO
   Print_sdev = YES
   Print_variance = NO
   Print_high = NO
   Print_low = NO
   Print_range = NO
   Quiet = NO
   Print_ranks = YES
   Percentile = 50
   Print_n = NO

   if (getarg (1, arg, MAXLINE) ~= EOF && arg (1) == '-'c) {
      Print_total = NO
      Print_average = NO
      Print_mode = NO
      Print_sdev = NO
      Print_variance = NO
      Print_high = NO
      Print_low = NO
      Print_range = NO
      Quiet = NO
      Print_ranks = NO
      Print_n = NO
      for (i = 2; arg (i) ~= EOS; i = i + 1)
         if (arg (i) == 't'c || arg (i) == 'T'c)
            Print_total = YES
         else if (arg (i) == 'a'c || arg (i) == 'A'c)
            Print_average = YES
         else if (arg (i) == 'm'c || arg (i) == 'M'c)
            Print_mode = YES
         else if (arg (i) == 's'c || arg (i) == 'S'c)
            Print_sdev = YES
         else if (arg (i) == 'v'c || arg (i) == 'V'c)
            Print_variance = YES
         else if (arg (i) == 'h'c || arg (i) == 'H'c)
            Print_high = YES
         else if (arg (i) == 'l'c || arg (i) == 'L'c)
            Print_low = YES
         else if (arg (i) == 'r'c || arg (i) == 'R'c)
            Print_range = YES
         else if (arg (i) == 'q'c || arg (i) == 'Q'c)
            Quiet = YES
         else if (arg (i) == '%'c) {
            Print_ranks = YES
            i = i + 1
            Percentile = ctoi (arg, i)
            if (Percentile == 0)
               Percentile = 10
            i = i - 1
            }
         else if (arg (i) == 'n'c || arg (i) == 'N'c)
            Print_n = YES
         else
            call error ("Usage:  stats [-(t|a|m|s|v|h|l|r|q|n|%<int>)].")
      }

   return
   end



# sadistics --- calculate and print requested statistics

   subroutine sadistics

   include "stats_com.r.i"

   integer i, p, occurs, mode_occurs, index, mode_index, ranks
   integer input
   logical keep

   longreal sum, sumsq, average, variance, low, high, v

   sum = 0.0
   sumsq = 0.0

   keep = (Print_ranks ~= 0 | Print_mode ~= NO)
   for (N = 1; input (STDIN, "*f.", v) ~= EOF; N += 1) {
      sum += v
      sumsq += v * v
      if (N == 1) {
         low = v
         high = v
         }
      else if (v > high)
         high = v
      else if (v < low)
         low = v
      if (keep)
         Value (N) = v
      }
   N -= 1      # actual number of Values read

   if (N == 0)
      return

   average = sum / N
   variance = N * (average ** 2) - 2 * average * sum + sumsq
   if (N > 1)
      variance /= N - 1

   if (Print_total == YES) {
      call label ("total.")
      call print (STDOUT, "*d*n.", sum)
      }

   if (Print_n == YES) {
      call label ("size.")
      call print (STDOUT, "*i*n.", N)
      }

   if (Print_average == YES) {
      call label ("average.")
      call print (STDOUT, "*d*n.", average)
      }

   if (Print_low == YES) {
      call label ("low.")
      call print (STDOUT, "*d*n.", low)
      }

   if (Print_high == YES) {
      call label ("high.")
      call print (STDOUT, "*d*n.", high)
      }

   if (Print_range == YES) {
      call label ("range.")
      call print (STDOUT, "*d*n.", high - low)
      }

   if (Print_variance == YES) {
      call label ("variance.")
      call print (STDOUT, "*d*n.", variance)
      }

   if (Print_sdev == YES) {
      call label ("std dev.")
      call print (STDOUT, "*d*n.", dsqrt (variance))
      }

   if (Print_ranks == YES) {
      call sort
      ranks = int (100.0 / Percentile + .5)
      p = Percentile
      for (i = 1; i < ranks; i += 1) {
         if (Quiet == NO)
            call print (STDOUT, "*2i%        .", p)
         call print (STDOUT, "*d*n.", Value (int ((i * N) / ranks + .5)))
         p += Percentile
         }
      }

   if (Print_mode == YES) {
      mode_occurs = 1
      mode_index = int (N / 2.0 + .5)
      for (i = 1; i <= N; ) {
         index = i
         occurs = 1
         repeat {
            i += 1
            if (i > N || Value (i) ~= Value (index))
               break
            occurs += 1
            }
         if (occurs > mode_occurs) {
            mode_occurs = occurs
            mode_index = index
            }
         }
      call label ("mode.")
      call print (STDOUT, "*d*n.", Value (mode_index))
      }

   return
   end



# label --- output label for some useful piece of information

   subroutine label (lab)
   integer lab (ARB)

   include "stats_com.r.i"

   character buf (MAXLINE)

   integer i
   integer ptoc

   if (Quiet == NO) {
      call print (STDOUT, "*p.", lab)
      for (i = ptoc (lab, '.'c, buf, MAXLINE); i <= 10; i += 1)
         call putch (' 'c, STDOUT)
      }

   return
   end



# sort --- place array 'value' in ascending order
#           (Shell sort from Ch. 4 Software Tools)

   subroutine sort

   include "stats_com.r.i"

   integer gap, i, j, jg

   longreal k

   for (gap = N / 2; gap > 0; gap /= 2)
      for (i = gap + 1; i <= N; i += 1)
         for (j = i - gap; j > 0; j -= gap) {
            jg = j + gap
            if (Value (j) <= Value (jg))
               break
            k = Value (j)
            Value (j) = Value (jg)
            Value (jg) = k
            }

   return
   end
