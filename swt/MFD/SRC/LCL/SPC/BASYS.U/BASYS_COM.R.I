# basyscom --- common areas for the Basys simulator


# Miscellaneous simulation variables and pointers:

   pointer event_queue        # pointer to event list
   pointer cpu_queue          # pointer to cpu queue header
   pointer disk_queue         # pointer to disk queue header
   pointer memory_queue       # pointer to memory queue header
   pointer cpu_owner          # pointer to job currently owning cpu
   pointer disk_owner         # pointer to job currently owning disk
   integer available_memory   # available memory (K-words)
   integer max_memory         # system memory size (K-words)
   longint simulation_time    # length of simulation run (usec)
   longint system_clock       # current system time (usec)
   integer jobs_initiated     # number of jobs initiated
   integer jobs_completed     # number of jobs completed
   longint total_time         # total time for all jobs completed
   longint transfer_time      # disk transfer time per word (usec)
   longint access_time        # disk access time per word (usec)
   longint last_cpu_transition   # time of last cpu activation (usec)
   longint last_disk_transition  # time of last disk activation (usec)
   longint last_memory_transition   # time of last memory allocation (usec)
   longint cpu_utilization    # total cpu active time (usec)
   longint disk_utilization   # total disk active time (usec)
   floating memory_utilization   # memory time-allocation product accumulator
   longint mean_job_interarrival_time  # mean job interarrival time (usec)
   integer event_trace        # YES if event trace is to be performed
   integer min_rec_size       # Minimum i/o record size (words)
   integer max_rec_size       # Maximum i/o record size (words)
   integer io_mean            # Mean number of i/o requests per job
   integer io_std_dev         # Standard deviation for i/o distribution
   integer cpu_mean           # Mean cpu time per job (msec)
   integer cpu_std_dev        # Standard deviation for cpu distribution
   longint overhead_time      # I/O overhead time (usec)
   longint relocation_time    # Time required to compress memory (usec)

   common /cbasys/ _
      event_queue, cpu_queue, disk_queue, memory_queue,
      cpu_owner, disk_owner, available_memory, max_memory,
      simulation_time, system_clock, jobs_initiated,
      jobs_completed, total_time, transfer_time, access_time,
      last_cpu_transition, last_disk_transition, last_memory_transition,
      cpu_utilization, disk_utilization, memory_utilization,
      mean_job_interarrival_time, event_trace, min_rec_size, max_rec_size,
      io_mean, io_std_dev, cpu_mean, cpu_std_dev, overhead_time,
      relocation_time


# Job table entry definition:

   integer job_priority (1)   # job priority (0-15, 0 highest)
   longint arrival_time (1)   # time of job's arrival in system (usec)
   integer record_size (1)    # job's i/o record size (words)
   integer io_requests (1)    # number of i/o requests yet to be made
   integer memory_size (1)    # job's central memory requirement (K-words)
   longint avg_io_interval (1)   # mean i/o interrequest time (usec)
   integer interrupted_event (1) # next event for interrupted job
   longint remaining_time (1) # remaining time for interrupted job (usec)
   integer job_number (1)     # job identification number


# Event list entry definition:

   pointer job_pointer (1)    # pointer to job owning this entry
   longint event_type (1)     # event type
   longint event_time (1)     # time at which this event will occur (usec)
   pointer link (1)           # pointer to next queue entry


# Resource queue entry definition:

#  pointer job_pointer (1)    # pointer to job owning this entry
   longint time_in (1)        # time of entry into the queue (usec)
   longint q_priority (1)     # priority of job owning this entry
#  pointer link (1)           # pointer to next queue entry


# Resource queue header definition:

   pointer queue_pointer (1)  # pointer to dummy entry at head of queue
   longint max_wait (1)       # maximum waiting time in queue (usec)
   longint wait_time (1)      # total waiting time in queue (usec)
   integer max_length (1)     # maximum queue length
   integer queue_length (1)   # current queue length
   longint time_length (1)    # time-length product accumulator
   longint last_activity (1)  # time of last queue activity (usec)
   integer entry_count (1)    # total number of queue entries


# Equivalences to position fields correctly:

   integer mem (DSMEM_SIZE)   # dynamic storage space
   common /dsmem$/ mem

   equivalence (mem ( 1), job_pointer (1))
   equivalence (mem ( 2), event_type (1))
   equivalence (mem ( 4), event_time (1))
   equivalence (mem ( 6), link (1))
   equivalence (mem ( 2), time_in (1))
   equivalence (mem ( 4), q_priority (1))
   equivalence (mem ( 1), queue_pointer (1))
   equivalence (mem ( 2), max_wait (1))
   equivalence (mem ( 4), wait_time (1))
   equivalence (mem ( 6), max_length (1))
   equivalence (mem ( 7), queue_length (1))
   equivalence (mem ( 8), time_length (1))
   equivalence (mem (10), last_activity (1))
   equivalence (mem (12), entry_count (1))
   equivalence (mem ( 1), job_priority (1))
   equivalence (mem ( 2), arrival_time (1))
   equivalence (mem ( 4), record_size (1))
   equivalence (mem ( 5), io_requests (1))
   equivalence (mem ( 6), memory_size (1))
   equivalence (mem ( 7), avg_io_interval (1))
   equivalence (mem ( 9), interrupted_event (1))
   equivalence (mem (10), remaining_time (1))
   equivalence (mem (12), job_number (1))
