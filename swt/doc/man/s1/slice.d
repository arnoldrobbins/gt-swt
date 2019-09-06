.hd slice "slice out a chunk of a file" 03/20/80
slice (-i | -x) <start_pattern> [(-i | -x) <end_pattern>]
.ds
'Slice' searches its standard input for a line matching the pattern
<start_pattern> and copies through to standard output
all the lines from that one to
the first line matching the pattern <end_pattern>.
.sp
The "-i" and "-x" options control the inclusion and exclusion
(respectively) of the line matching the associated pattern.
.sp
If the <end_pattern> and its associated inclusion flag are missing,
the copy operation continues until end-of-file is encountered.
.sp
'Slice' is useful for pulling out chunks from well-structured
files, like the documentation files for the Subsystem Reference
Manual.
For example, "slice -i %.bu -x %.sa" would copy the "Bugs" section
out of a Reference Manual entry.
.es
slice.d> slice -i .bu -x .sa | fmt
slice -i % -x %-EOF$
.me
"Usage: slice ..." for invalid argument syntax.
.bu
Doesn't handle lines longer than MAXLINE.
.sa
cto (1), find (1), match (2), makpat (2)
