[cc]mc |
.hd help "provide help for users in need" 08/27/84
[cc]mc
help  { <item> | <option> }
[cc]mc |
   <option> ::= -c | -d | -s | -f | -g | -i | -p | -u
[cc]mc
.ds
'Help' can be used to retrieve various types of information
concerning Subsystem commands and library subprograms.
.sp
General information on the Subsystem can be had simply by
typing the command "help" with no arguments:
.sp
.nf
.ti +10
help
.fi
.sp
More comprehensive information can be obtained with the form
.sp
.nf
.ti +10
help item item...
.fi
.sp
'Help' searches the
.ul
Software Tools Subsystem Reference Manual
for the named commands and subprograms and, if they are found,
prints their manual entries.
Any uniquely-named command or library subprogram may be found in
this manner.
.sp
In the case of commands and subprograms that share a common name
(e.g. 'print' or 'date') the ambiguity may be resolved by specifying
the option "-c" to select the command or "-s" to select the subprogram.
If neither "-s" or "-c" is specified, the default behavior is the same
as for "-c".
.sp
General information not in the Reference Manual is accessed with the
"-g" option;
for example,
.sp
.nf
.ti +10
help -g bnf
.fi
.sp
gives a short explanation of the extended Backus-Naur Form (BNF)
used to describe command syntax in the Reference Manual.
.sp
An index of all documented commands and library subprograms
can be generated with the "-i" option.
(This is an excellent way of getting an overview of what functionality
the Subsystem has to offer.)
Furthermore, if some particular function is desired, but the names
of commands that perform that function are unknown, the "-f" option
may be used to search the index for a given pattern.
For example, the names and short descriptions of all commands and
library subprograms dealing with character strings will be listed
by the following command:
.sp
.nf
.ti +10
help -f string
.fi
.sp
(The "-f" option is an excellent way for a new user to track down
commands and subprograms that are germane to the solution of a
particular problem.)
(An aside to experienced users:  the patterns following a "-f"
option are standard Subsystem regular expressions, identical to
those used in the text editors and the 'find' and 'change'
commands.)
.sp
'Help' calls the 'page' subroutine in the Subsystem library to
print a screenful of information at a time; any response that is
acceptable to 'page' can be given as a response to 'help'.  Please
see the Reference Manual entry for the 'page' routine for more
details ("help[bl]page" would be appropriate).  In particular,
a carriage return may be entered to continue to the next screenful
of information.  While the 'help' processor is presenting the text
of a Reference Manual entry, it prompts with the a string of the
form "<name>[bl]@[<number>+][bl]more[bl]?[bl]", where <name> is
the name of the command or routine for which help is being provided,
and <number> is the number of the page (screenful) being presented.
When the end of the Reference Manual entry is reached, 'help' prompts
with the string "<name>[bl]@[<number>$][bl]more[bl]?[bl]", with
the dollar sign indicating that the end of the manual entry has been
reached.
[cc]mc |
By default, 'help' instructs the 'page' subroutine to use any
special features your terminal may have, via the 'vth' terminal
handling library.
If you have a dumb terminal, or a hard-copy terminal, use the "-d"
option to tell 'help' that it is using a "dumb" terminal.
[cc]mc
.sp
For extracting Reference Manual entries to be spooled and printed,
the "-p" option may be used to turn off the automatic pagination
described above.
When "-p" is specified, the Reference Manual entries selected
are printed exactly as they are stored, with underlining/boldfacing
intact, and indentation and page size unchanged.
This output must be run through 'os' before being printed on the
line printer.
Example:
.sp
.nf
.ti +10
help -p help rp fmt | os >/dev/lps/f
.fi
.sp
If the user only desires to see the syntax for the command and
not the description, then the "-u" option can be specified.  This
causes only the "Usage" section of the Manual entry to be
retrieved for the given command.  The 'usage' Subsystem command is
a shell file that uses this option; the user normally does not
need to specify it in a call to 'help'.
.es
help
help -g bnf
help e se date time
help -s date -c print
help -i
help -f file string input output
help -p fmt | os >/dev/lps/f
help -u se
.fl
.in +5
.ti -5
=doc=/fman/s1/<command>.d for command documentation
.ti -5
=doc=/fman/s2/<subprogram>.d for subprogram documentation
.ti -5
=doc=/fman/s3/<command>.d for local command documentation
.ti -5
=doc=/fman/s4/<subprogram>.d for local subprogram documentation
.ti -5
=doc=/fman/s5/<command>.d for low-level command documentation
.ti -5
=doc=/fman/s6/<subprogram>.d for low-level subprogram documentation
.ti -5
=doc=/fman/contents for command and subroutine index
.ti -5
=temp=/tm?* for temporary files to store the Reference Manual
entry for paging
.in -5
.me
.in +5
.ti -5
"Sorry, no help is available for <command>" in case of missing
or unreadable documentation file.
.ti -5
"Can't open index file =doc=/fman/contents" in case index file is
missing or unreadable.
.ti -5
"<pattern>:  bad pattern" in case there is a syntax error in
a pattern following a "-f" option.
.ti -5
"cannot create scratch file for help entry" if a file in the =temp=
directory could not be opened to store the help text for paging.
.ti -5
"cannot close scratch file" if the scratch file in =temp= could not
be closed.
.in -5
.sa
[cc]mc |
guide (1), pg (1), usage (1), page (2),
[cc]mc
[ul Software Tools Subsystem Reference Manual]
