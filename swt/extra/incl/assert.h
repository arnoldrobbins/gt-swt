/* assert.h --- put assertions into C programs */

#include <stdio.h>   /* to get declaration of stderr */

#ifdef NDEBUG
#        ifndef assert
#                define assert(cond)
#        endif
#else
#        ifndef assert
#                define assert(cond)    do { if (!(cond)) { fprintf(stderr, \
                "Assertion 'cond' failed: file %s line %d.\n", \
                           __FILE__, __LINE__); exit(1); } } while (0)
#        endif
#endif
