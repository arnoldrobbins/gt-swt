/* debug.h --- put debugging code in or out of a program */

#ifndef debug
#       ifdef DEBUG
#               define debug(x)        x
#       else
#               define debug(x)
#       endif
#endif
