# swt_acl_def.r.i --- define ACL Common for fdata routines

   integer Acl_version, Acl_count, Acl_type
   character Acl_pairs (41, 32), Acl_name (MAXPATH)
   integer Primos_acl (3)
   equivalence (Primos_acl (1), Acl_version)
   equivalence (Primos_acl (2), Acl_count)
   equivalence (Primos_acl (3), Acl_pairs)

   integer Acl_mode (32)
   character Acl_user (33, 32)

   common /acl$00/ Acl_type, Acl_name, _
       Acl_mode, Acl_user, Primos_acl


   define (ACL_PROTECT, 8r000001)
   define (ACL_LIST,    8r000002)
   define (ACL_USE,     8r000004)
   define (ACL_READ,    8r000010)
   define (ACL_WRITE,   8r000020)
   define (ACL_ADD,     8r000040)
   define (ACL_DELETE,  8r000100)
   define (ACL_NONE,    8r000000)
   define (ACL_ALL,     8r000177)
