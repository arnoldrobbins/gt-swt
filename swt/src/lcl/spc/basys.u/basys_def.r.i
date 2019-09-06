# Events:
   define (JOB_ARRIVAL,1)     # Arrival of a new job in system
   define (NO_EVENT,0)        # Null event, used for interrupt processing
   define (RELEASE_CPU,4)     # Job releases CPU to make I/O request
   define (RELEASE_DISK,6)    # Job releases disk
   define (REQUEST_CPU,3)     # Job requests use of the CPU
   define (REQUEST_DISK,5)    # Job requests use of the disk
   define (REQUEST_MEMORY,2)  # Job requests memory space
   define (TERMINATE_JOB,7)   # Job terminates

# Symbolic constants:
   define (DSMEM_SIZE,8192)   # Size of dynamic storage
   define (ENTRY_SIZE,6)      # Size of a queue entry
   define (FIFO,0)            # First-in-first-out queueing discipline
   define (JOB_SIZE,12)       # Size of a job table entry
   define (LAMBDA,0)          # Null pointer
   define (LIFO,1)            # Last-in-first-out queueing discipline
   define (MEM_TABLE_SIZE,102)   # Size of memory request table
   define (RANDOM_SEED,779)   # Seed for random number generator
   define (RESOURCE_SIZE,12)  # Size of a resource queue header
   define (MIN_PRIORITY,0)    # Minimum job priority
   define (MAX_PRIORITY,15)   # Maximum job priority
