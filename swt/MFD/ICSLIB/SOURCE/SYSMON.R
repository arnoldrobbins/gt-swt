# sysmon --- program to create light bar graphs of system performance
#

   include ARGUMENT_DEFS

   include "sysmon.i"

define (DEFAULT_TIME, 500)
define (LOG_TIME_DEFAULT, 15)
define (DEBUG, #)

   integer*4 del_backstop
   integer*4 del_user
   integer*4 del_cpu
   integer*4 del_pgfault
   integer*4 del_time
   integer*4 del_disk
   integer*4 del_ring

   integer*4 del_real_time
   integer*4 del_log_time

   integer bar, average, open
   integer*4 interval
   integer i, temp, fd
   integer datestr(10), timestr(10)

   logical tquit$, flag

   ARG_DECL

   integer loc(7)
   common /lights/ loc

   del_real_time = 0

   PARSE_COMMAND_LINE ("l<ri> s<ri>"s,
      "Usage: sysmon [-l <log time in mins>] [-s <meter time in msec>]"s)

   ARG_DEFAULT_INT (l, LOG_TIME_DEFAULT)
   del_log_time = 60000 * ARG_VALUE (l)

   ARG_DEFAULT_INT (s, DEFAULT_TIME)
   interval = intl (ARG_VALUE (s))

DEBUG call print (ERROUT, "meter interval in msec:  *l*n"s, interval)
DEBUG call print (ERROUT, "log time interval in ms: *l*n"s, del_log_time)

   do i = 1, 7       # init light locations in case not filled
      loc(i) = 0

   fd = open ("//acct/syslog"s, WRITE)
   if (fd ~= ERR) {
      call wind (fd)
      call print (fd, "### System monitor startup ###*n"s)
      call close (fd)
      }

   call get_times    # get initial times
   call last_times   # make them the last times

   log_tcputime = 0  # initialize log delta times
   log_pg_fault = 0
   log_backstop = 0
   log_dusertime = 0
   log_cur_time = 0
   log_disk_use = 0
   log_ring_cpu = 0

   repeat {
      if (tquit$ (flag))
         stop
      call sleep$ (interval)
      call get_times    # get new times

      del_time = cur_time - l_cur_time       # time between intervals
      del_cpu = tcputime - l_tcputime        # difference in cpu time
      del_backstop = backstop - l_backstop   # delta backstop time
      del_pgfault = pg_fault - l_pg_fault    # delta page faults
      del_user = dusertime                   # delta user time
      del_disk = disk_use - l_disk_use       # delta disk accesses
      del_ring = ring_cpu - l_ring_cpu       # delta ring process time

      log_cur_time += del_time
      log_tcputime += del_cpu
      log_backstop += del_backstop
      log_pg_fault += del_pgfault
      log_dusertime += del_user
      log_disk_use += del_disk
      log_ring_cpu += del_ring

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

      del_real_time += del_time     # keep track of number of seconds
      if (del_real_time >= del_log_time) {   # time to log stuff
DEBUG    call print (ERROUT, "Doing log*n"s)
         del_real_time = 0
         fd = open ("//acct/syslog"s, WRITE)
         if (fd == ERR)
            next
DEBUG    call print (ERROUT, "log file open.*n"s)
         call wind (fd)
         call date (SYS_DATE, datestr)
         datestr(6) = EOS  # chop off trailing slash and year
         call date (SYS_TIME, timestr)
         call print (fd,
            "*7l *7l *7l *7l *7l *7l *7l    *s *s*n"s,
            log_cur_time,
            log_tcputime,
            log_backstop,
            log_pg_fault,
            log_dusertime,
            log_disk_use,
            log_ring_cpu,
            datestr,
            timestr)
DEBUG    call print (ERROUT,
DEBUG       "*7l *7l *7l *7l *7l *7l *7l    *s *s*n"s,
DEBUG       log_cur_time,
DEBUG       log_tcputime,
DEBUG       log_backstop,
DEBUG       log_pg_fault,
DEBUG       log_dusertime,
DEBUG       log_disk_use,
DEBUG       log_ring_cpu,
DEBUG       datestr,
DEBUG       timestr)
         call close (fd)
         log_tcputime = 0
         log_pg_fault = 0
         log_backstop = 0
         log_cur_time = 0
         log_disk_use = 0
         log_ring_cpu = 0
         log_dusertime = 0
         }
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
