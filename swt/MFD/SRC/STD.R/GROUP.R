# group --- list or test a user's current group identities

   include ARGUMENT_DEFS

   define (GR_STRUCT,563)           # (MAX_GROUP + 1) * ID_SIZE + 2
   define (MAX_GROUP,32)            # system defined limit
   define (ID_SIZE,17)              # 32 packed chars + count

   define (VERSION,1)               # place for the version number
   define (USER_ID,2)               # user id start location
   define (GRP_CNT,19)              # number of returned groups
   define (GROUPS,20)               # group list start

   ARG_DECL

   integer getarg, equal

   integer group_count
   character arg (MAXARG)
   character group_list (MAXUSERNAME,MAX_GROUP)

   string usage "Usage: group [-a | -o] {<group_names>}"

   procedure list_groups forward
   procedure get_groups forward
   procedure and_args forward
   procedure or_args forward


   PARSE_COMMAND_LINE ("a<f>o<f>"s, usage)

   if (ARG_PRESENT (a) && ARG_PRESENT (o))
      call error (usage)

   get_groups

   if (getarg (1, arg, MAXARG) == EOF)
      list_groups
   elif (ARG_PRESENT (a))
      and_args
   elif (ARG_PRESENT (o))
      or_args
   else
      and_args

   stop


   # get_groups --- retrieve the users groups for later processing

      procedure get_groups {

      local i, code
      integer i, code
      local struc
      integer struc (GR_STRUCT)

         struc (VERSION) = 2     # for Primos 19.1
         call getid$ (loc (struc), MAX_GROUP, code)
         if (code ~= 0)
            call error ("can't retrieve group names"p)

         group_count = struc (GRP_CNT)
         for (i = 0; i < group_count; i += 1) {
            call vtoc (struc (GROUPS + ID_SIZE * i), group_list (1, i + 1),
                              MAXUSERNAME)
            call mapstr (group_list (1, i + 1), LOWER)
            }
         }


   # list_groups --- print the user's current groups

      procedure list_groups {

      local i
      integer i

         for (i = 1; i <= group_count; i += 1)
            call print (STDOUT, "*s*n"s, group_list (1, i))
         }


   # and_args --- if all the groups are active then return true

      procedure and_args {

      local arg_count, arg_stat, i
      integer arg_count, arg_stat, i

         arg_count = 1
         arg_stat = getarg (arg_count, arg, MAXARG)

         while (arg_stat ~= EOF) {
            call mapstr (arg, LOWER)
            for (i = 1; i <= group_count; i += 1)
               if (equal (group_list (1, i), arg) == YES)
                  break

            if (i > group_count)
               break

            arg_count += 1
            arg_stat = getarg (arg_count, arg, MAXARG)
            }

         if (arg_stat ~= EOF)
            call print (STDOUT, "0*n"s)
         else
            call print (STDOUT, "1*n"s)
         }


   # or_args --- if any of the groups are active then return true

      procedure or_args {

      local arg_count, arg_stat, i
      integer arg_count, arg_stat, i

         arg_count = 1
         arg_stat = getarg (arg_count, arg, MAXARG)

         while (arg_stat ~= EOF) {
            call mapstr (arg, LOWER)
            for (i = 1; i <= group_count; i += 1)
               if (equal (group_list (1, i), arg) == YES)
                  break

            if (i <= group_count)
               break

            arg_count += 1
            arg_stat = getarg (arg_count, arg, MAXARG)
            }

         if (arg_stat == EOF)
            call print (STDOUT, "0*n"s)
         else
            call print (STDOUT, "1*n"s)
         }

   end
