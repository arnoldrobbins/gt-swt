# stats_com.r.i --- common declarations for the 'stats' program

   integer Print_total, Print_average, Print_mode, Print_sdev,
      Print_variance, Print_high, Print_low, Print_range, Quiet,
      Print_ranks, Percentile, Print_n

   common /optcom/ Print_total, Print_average, Print_mode,
      Print_sdev, Print_variance, Print_high, Print_low,
      Print_range, Quiet, Print_ranks, Percentile, Print_n

   floating Value (MAXMEASURES)
   integer N

   common /valcom/ Value, N
