# basys --- basic system simulator

   include "basys_def.r.i"
   include "basys_com.r.i"

   pointer first_job
   pointer alloc

   call initialize_run  # set up initial simulation parameters
   first_job = alloc (JOB_SIZE)     # create first job
   call set_job_parameters (first_job)    # set its parameters
   call sched_event (JOB_ARRIVAL, first_job, system_clock)
   call scheduler    # process event list
   call summarize_run

   stop
   end


#
# advance_memory_queue --- allocate memory space to all eligible jobs

   subroutine advance_memory_queue

#########################################################################
#                                                                       #
#     This subroutine walks through the memory queue looking            #
#  for jobs that will fit into the available memory.  All jobs          #
#  that will fit are dequeued (via calls to 'next_in_line')             #
#  and scheduled for immediate memory requests.                         #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   pointer p, q, job
   pointer next_in_line
   integer avail

   p = queue_pointer (memory_queue)
   avail = available_memory
   for (q = link (p); q ~= LAMBDA; q = link (p)) {
      job = job_pointer (q)
      if (memory_size (job) <= avail) {   # will this job fit?
         if (job ~= next_in_line (memory_queue, p))   # consistency check
            call error ("In advance_memory_queue: can't happen.")
         avail = avail - memory_size (job)
         call sched_event (REQUEST_MEMORY, job, system_clock)
         }
      else
         p = q
      }

   return
   end


#
# await --- enter job in resource queue, accumulate statistics
   subroutine await (job, resource, q_discipline)
   pointer job, resource
   integer q_discipline

#########################################################################
#                                                                       #
#     This subroutine is called when a job requests a resource that is  #
#  not currently available.  Queue statistics are computed and          #
#  updated in the queue header.  The parameter 'q_discipline' may be    #
#  either FIFO, indicating a first-in-first-out discipline should be    #
#  used, or LIFO, indicating a last-in-first-out discipline should be   #
#  used.                                                                #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   pointer entry
   pointer alloc

   entry = alloc (ENTRY_SIZE)    # allocate queue space
   job_pointer (entry) = job
   time_in (entry) = system_clock   # time of entry into queue
   q_priority (entry) = job_priority (job)

   call enqueue (entry, queue_pointer (resource), q_discipline)

   # Update queue statistics:
   time_length (resource) = _
      time_length (resource) + _
      queue_length (resource) * _
      (system_clock - last_activity (resource))
   queue_length (resource) = queue_length (resource) + 1
   max_length (resource) = _
      max0 (queue_length (resource), max_length (resource))
   entry_count (resource) = entry_count (resource) + 1
   last_activity (resource) = system_clock

   return
   end


#
# cancel_event --- delete this job from event list
   subroutine cancel_event (job, event, time)
   pointer job
   integer event
   longint time

#########################################################################
#                                                                       #
#     This subroutine is called to remove a pending event for a job     #
#  that has been preempted from the cpu.  The event queue is searched   #
#  for the desired entry, the entry is unlinked, and the pertinent      #
#  information is returned in the parameters 'event' and 'time'.        #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   pointer p, q

   p = event_queue
   for (q = link (p); q ~= LAMBDA; q = link (p))
      if (job_pointer (q) == job) {    # is this the event we want?
         event = event_type (q)  # pick up event type
         time = event_time (q)   # and time
         link (p) = link (q)     # delete queue entry
         call free (q)   # release queue space
         return
         }
      else
         p = q

   call print (ERROUT, "In cancel_event: (job *i) .", job)
   call error ("event not found.")

   return
   end


#
# dequeue --- remove an entry from head of queue
   pointer function dequeue (queue)
   pointer queue

#########################################################################
#                                                                       #
#     This function removes the entry at the head of the queue speci-   #
#  fied by the parameter 'queue', and returns a pointer to it as the    #
#  value of the function.                                               #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   dequeue = link (queue)
   if (dequeue ~= LAMBDA)
      link (queue) = link (dequeue)

   return
   end


#
# dump_job --- print symbolic representation of job parameters
   subroutine dump_job (job)
   pointer job

