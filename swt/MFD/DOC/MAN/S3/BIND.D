[cc]mc |
.hd bind "interface with the Primos EPF loader" 08/08/83
bind [-(a|b|f|n|p|u)] { <binary file>     |
                     -d [ <entry name> ]  |
                     -l <library file>    |
                     -m [ <map file> ]    |
                     -i                   |
                     -t                   |
                     -s <loader command> }
                     [ -o <output file> ]
.ds
'Bind' calls the Primos EPF loader (BIND) from the Software Tools
subsystem.
.sp
The following global options indirectly affect the production of
loader commands:
.sp
.in +10
.rm -5
.lt +5
.ta 6
.tc &
.ti -5
-a&Modify the load sequence to include run-time support for
Pascal programs.  This option may be used with '-b' and '-p'
for mixed-language programs.
.sp
.ti -5
-b&Modify the load sequence to include run-time support for
C programs.
(The load of the C main program is triggered by the appearance
of the first binary file or library.)
This option may be used with '-a' and '-p'
for mixed-language programs.
Besides loading the C run-time library, "ciolib", this option
automatically loads the SWT math library, "vswtmath", and the
shared shell library, "vshlib".
.sp
.ti -5
-d&Cause all unresolved external references at the end of the load to
be resolved with Primos direct entry links.
.sp
.ti -5
-f&Generate a full load map after commands are complete.  The
name of the map file will be the same as the name of the output
file with the ".o" suffix (if any) replaced by ".m".  This
option performs the same action as the options "-t -m" at the
end of the argument list.
.sp
.ti -5
-n&Do not declare the SWT common blocks or load the default libraries
unless the '-i' and '-t' options are encountered.  This
allows the loading of non-Subsystem programs or the insertion of
additional loader commands at the beginning and end of the load.
.sp
.ti -5
-p&Modify the load sequence to include run-time support for
PL/I subset G programs.  This option may be used with '-a' and '-b'
for mixed-language programs.
.sp
.ti -5
-u&Generate a load map of undefined symbols after the default libraries
have been loaded.
.sp
.ti -5
-w&Modify the load sequence to include run-time support for
Prime C programs.
.sp
.in -10
.rm +5
The following local options are examined in the order presented and
directly produce commands to the loader:
.sp
.in +10
.rm -5
.lt +5
.ti -5
<binary file> specifies a binary code file to be loaded.
.sp
.ti -5
-l&<library file> specifies a library file to be loaded.
.sp
.ti -5
-s&<Bind loader command> allows arbitrary loader commands to be inserted
in the command stream
.sp
.ti -5
-m&<map file> presents a map command to the loader.  If <map file>
is omitted, the first  "<binary file>.m" is assumed.
(If <binary file> ends with
".b", the "b" is replaced with an "m".)
.sp
.ti -5
-i&causes the inclusion of the initial sequence of Subsystem
program loader commands
(the definition of Subsystem common block locations)
to be included, regardless of the "-n" global option.
.sp
.ti -5
-t&causes the inclusion of the terminal sequence of Subsystem
program load commands (the default library loads) to be included,
regardless of the "-n" global option.  If the "-n" option is not
specified, the sequence of commands will be included at this point,
so that loader commands may be inserted after the libraries
have been loaded.  This option may be used with the "-m" option
to generate a full load map.
.sp
.ti -5
-o&<output file> specifies the output file for the results of the load.
If
omitted, the first "<binary file>.o" is assumed.
(If <binary file> ends with ".b",
the "b" is replaced with an "o".)
.sp
.in -10
.rm +5
Commands are presented to the loader in the order in which they are
encountered in the command line, except for "-o", which appears
only at the end of the command stream.
.es
bind -u rf.b -t -m
bind sol.b -o sol -d
bind test.b -d at$ -o test
bind sh.b -s "ma -symbols" -o sh -f
.bu
'Bind' pays no attention to standard ports.
.sp
'Bind' must be able to create files in the current directory.
.sp
All files specified must be disk files.
.sp
EPF's are not currently supported and Primos BIND is not currently
documented. Use of this command is discouraged until Prime supports
EPF's.
.sa
fc (1), pc (1), plgc (1), f77c (1), pmac (1), x (1), rfl (1), ld (1)
[cc]mc
