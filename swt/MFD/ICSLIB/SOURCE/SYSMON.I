# sysmon.i --- include file for meter definitions
#

   integer*4 tcputime, l_tcputime   # total cpu time
   integer*4 pg_fault, l_pg_fault   # number of page faults
   integer*4 backstop, l_backstop   # backstop time
   integer*4 dusertime, l_dusertime # delta user cpu time
   integer*4 cur_time, l_curtime    # time since boot in mSec
   integer*4 disk_use, l_disk_use   # disk accesses
   integer*4 ring_cpu, l_ring_cpu   # ring net time

   common /metrs/ tcputime, l_tcputime,
      pg_fault, l_pg_fault,
      backstop, l_backstop,
      dusertime, l_dusertime,
      cur_time, l_cur_time,
      disk_use, l_disk_use,
      ring_cpu, l_ring_cpu

   integer*4 log_tcputime    # log total cpu time
   integer*4 log_pg_fault    # log page faults
   integer*4 log_backstop    # log backstop time
   integer*4 log_dusertime   # log delta user time
   integer*4 log_cur_time    # log real time
   integer*4 log_disk_use    # log disk accesses
   integer*4 log_ring_cpu    # log ring cpu time

   common /logval/ log_tcputime,
                   log_pg_fault,
                   log_backstop,
                   log_dusertime,
                   log_cur_time,
                   log_disk_use,
                   log_ring_cpu

   integer*4 previous(8,3)
   common /weight/ previous

   define (GMSYS,1)  # system meters
   define (GMFS, 2)  # file system meters
   define (GMINT,3)  # interrput meters
   define (GMUSR,4)  # user meters