#########################################################################
#                                                                       #
#     This subroutine prints out the job parameters generated for each  #
#  job as it enters the system.  Among the data printed are the job     #
#  number, its priority, its time of arrival, the number of i/o         #
#  requests it will make, the amount of memory it requires and the      #
#  average time between i/o requests.                                   #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   call print (STDOUT,
      "*3i  *7,3f       *2i      *2i     *4i       *4i       *7,3f*n.",
      job_number (job), arrival_time (job) / 1d6, job_priority (job),
      memory_size (job), record_size (job), io_requests (job),
      avg_io_interval (job) / 1d3)

   return
   end


#
# end_job --- handle job termination
   subroutine end_job (job)
   pointer job

#########################################################################
#                                                                       #
#     This subroutine is called to handle the termination of a job      #
#  which occurs when the i/o request count for the job is decremented   #
#  to zero.  It releases the cpu and the memory space held by the job,  #
#  and schedules requests for any jobs that may be waiting on these     #
#  resources.                                                           #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   pointer next_job
   pointer next_in_line

   jobs_completed = jobs_completed + 1

   if (cpu_owner ~= job)   # consistency check
      call error ("In end: can't happen.")

   if (event_trace == YES)
      call print (STDOUT2, "Job *3i   terminating    at *7,3f sec*n.",
         job_number (job), system_clock / 1d6)

   call update_cpu_utilization
   cpu_owner = LAMBDA   # release_cpu
   next_job = next_in_line (cpu_queue, queue_pointer (cpu_queue))
   if (next_job ~= LAMBDA)    # a job was waiting, give it the cpu
      call sched_event (REQUEST_CPU, next_job, system_clock)

   call update_memory_utilization
   available_memory = available_memory + memory_size (job)  # release CM
   last_memory_transition = system_clock
   call advance_memory_queue  # allocate memory for all jobs that will fit

   call summarize (job)    # summarize terminating job
   call free (job)       # release its job table entry

   return
   end


#
# enqueue --- add entry to queue
   subroutine enqueue (entry, queue, q_discipline)
   pointer entry, queue
   integer q_discipline

#########################################################################
#                                                                       #
#     This subroutine adds the item pointed to by 'entry' to the        #
#  queue specified by 'queue' according the discipline specified by     #
#  'q_discipline'.  It is the primitive used by the 'enqueue_event'     #
#  and 'await' subroutines to manage the event and resource queues.     #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   pointer p, q
   longint prio

   prio = q_priority (entry)
   if (q_discipline == FIFO)
      prio = prio + 1

   p = queue
   for (q = link (p); q ~= LAMBDA; q = link (p))
      if (prio <= q_priority (q))
         break
      else
         p = q

   link (entry) = q
   link (p) = entry

   return
   end


#
# exponential --- generate exponential variate
   longint function exponential (mean)
   longint mean

#########################################################################
#                                                                       #
#     This subroutine generates exponentially distributed variates      #
#  from the distribution whose mean is given by the parameter 'mean'.   #
#  It is guarranteed to return a positive value.                        #
#                                                                       #
#########################################################################

   exponential = -mean * alog (rnd (0))

   return
   end


#
# initialize_run --- set up initial simulation parameters
   subroutine initialize_run

