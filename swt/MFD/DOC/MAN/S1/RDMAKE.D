.hd rdmake "make a relation from data file" 02/22/82
rdmake
.ds
'Rdmake' is part of the toy relational data base management
system 'rdb'.  It creates an 'rdb' relation from a data
file and a description file.  The relation data is read from
standard input 1 and the description file is read from standard
input 2 (see below).  The new relation is written to standard
output.
The output relation is displayed in a readable format if
standard output is directed to a terminal (display in binary
would be quite a mess); otherwise, the output relation is written
in binary, internal format for processing by other 'rdb' programs.
.sp
Identical tuples are not removed from the resulting relations.
These can be removed using 'rdsort' and 'rduniq'.
.sp
The description file is very similar in structure to the output
format file used by 'rdextr'.  Each line of the description
file causes the creation of a new domain in the relation
and describes how the data for that domain is to be obtained.
Each line has one of the following formats:
.sp
.nf
      i       <domain name> [ d[<delim>] ] [ l<flen> ]
      r       <domain name> [ d[<delim>] ] [ l<flen> ]
      s<slen> <domain name> [ d[<delim>] ] [ l<flen> ]
.fi
.sp
The first two entries in each line describe the format of
the relation.
The first format describes an integer domain (containing
32 bit integers), the second describes a real domain
(containing 64 bit reals), and the last describes a
string domain containing <slen> character strings (<slen>
must be a positive integer).  The <domain name> must begin
with a letter and contain only letters, digits, and
underscores.  Case is significant in identifiers.
.sp
The last two (optional) entries in each format describe how
each domain is to be obtained from the data file.  Data for
each tuple is taken from a single line in the data file.  Fields
are extracted in the order of lines in the description file.
Each field is extracted by first skipping over any
leading delimiter characters specified
by <delim> in the "d<delim>" entry (if the entry is omitted,
<delim> is assumed to be a blank; if "d" is specified without
a delimiter, no delimiter is allowed).
Then characters are collected up to the next occurrence of
<delim>.
In any case, no more
than <flen> characters are collected (if "l<flen>" is omitted,
<flen> is assumed to be a very large number).  The extracted
field is then converted to the proper internal format and
placed in the tuple.  Integers and reals are converted into
binary representations with 'gctol' and 'ctod'; strings are
blank padded to full length.
For example,
.sp
.nf
      s6 pno
      s15 pname l15 d
      i qty d,
      r price d, l10
.fi
.sp
"pno" is a string containing 6 characters; it is obtained by
skipping blanks and then collecting characters up to the
next blank.  "Pname" is a string containing 15 characters; it
is obtained by taking exactly 15 characters from the
input line (if a NEWLINE is encountered, spaces are supplied).
"Qty" is an integer domain that
is extracted by skipping leading commas, collecting
characters up to the next comma, and then converting the
resulting string into an integer with 'gctol'.  "Price"
is a real domain; it is extracted by skipping leading commas,
collecting characters up to the next comma (but not more
than 10), and then converting the resulting string into a real
using 'ctod'.
.es
p.data> p.des> rdmake | rdsort | rdjoin >p.rel
sp.des>2 rdmake >sp.rel
.me
"Illegal length"
.br
"Illegal data type"
.br
"Illegal domain name"
.br
"Duplicate name"
.br
"Can't add domain"
.br
"Illegal input length"
.br
"Unrecognized word"
.br
"<integer>: bad integer"
.br
"<real>: bad real"
.bu
If standard output is directed to "/dev/lps", the relation
is written in binary.

An empty field cannot be specified by two occurrences of
a delimiter.
.sa
ctod (2),
gctol (2),
rdcat (1),
rdextr (1),
rdjoin (1),
rdmake (1),
rdprint (1),
rdproj (1),
rdsel (1),
rdsort (1),
rduniq (1)
