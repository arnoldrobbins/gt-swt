# link --- linkage check

# "Link" creates a linkage statement for the files specifed as arguments
# in the command line. "Link" accepts the "rp" options -f, supress auto-
# matic inclustion of standard definitions file, and -m, map all iden-
# tifiers to lower case.  "Link" uses "gfnarg" to fetch the filenames in the
# argument list (those not beginning with a dash) of the command line.
# "Gfnarg" observes the convention that a "-n" argument implies that
# file names are to be read from an input file until EOF is reached,
# rather than simply from the argument list.  If the argument begins
# with "-n", it indicates that file names are to be taken from a file.
# ("-n" implies the standard port STDIN, "-n2" implies STDIN2,
# "-n3" implies STDIN3, and "-nfilename" implies the named file.)
#
# An identifier needs to be in a linkage statement if it is longer
# than six characters and it meets one of the following conditions:
#       1) The identifier is in an external statement.
#       2) The identifier is the name of a named common block.
#       3) The identifier is in a  subroutine name.
#       4) The identifier is in a  function   name.
# The linkage statement produced by "link" includes all identifiers
# which are of one of the four types above, regardless of the number
# of characters in the identifer.  Because of this, "link" creates
# a list of all external symbols for the modules of a given program
# as well as a linkage statement
#
# "Link" uses the lexical analysis portion of "rp", with only a few minor
# modifications and the sort for "xref" unmodified.


include "link_com.i"

character fname (MAXTOK), buf (MAXLINE), keep (MAXLINE)
file_des tempfile1, tempfile2
file_des  open, mktemp  #subsystem routines
integer gfnarg, state (4)   #subsystem routine and a required parameter
integer getlin, equal, length  #subsystem routines

PARSE_COMMAND_LINE ("[-fm] [-n <ignored>]"s, "Usage: link [-fm] [-n<filename>]"p)

call initialize

tempfile1= mktemp (READWRITE)    # create temporary files
tempfile2= mktemp (READWRITE)


if (~ ARG_PRESENT (f)) {   #Process subsystem defines unless -f option indicated
   Level = 1
   Infile (Level) = open ("=incl=/swt_def.r.i"s, READ)
   call getlink_id (tempfile1)
   }

# Process files in command line

state (1) = 1
while (gfnarg (fname, state) ~= EOF) {
   Level = 1
   Infile (Level) = open (fname, READ)
   Line_number (Level) = 0
   call getlink_id (tempfile1)
   }

call rewind (tempfile1)
call sort (tempfile1, tempfile2)
call rmtemp (tempfile1)


# Unique sorted names in tempfile2 and print linkage statement

call print (STDOUT, "linkage  _*n"p)
call rewind (tempfile2)
if (getlin (keep, tempfile2) ~= EOF) {
   while (getlin (buf, tempfile2) ~= EOF) {
      if (equal (keep, buf) == NO) {
         keep (length (keep)) = ","c
         call print (STDOUT, "   *s*n"p, keep)
         call scopy (buf, 1, keep, 1)
         }
      }
   call print (STDOUT, "   *s"p, keep)
   }

call rmtemp (tempfile2)

stop
end



# getlink_id --- return names which must be included in linkage statement

subroutine getlink_id (tempfile)
file_des tempfile

include "link_com.i"

character  id (MAXTOK)
file_des open

call getsym     # get next token

while (Symbol ~= EOF)  {
   select (Symbol)

      when (DEFINESYM) {
         call getsym
         if (Symbol == '('c)
            call enter_definition
         else
            SYNERR ("Left paren must follow 'define'"p)
         }


      when (UNDEFINESYM) {
         call getsym
         if (Symbol == '('c)
            call remove_definition
         else
            SYNERR ("Left paren must follow 'undefine'"p)
         }

      when (INCLUDESYM) {
         if (Level >= MAXLEVEL) call error ("Includes nested too deeply"p)
         call getsym
         call get_long_name (id)
         Level += 1
         Line_number (Level) = 0
         Infile (Level) = open (id, READ)
         if (Infile (Level) == ERR) {
            call error ("can't open include file"p)
            Level = Level - 1
            }
         }

      when (SUBROUTINESYM, FUNCTIONSYM) {
         call getsym
         if (Symbol == IDSYM) {
            call get_long_name (id)
            call print (tempfile,"*s*n"p, id)
            }
         else
            SYNERR ("identifier expected in subprogram declaration"p)
         }

      when (EXTERNALSYM) {
         call getsym
         while (Symbol ~= NEWLINE) {
            if (Symbol == IDSYM) {
               call get_long_name (id)
               call print (tempfile,"*s*n"p, id)
               }
            call getsym
            }
         }

      when (COMMONSYM) {
         call getsym
         if (Symbol == '/'c) {
            call getsym
            if (Symbol == IDSYM) {
               call get_long_name (id)
               call print (tempfile,"*s*n"p, id)
               }
            else
               SYNERR ("identifier expected in named common statement"p)
            }
         }

      call getsym
      }


   return
   end