#########################################################################
#                                                                       #
#     This subroutine initializes a simulation run.  It allocates       #
#  memory for the cpu, disk and memory queue headers and dummy first    #
#  entries for each of these queues.  It also allocates the dummy       #
#  first entry for the event queue.  Simulation parameters are also     #
#  requested from the user and are printed out for the report.          #
#                                                                       #
#########################################################################

   include "basys_com.r.i"
   pointer ptr
   pointer alloc
   character str (MAXLINE)

   call dsinit (DSMEM_SIZE)   # initialize dynamic storage routines
   event_queue = alloc (ENTRY_SIZE)    # allocate head of event queue
   link (event_queue) = LAMBDA         # queue is initially empty
   cpu_owner = LAMBDA
   disk_owner = LAMBDA


   # allocate and initialize cpu queue header

   cpu_queue = alloc (RESOURCE_SIZE)
   ptr = alloc (ENTRY_SIZE)
   queue_pointer (cpu_queue) = ptr
   link (ptr) = LAMBDA
   max_wait (cpu_queue) = 0
   wait_time (cpu_queue) = 0
   max_length (cpu_queue) = 0
   queue_length (cpu_queue) = 0
   time_length (cpu_queue) = 0
   last_activity (cpu_queue) = 0
   entry_count (cpu_queue) = 0


   # allocate and initialize disk queue header

   disk_queue = alloc (RESOURCE_SIZE)
   ptr = alloc (ENTRY_SIZE)
   queue_pointer (disk_queue) = ptr
   link (ptr) = LAMBDA
   max_wait (disk_queue) = 0
   wait_time (disk_queue) = 0
   max_length (disk_queue) = 0
   queue_length (disk_queue) = 0
   time_length (disk_queue) = 0
   last_activity (disk_queue) = 0
   entry_count (disk_queue) = 0


   # allocate and initialize memory queue header

   memory_queue = alloc (RESOURCE_SIZE)
   ptr = alloc (ENTRY_SIZE)
   queue_pointer (memory_queue) = ptr
   link (ptr) = LAMBDA
   max_wait (memory_queue) = 0
   wait_time (memory_queue) = 0
   max_length (memory_queue) = 0
   queue_length (memory_queue) = 0
   time_length (memory_queue) = 0
   last_activity (memory_queue) = 0
   entry_count (memory_queue) = 0


   # Initialize system variables:

   call input (STDIN, "Simulation length (sec)? *l.", simulation_time)
   simulation_time = simulation_time * 1 000 000   # convert to usec.
   call input (STDIN, "Memory size (K-words)? *i.", max_memory)
   call input (STDIN, "Time required to compress memory (usec)? *l.",
      relocation_time)
   call input (STDIN, "Disk transfer time per word (usec)? *l.",
      transfer_time)
   call input (STDIN, "Disk access time (msec)? *l.", access_time)
   access_time = access_time * 1 000   # convert to usec.
   call input (STDIN, "I/O overhead time (usec)? *l.", overhead_time)
   call input (STDIN, "Mean job interarrival time (msec)? *l.",
      mean_job_interarrival_time)
   mean_job_interarrival_time = mean_job_interarrival_time * 1000
   call input (STDIN, "Mean cpu time per job (msec)? *i.", cpu_mean)
   call input (STDIN, "Standard deviation? *i.", cpu_std_dev)
   call input (STDIN, "Mean number of i/o requests per job? *i.",
      io_mean)
   call input (STDIN, "Standard deviation? *i.", io_std_dev)
   call input (STDIN, "Minimum i/o record size (words)? *i.",
      min_rec_size)
   call input (STDIN, "Maximum i/o record size (words)? *i.",
      max_rec_size)
   call input (STDIN, "Do you want an event trace? *s.", str)
   if (str (1) == 'y'c | str (1) == 'Y'c)
      event_trace = YES
   else
      event_trace = NO

   available_memory = max_memory
   memory_utilization = 0.
   cpu_utilization = 0
   disk_utilization = 0
   jobs_initiated = 0
   jobs_completed = 0
   total_time = 0
   system_clock = 0
   last_disk_transition = system_clock
   last_cpu_transition = system_clock
   last_memory_transition = system_clock
   call rnd (RANDOM_SEED)  # initialize random number generator


   # Print out system parameters:

   call print (STDOUT, "*n*nSystem Parameters:*n*n.")
   call print (STDOUT, "   Simulation length:              *5l sec*n.",
      simulation_time / 1 000 000)
   call print (STDOUT, "   Memory size:                    *5i K words*n.",
      max_memory)
   call print (STDOUT, "   Time to compress memory:        *5l usec*n.",
      relocation_time)
   call print (STDOUT, "   Disk transfer rate:             *5,3f Mhz*n.",
      1d0 / transfer_time)
   call print (STDOUT, "   Disk access time:               *5l msec*n.",
      access_time / intl (1000))
   call print (STDOUT, "   I/O overhead time:              *5l usec*n.",
      overhead_time)
   call print (STDOUT, "   Mean job interarrival time:     *5,3f sec*n.",
      mean_job_interarrival_time / 1d6)
   call print (STDOUT, "   Mean cpu time per job:          *5,3f sec*n.",
      cpu_mean / 1d3)
   call print (STDOUT, "   Cpu time standard deviation:    *5,3f sec*n.",
      cpu_std_dev / 1d3)
   call print (STDOUT, "   Mean i/o requests per job:      *5i requests*n.",
      io_mean)
   call print (STDOUT, "   I/O standard deviation:         *5i requests*n.",
      io_std_dev)
   call print (STDOUT, "   Minimum i/o record size:        *5i words*n.",
      min_rec_size)
   call print (STDOUT, "   Maximum i/o record size:        *5i words*n*n*n*n.",
      max_rec_size)

   call print (STDOUT,
      "Job  Arrived  Priority  Memory  Rec size  Requests  Avg Interval*n.")
   call print (STDOUT,
      "      (sec)             (Kwds)  (words)                (msec)*n.")
   call print (STDOUT,
      "===  =======  ========  ======  ========  ========  ============*n.")

   return
   end


