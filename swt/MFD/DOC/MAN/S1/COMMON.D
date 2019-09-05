.hd common "print lines common to two sorted files" 03/20/80
common [ -{1 | 2 | 3} ] [ <file1> [ <file2> ] ]
.ds
'Common' prints the lines common to two sorted files.
It normally
produces three columns of output:  Column one contains lines
present in <file1> but not present in <file2>; column two contains
lines present in <file2> but not in <file1>; and column three
contains lines common to both files.
.sp
The first argument may be used to select the columns to be printed.
A dash followed by a "1" selects the first column, a dash followed
by "12" selects columns one and two, etc.
For example,
to print lines in the second file or in both files (i.e. columns two
and three), the argument should be "-23".
.sp
If the second file name argument is omitted, the first standard
input is used for <file2>; if no <file >name arguments appear, the first and
second standard inputs will be used for <file1> and <file2> respectively.
.es
lf -c =bin= | sort >file1;
   lf -c =doc=/fman/s1 | sort >file2;
      common -1 file1 file2
.sp
common -1 wordlist =dictionary=
.me
.in +5
.ti -5
"Usage: common ..." for illegal arguments.
.br
.in -5
.sa
diff (1), sort (1), lf (1)
