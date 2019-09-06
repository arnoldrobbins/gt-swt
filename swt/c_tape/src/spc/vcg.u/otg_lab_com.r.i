# Global variables for otg label memory mgmt routines

   ipointer Lbnexti
   tpointer Lbnextt
   spointer Lbnexts
   integer Lbmem (MAX_LAB_MEMORY)
   opointer Lbfree, Lbnext

   common /lab_com/ Lbnexti, Lbnextt, Lbnexts, Lbmem, Lbfree, Lbnext