#
# job_arrival --- handle the arrival of a new job
   subroutine job_arrival (job)
   pointer job

#########################################################################
#                                                                       #
#     This subroutine handles the job arrival event.  It notes the      #
#  time of arrival in the job descriptor entry, calls 'dump_job' to     #
#  print out the job's parameters if a job trace has been requested,    #
#  schedules the arriving job's request for memory, and generates and   #
#  schedules the arrival of the next job.                               #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   pointer next_job
   pointer alloc
   longint time
   longint exponential

   arrival_time (job) = system_clock
   call dump_job (job)

   jobs_initiated = jobs_initiated + 1
   call sched_event (REQUEST_MEMORY, job, system_clock)

   next_job = alloc (JOB_SIZE)   # generate the next job
   call set_job_parameters (next_job)
   time = system_clock + exponential (mean_job_interarrival_time)
   call sched_event (JOB_ARRIVAL, next_job, time)

   return
   end


#
# next_event --- pick off next event from event list
   subroutine next_event (event, job, time)
   integer event
   pointer job
   longint time

#########################################################################
#                                                                       #
#     This subroutine picks off the next element from the event queue   #
#  by calling 'dequeue', and returns the information about the event    #
#  in the parameters 'event', 'job' and 'time'.                         #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   pointer entry
   pointer dequeue

   entry = dequeue (event_queue)
   if (entry == LAMBDA)    # consistency check
      call error ("In next_event: can't happen.")

   event = event_type (entry)
   job = job_pointer (entry)
   time = event_time (entry)

   call free (entry)  # release queue space

   return
   end


#
# next_in_line --- get job from resource queue, accumulate statistics
   pointer function next_in_line (resource, queue)
   pointer resource, queue

#########################################################################
#                                                                       #
#     This function removes the next element from the queue specified   #
#  by 'queue', accumulates queue statistics in the queue header speci-  #
#  fied by 'resource', and return a pointer to the job descriptor       #
#  associated with the element just dequeued.                           #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   longint entry_waited
   pointer entry
   pointer dequeue

   entry = dequeue (queue)    # dequeue an entry
   if (entry == LAMBDA) {  # no jobs waiting on this resource
      next_in_line = LAMBDA
      return
      }

   next_in_line = job_pointer (entry)

   # Update queue statistics:
   time_length (resource) = _
      time_length (resource) + _
      queue_length (resource) * _
      (system_clock - last_activity (resource))
   queue_length (resource) = queue_length (resource) - 1
   entry_waited = system_clock - time_in (entry)
   wait_time (resource) = wait_time (resource) + entry_waited
   max_wait (resource) = max0 (entry_waited, max_wait (resource))
   last_activity (resource) = system_clock

   call free (entry)

   return
   end


#
# normal --- generate normal variate
   integer function normal (mean, std_dev)
   integer mean, std_dev

#########################################################################
#                                                                       #
#     This function generates normally distributed variates from the    #
#  distribution whose mean is given by the parameter 'mean' and whose   #
#  standard deviation is given by 'std_dev'.  It is guarranteed to      #
#  return a positive value.                                             #
#                                                                       #
#########################################################################

   integer i
   real sum

   repeat {
      sum = 0.0
      do i = 1, 12
         sum = sum + rnd (0)
      normal = mean + (sum - 6.0) * std_dev
      } until (normal > 0)

   return
   end


#
# release_cpu --- release cpu to initiate an i/o request
   subroutine release_cpu (job)
   pointer job

