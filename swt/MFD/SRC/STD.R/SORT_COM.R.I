# sort_com.r.i --- common declarations for the 'sort' program

   integer direction       # =1 for ascending sort, -1 for descending
   integer dictionary      # Use dictionary collating sequence

   common /copts/ direction, dictionary
