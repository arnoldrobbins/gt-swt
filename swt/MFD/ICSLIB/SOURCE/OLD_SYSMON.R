# sysmon --- program to create light bar graphs of system performance
#

   include "sysmon.i"

define (DEFAULT_TIME, 500)

   integer*4 del_backstop
   integer*4 del_user
   integer*4 del_cpu
   integer*4 del_pgfault
   integer*4 del_time
   integer*4 del_disk
   integer*4 del_ring

   integer getarg, ctoi, bar, average
   integer interval
   integer arg(MAXLINE), i, temp

   integer loc(7)
   common /lights/ loc

   if (EOF == getarg (1, arg, MAXLINE)) {
      interval = DEFAULT_TIME
      }
   else {
      i = 1
      interval = ctoi (arg, i)  # in miliseconds
      if (interval <= 0)
         interval = DEFAULT_TIME
      }

   do i = 1, 7       # init light locations in case not filled
      loc(i) = 0

   call get_times    # get initial times
   call last_times   # make them the last times

   repeat {
      call sleep$ (intl(interval))
      call get_times    # get new times

      del_time = cur_time - l_cur_time       # time between intervals
      del_cpu = tcputime - l_tcputime        # difference in cpu time
      del_backstop = backstop - l_backstop   # delta backstop time
      del_pgfault = pg_fault - l_pg_fault    # delta page faults
      del_user = dusertime                   # delta user time
      del_disk = disk_use - l_disk_use       # delta disk accesses
      del_ring = ring_cpu - l_ring_cpu       # delta ring process time

      temp = average (((del_user * 10000 / del_cpu) / 100), 1)
      loc(1) = bar (temp, 0, 100)

      temp = average ((del_pgfault * 1000 / del_time), 2)
      loc(2) = bar (temp, 0, 26)

      temp = average (((del_backstop * 10000 / del_cpu) / 100), 3)
      loc(3) = bar (temp, 0, 100)

      temp = average ((del_disk * 1000 / del_time), 4)
      loc(4) = bar (temp, 0, 35)

      temp = average (((del_ring * 10000 / del_cpu) / 10), 5)
      loc(5) = bar (temp, 0, 40)    # 4% max for finer resolution

      call last_times
      }
   end

# get_times --- subroutine to fetch meter times from primos

   subroutine get_times

include "sysmon.i"

   integer*4 usertime, l_usertime
   common /users/ usertime, l_usertime

   integer i
   integer code
   integer*4 meters(15)   # buffer for meter values

   call gmetr$ (GMSYS, loc(meters), 30, code, 0)
   tcputime = meters(2)
   cur_time = meters(4)
   disk_use = meters(5)

   call gmetr$ (GMINT, loc(meters), 30, code, 0)
   backstop = meters(9)
   l_usertime = usertime
   usertime = tcputime
   dusertime = usertime - l_usertime
   tcputime = tcputime + _
      backstop + _                 # backstop process time
      meters(2) + _                # clock time
      meters(3) + _                # amlc time
      meters(4) + _                # mpc_1 time
      meters(5) + _                # mpc_2 time
      meters(6) + _                # ipc net time
      meters(7) + _                # ring net time
      meters(8) + _                # smlc time
      meters(10)+ _                # disk_1 time
      meters(11)                   # disk_2 time
   ring_cpu = meters(7)            # save ring cpu time

   call gmetr$ (GMFS, loc(meters), 30, code, 0)
   pg_fault = meters(2)

   return
   end

# last_times --- subroutine to make current times the last times
subroutine last_times

   include "sysmon.i"

   l_backstop = backstop
   l_tcputime = tcputime
   l_pg_fault = pg_fault
   l_cur_time = cur_time
   l_disk_use = disk_use
   l_ring_cpu = ring_cpu

   return
   end

# average --- function to average last three values plus current
integer function average (current, index)

   integer*4 current
   integer index

   include "sysmon.i"

   integer*4 sum

   sum = previous(index,1) + _
         previous(index,2) + _
         previous(index,3) + _
         current

   previous(index,1) = previous(index,2)
   previous(index,2) = previous(index,3)
   previous(index,3) = current

   average = sum / intl(4)

   return
   end