#########################################################################
#                                                                       #
#     This subroutine handles the release of the cpu by a job that      #
#  is about to make an i/o request.  It updates the cpu utilization     #
#  meter,  schedules an i/o request for the job releasing the cpu,      #
#  and schedules a cpu request for the next job in the cpu queue, if    #
#  any.                                                                 #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   pointer next_job
   pointer next_in_line

   if (cpu_owner ~= job)   # consistency check
      call error ("In release_cpu: can't happen.")

   if (event_trace == YES)
      call print (STDOUT2, "Job *3i releasing cpu    at *7,3f sec*n.",
         job_number (job), system_clock / 1d6)

   cpu_owner = LAMBDA   # release cpu
   call update_cpu_utilization
   next_job = next_in_line (cpu_queue, queue_pointer (cpu_queue))
   if (next_job ~= LAMBDA)    # someone was waiting, give him the cpu
      call sched_event (REQUEST_CPU, next_job, system_clock)

   call sched_event (REQUEST_DISK, job, system_clock + overhead_time)

   return
   end


#
# release_disk --- release disk, reschedule for cpu
   subroutine release_disk (job)
   pointer job

#########################################################################
#                                                                       #
#     This subroutine handles the release of the disk by a job and      #
#  schedules its next request for the cpu.  It also updates the disk    #
#  utilization meter and assigns the disk to the next job waiting for   #
#  it, if any.                                                          #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   pointer next_job
   pointer next_in_line


   if (disk_owner ~= job)  # consistency check
      call error ("In release_disk: can't happen.")

   if (event_trace == YES)
      call print (STDOUT2, "Job *3i releasing disk   at *7,3f sec*n.",
         job_number (job), system_clock / 1d6)

   disk_owner = LAMBDA  # release disk
   call update_disk_utilization
   next_job = next_in_line (disk_queue, queue_pointer (disk_queue))
   if (next_job ~= LAMBDA)    # someone was waiting, give him the disk
      call sched_event (REQUEST_DISK, next_job, system_clock)

   call sched_event (REQUEST_CPU, job, system_clock + overhead_time)

   return
   end


#
# request_cpu --- try to assign cpu to this job
   subroutine request_cpu (job)
   pointer job

#########################################################################
#                                                                       #
#     This subroutine handles cpu requests.  If the requesting job is   #
#  of higher (numerically lower) priority,  the current cpu user is     #
#  preempted, its pending event cancelled and noted in the job descrip- #
#  tor, and the job is enqueued at the head of its priority level in    #
#  the cpu queue.  If the incomming job was previously interrupted,     #
#  the pending event at the time of interruption is rescheduled; other- #
#  wise, the i/o request count is decremented and if it is non-zero,    #
#  an i/o request is scheduled, else the job's termination is sched-    #
#  uled.                                                                #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   integer event
   longint time
   longint exponential
   longreal temp

   temp = system_clock / 1d6  # system time in seconds

   if (cpu_owner ~= LAMBDA)   # cpu is currently in use
      if (job_priority (cpu_owner) <= job_priority (job)) {
         call await (job, cpu_queue, FIFO)
         if (event_trace == YES)
            call print (STDOUT2, "Job *3i in  cpu   queue  at *7,3f sec*n.",
               job_number (job), temp)
         return
         }
      else {   # this job has higher priority, preempt current job
         call cancel_event (cpu_owner, event, time)
         interrupted_event (cpu_owner) = event  # save event type
         remaining_time (cpu_owner) = time - system_clock   # and time
         call await (cpu_owner, cpu_queue, LIFO)
         if (event_trace == YES) {
            call print (STDOUT2, "Job *3i  --interrupted-- at *7,3f sec*n.",
               job_number (cpu_owner), temp)
            call print (STDOUT, "Job *3i in  cpu   queue  at *7,3f sec*n.",
               job_number (cpu_owner), temp)
            }
         }
   else  # cpu was idle
      last_cpu_transition = system_clock  # note time of assignment

   if (event_trace == YES)
      call print (STDOUT2, "Job *3i allocated cpu    at *7,3f sec*n.",
         job_number (job), temp)

   cpu_owner = job   # assign cpu to this job
   if (interrupted_event (job) ~= NO_EVENT) {   # job was previously interrupted
      event = interrupted_event (job)  # retrieve event type
      time = system_clock + remaining_time (job)   # and remaining time
      call sched_event (event, job, time) # reschedule interrupted event
      interrupted_event (job) = NO_EVENT
      }
   else if (io_requests (job) <= 0)    # this job is done
      call sched_event (TERMINATE_JOB, job, system_clock)
   else {
      io_requests (job) = io_requests (job) - 1    # decrement request count
      time = exponential (avg_io_interval (job))   # time until next event
      call sched_event (RELEASE_CPU, job, system_clock + time)
      }

   return
   end


