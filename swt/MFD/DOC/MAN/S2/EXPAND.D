.hd expand "convert a template into an EOS-terminated string" 03/25/82
integer function expand (template, str, strlen)
integer strlen
character template (ARB), str (strlen)
.sp
Library:  vswtlb (standard Subsystem library)
.fs
'Expand' is used to convert Subsystem path templates into strings.
Templates are used to make the directory structure of the Subsystem
user-selectable without the expense of code modification.
The first argument of 'expand' should be an EOS-terminated string
containing a template to be expanded;
the second argument should be a string to receive the result,
and the third argument should be the maximum allowable length of
the result.
The function return is the length of the expanded template,
or ERR if an undefined or ill-formed template is present.
.sp
The template consists of uninterpreted characters, which are
passed through to the expanded version unchanged, and identifiers
surrounded by equals signs, which are replaced by template
text and then rescanned. If the template must contain uninterpreted
equal signs, they must be "doubled" (eg. for one =, use ==).
.sp
See 'lutemp' for a list of templates currently supported.
.im
'Expand' maintains indices into the template, the receiving
string, and a pushback buffer, which is initially empty.
As long as the pushback buffer is empty, 'expand' copies characters
from the template to the receiving string.
When a single equals sign ("=") is encountered, characters are
stored in another buffer until a trailing equals sign is seen.
This buffer is passed to 'lutemp', which places the resulting
template expansion in the pushback buffer.
As long as the pushback buffer is nonempty, 'expand' scans it
instead of the original template;
this allows template expansions to contain additional templates.
.am
str
.ca
lutemp
.sa
lutemp (6), follow (2), getto (2)
