.hd rnd "generate random numbers" 03/20/80
rnd  { -l <lower> | -u <upper> | -n <number> }
.ds
'Rnd' may be used to generate one or more pseudo-random
numbers, uniformly distributed over a given range of integers.
The arguments specify the range and number of pseudo-random
integers to be generated.
.sp
The "-l" and "-u" options set the lower and upper bounds,
respectively, of the range.
The default values are 1 for the lower bound and 100 for the
upper bound.
The "-n" option controls the number of integers generated;
the default is 1.
.es
rnd
rnd -n 10 | stats -tq
rnd -u 10
rnd -l -5 -u 5
.bu
Round-off error may make this program not quite uniform in the
long run.
.sa
'rnd' function in Fortran library