#
# request_disk --- try to assign disk to this job
   subroutine request_disk (job)
   pointer job

#########################################################################
#                                                                       #
#     This subroutine processes a job's request for the disk.  If the   #
#  disk is available, it is assigned to the job and the completion of   #
#  the i/o operation is scheduled.  Otherwise, the job is enqueued on   #
#  the disk queue.                                                      #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   longint time

   if (disk_owner ~= LAMBDA) {   # disk currently in use
      call await (job, disk_queue, FIFO)
      if (event_trace == YES)
         call print (STDOUT2, "Job *3i in  disk  queue  at *7,3f sec*n.",
            job_number (job), system_clock / 1d6)
      }
   else {   # disk was idle
      if (event_trace == YES)
         call print (STDOUT2, "Job *3i allocated  disk  at *7,3f sec*n.",
            job_number (job), system_clock / 1d6)
      last_disk_transition = system_clock    # note time of assignment
      disk_owner = job  # assign disk to this job
      time = access_time + record_size (job) * transfer_time
      call sched_event (RELEASE_DISK, job, system_clock + time)
      }

   return
   end


#
# request_memory --- allocate memory for an incomming job
   subroutine request_memory (job)
   pointer job

#########################################################################
#                                                                       #
#     This subroutine handles a job's memory request.  If enough        #
#  memory space is available to satisfy this job's memory requirement   #
#  the memory is assigned to the job, the available memory space        #
#  decremented, and the job's request for the cpu is scheduled.         #
#  Otherwise, the job is enqueued on the memory queue.                  #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   longint time

   if (memory_size (job) > available_memory) {
      call await (job, memory_queue, FIFO)
      if (event_trace == YES)
         call print (STDOUT2, "Job *3i in memory queue  at *7,3f sec*n.",
            job_number (job), system_clock / 1d6)
      }
   else {
      if (event_trace == YES)
         call print (STDOUT2, "Job *3i allocated memory at *7,3f sec*n.",
            job_number (job), system_clock / 1d6)
      call update_memory_utilization
      available_memory = available_memory - memory_size (job)
      last_memory_transition = system_clock
      time = system_clock + relocation_time
      call sched_event (REQUEST_CPU, job, time)
      }

   return
   end


#
# sched_event --- schedule an event
   subroutine sched_event (event, job, time)
   integer event
   pointer job
   longint time

#########################################################################
#                                                                       #
#     This subroutine adds an event to the event queue which is ordered #
#  by increasing time of occurrence.                                    #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   pointer entry
   pointer alloc

   entry = alloc (ENTRY_SIZE)
   job_pointer (entry) = job
   event_type (entry) = event
   event_time (entry) = time

   call enqueue (entry, event_queue, FIFO)

   if (event_trace == YES) {
      case event {
         call print (STDOUT2, "       arrival .")
         call print (STDOUT2, "memory request .")
         call print (STDOUT2, "   cpu request .")
         call print (STDOUT2, "   cpu release .")
         call print (STDOUT2, "  disk request .")
         call print (STDOUT2, "  disk release .")
         call print (STDOUT2, "   termination .")
         }
      else
         call print (STDOUT2, " unknown event .")
      call print (STDOUT2, "of job *3i scheduled for *10l*n.",
         job_number (job), time)
      }

   return
   end


#
# scheduler --- process events as they occur
   subroutine scheduler

