.hd template "manipulate and display templates" 03/25/82
template [-a | -r] [-l{usv}]  { <string> }
.ds
'Template' allows the user to expand templates, list the
contents of the system template file or his own private template
file, or edit the contents of his private template file.
The operation of 'template' is controlled by command line options
as follows:
.in +5
.ta 6
.tc \
.sp
.ti -5
-a\add or change templates.  Any <string>s that appear on the
command line are taken in pairs of the form
.sp
     <name> <definition>
.sp
If any template in the user's template file has a name corresponding
to <name>, its definition is replaced by <definition>; otherwise,
the new template is added to the file.
.sp
.ti -5
-r\remove templates.  Each <string> on the command line is taken
as the name of a template to be removed from the user's template
file.
.sp
.ti -5
-l\list templates. The contents of either the system template file
or the user's private template file, or both, are listed on standard
output.
The "-l" may be followed by one or more of the following
options to control the listing:
.in +5
.sp
.ti -5
u\list the contents of the user's private template file.
.sp
.ti -5
s\list the contents of the system template file.
.sp
.ti -5
v\print a label before listing each set of templates.
.sp
.in -5
If neither the "s" nor the "u" option is specified, "u" is
assumed by default.
.sp
.in -5
Note that the "-l" option may be used with either the
"-a" or the "-r" option to list the modified templates.
.sp
In the absence of any of the above options, 'template'
expands each <string> argument and prints the result on
standard output.
In order to allow arbitrary strings containing templates
to be expanded, it is necessary to enclose the template
name in "equals" symbols (=) just as it would appear in
a pathname.
This is the [ul only] context in which 'template' requires
or allows the name of a template to be so enclosed.
.es
template =date= =time= =doc=/man
template -al mybin //mydir/bin.ufd
template -r oldtemp
template -lusv
.fl
=utemplate= for storage of personal templates
.me
.in +5
.ti -5
"Usage: template ..." for improper options
.ti -5
"<string>: duplicate name" if two or more templates with the same name
are specified with "-a"
.ti -5
"<string>: missing definition" if a template name is not followed by
a definition string with "-a"
.ti -5
"<string>: may not contain '='" if an attempt is made to add a template
name containing an equals sign
.ti -5
"file not altered" if either of the previous two messages is issued
.ti -5
"<string>: not in template file" if an attempt is made to delete a
non-existent template
.ti -5
"can't open user template file" if "=utemplate=" can't be opened for
reading and writing
.ti -5
"can't open temporary file" if a temporary file can't be created
for the "-a" and "-r" options
.in -5
.sa
expand (2), lutemp (6)
.br
For more information on templates, see
[ul User's Guide to the Primos File System] in the
[ul Software Tools Subsystem User's Guide].
