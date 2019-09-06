.hd yesno "selective filter with user decision" "08/06/82"
yesno [-yes | -no]
.ds
This program can be used as a filter in a pipe to regulate input
to other commands.  It reads a line at a time from standard input
(STDIN),
echoes the line in quotes followed by a question mark, and then
prompts the user for a yes or no answer.  A response of "y", "ye",
"yes", or "ok" all result in the line being passed to standard output
(STDOUT).  A response of "n" or "no" discards the line.  Any other
[cc]mc |
response causes an error message and the user is prompted with the
[cc]mc
line again.  Case is not significant in responses.
.sp
Use of the optional "-yes" argument causes a carriage return
(null response) to default to a "yes" response. Use of the optional
"-no" argument causes a null response to default to "no."
.sp
If the user types an end-of-file character (normally a control C)
as the response to any decision prompt then the current line
and all subsequent lines in the input are discarded.
.sp
All display and prompting are done to and from device TTY and
thus will not show up in any of the standard inputs or outputs
should they be redirected or piped.  As a result, this command
cannot be used in a phantom job, nor may a set of pre-determined
answers be constructed as input to the program.
.es
lf -ca | yesno -no | del -n
lf -c /user/mfd | yesno | del -sd -n
=dictionary=> yesno -yes >my_dictionary
.me
"Usage: yesno ..." for improper command line syntax.
.sp
"answer YES or NO." for incorrect or unknown response.
.bu
Does not recognize "-y" or "-n" as command line arguments.
.sp
Will not work in batch or phantom jobs.