#########################################################################
#                                                                       #
#     This is the controlling routine of the simulator.  It picks off   #
#  events from the event queue, sets the system clock according to the  #
#  time of the event's occurrence, and calls the appropriate subroutine #
#  to handle the event.  Simulation terminates when the time of an      #
#  event's occurrence exceeds the maximum simulation time.              #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   integer event
   longint time
   pointer job

   repeat {
      call next_event (event, job, time)
      system_clock = time
      if (system_clock >= simulation_time)   # end of simulation
         break

      case event {
         call job_arrival (job)
         call request_memory (job)
         call request_cpu (job)
         call release_cpu (job)
         call request_disk (job)
         call release_disk (job)
         call end_job (job)
         }
      else
         call error ("In scheduler: can't happen.")
      }

   return
   end


#
# set_job_parameters --- initialize job table entry
   subroutine set_job_parameters (job)
   pointer job

#########################################################################
#                                                                       #
#     This subroutine samples the appropriate distributions to set a    #
#  job's characteristics.                                               #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   integer uniform, normal
   longint cpu_time

   include "memory_table"

   job_number (job) = jobs_initiated
   job_priority (job) = uniform (MIN_PRIORITY, MAX_PRIORITY)
   record_size (job) = uniform (min_rec_size, max_rec_size)
   io_requests (job) = normal (io_mean, io_std_dev)
   memory_size (job) = memory_table (uniform (1, MEM_TABLE_SIZE))
   cpu_time = normal (cpu_mean, cpu_std_dev) * intl (1000)
   avg_io_interval (job) = cpu_time / io_requests (job)
   interrupted_event (job) = NO_EVENT

   return
   end


#
# summarize --- accumulate job-related statistics
   subroutine summarize (job)

#########################################################################
#                                                                       #
#     This subroutine updates the total amount of elapsed time required #
#  to complete the processing of the specified job.                     #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   total_time = total_time + (system_clock - arrival_time (job))

   return
   end


#
# summarize_run --- print out summary of simulation run
   subroutine summarize_run

#########################################################################
#                                                                       #
#     This subroutine prints out the final summary of the simulation    #
#  run.  Included are the actual length of simulation, number of jobs   #
#  initiated and completed, rewource utilization percentages, and queue #
#  statistics for each of the three resources.                          #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   longreal temp

   if (system_clock <= 0)
      return

   call update_cpu_utilization
   call update_disk_utilization
   call update_memory_utilization

   temp = system_clock  # convert to floating point


   # Print out run statistics:

   call print (STDOUT, "*n*n*nActual simulation length: *7,3f sec*n*n.",
      temp / 1d6)
   call print (STDOUT, "*i jobs initiated, *i jobs completed*n.",
      jobs_initiated, jobs_completed)
   if (jobs_completed > 0)
      call print (STDOUT, "Average time per job: *7,3f sec*n*n.",
         (total_time / 1d6) / jobs_completed)
   call print (STDOUT, "*6,2f% cpu utilization*n.",
      (cpu_utilization / temp) * 1d2)
   call print (STDOUT, "*6,2f% disk utilization*n.",
      (disk_utilization / temp) * 1d2)
   call print (STDOUT, "*6,2f% memory utilization*n.",
      (memory_utilization / (temp * max_memory)) * 1d2)


   # Print out memory queue statistics:

   call update_queue_statistics (memory_queue)
   if (entry_count (memory_queue) > 0) {
      call print (STDOUT,
         "*nMemory queue statistics (based on *i entries):*n.",
         entry_count (memory_queue))
      call print (STDOUT, "   maximum wait time:    *7,3f sec*n.",
         max_wait (memory_queue) / 1d6)
      call print (STDOUT, "   mean wait time:       *7,3f sec*n.",
         (wait_time (memory_queue) / 1d6) / entry_count (memory_queue))
      call print (STDOUT, "   maximum queue length: *7i*n.",
         max_length (memory_queue))
      call print (STDOUT, "   mean queue length:    *7,3f*n.",
         time_length (memory_queue) / temp)
      }
   else
      call print (STDOUT, "*nMemory queue not used*n.")
   call free (queue_pointer (memory_queue))
   call free (memory_queue)


   # Print out cpu queue statistics:

   call update_queue_statistics (cpu_queue)
   if (entry_count (cpu_queue) > 0) {
      call print (STDOUT,
         "*nCPU queue statistics (based on *i entries):*n.",
         entry_count (cpu_queue))
      call print (STDOUT, "   maximum wait time:    *7,3f sec*n.",
         max_wait (cpu_queue) / 1d6)
      call print (STDOUT, "   mean wait time:       *7,3f sec*n.",
         (wait_time (cpu_queue) / 1d6) / entry_count (cpu_queue))
      call print (STDOUT, "   maximum queue length: *7i*n.",
         max_length (cpu_queue))
      call print (STDOUT, "   mean queue length:    *7,3f*n.",
         time_length (cpu_queue) / temp)
      }
   else
      call print (STDOUT, "*nCPU queue not used*n.")
   call free (queue_pointer (cpu_queue))
   call free (cpu_queue)


   # Print out disk queue statistics:

   call update_queue_statistics (disk_queue)
   if (entry_count (disk_queue) > 0) {
      call print (STDOUT,
         "*nDisk queue statistics (based on *i entries):*n.",
         entry_count (disk_queue))
      call print (STDOUT, "   maximum wait time:    *7,3f sec*n.",
         max_wait (disk_queue) / 1d6)
      call print (STDOUT, "   mean wait time:       *7,3f sec*n.",
         (wait_time (disk_queue) / 1d6) / entry_count (disk_queue))
      call print (STDOUT, "   maximum queue length: *7i*n.",
         max_length (disk_queue))
      call print (STDOUT, "   mean queue length:    *7,3f*n.",
         time_length (disk_queue) / temp)
      }
   else
      call print (STDOUT, "*nDisk queue not used*n.")
   call free (queue_pointer (disk_queue))
   call free (disk_queue)

   return
   end


#
# uniform --- generate uniform variate
   integer function uniform (lwb, upb)
   integer lwb, upb

#########################################################################
#                                                                       #
#     This function generates uniformly distributed variates that       #
#  lie within the range specified by 'lwb' (lower bound) and 'upb'      #
#  (upper bound).                                                       #
#                                                                       #
#########################################################################

   uniform = lwb + (upb - lwb) * rnd (0)

   return
   end


#
# update_cpu_utilization --- update cpu utilization statistics
   subroutine update_cpu_utilization

#########################################################################
#                                                                       #
#     This subroutine updates the cpu utilization meter, which counts   #
#  the total number of microseconds for which the cpu has been active.  #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   cpu_utilization = cpu_utilization + (system_clock - last_cpu_transition)

   return
   end


#
# update_disk_utilization --- update disk utilization statistics
   subroutine update_disk_utilization

#########################################################################
#                                                                       #
#     This subroutine updates the disk utilization meter which counts   #
#  the total number of microseconds for which the disk has been active. #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   disk_utilization = disk_utilization + (system_clock - last_disk_transition)

   return
   end


#
# update_memory_utilization --- update memory utilization statistics
   subroutine update_memory_utilization

#########################################################################
#                                                                       #
#     This subroutine updates the memory utilization meter which is a   #
#  time-allocation product accumulator.  That is, whenever the amount   #
#  of memory allocated changes, the product of the amount of allocation #
#  and the time for which that amount was allocated is added to this    #
#  accumulator.                                                         #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   longreal temp

   temp = system_clock  # convert to floating point

   memory_utilization = memory_utilization + _
      (max_memory - available_memory) * _
      (temp - last_memory_transition)

   return
   end


#
# update_queue_statistics --- perform final update of resource statistics
   subroutine update_queue_statistics (queue)
   pointer queue

#########################################################################
#                                                                       #
#     This subroutine performs the final update of queue statistics at  #
#  the end of a simulation run.  It does this by successive calls to    #
#  'next_in_line', which does all of the dirty work.                    #
#                                                                       #
#########################################################################

   include "basys_com.r.i"

   longint entry_waited
   pointer entry
   pointer dequeue

   time_length (queue) = time_length (queue) + _
      queue_length (queue) + (system_clock - last_activity (queue))

   for (entry = dequeue (queue_pointer (queue)); entry ~= LAMBDA;
                           entry = dequeue (queue_pointer (queue))) {
      entry_waited = system_clock - time_in (entry)
      wait_time (queue) = wait_time (queue) + entry_waited
      max_wait (queue) = max0 (max_wait (queue), entry_waited)
      call free (entry)
      }

   return
   end
