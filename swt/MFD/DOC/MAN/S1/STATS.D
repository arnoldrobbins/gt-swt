[cc]mc |
.hd stats "print statistical measures" 08/27/84
[cc]mc
stats  [ -{option} ]
.sp
option ::= t | a | m | s | v | h | l | r | q | n | %<rank>
.ds
'Stats' is a filter that can be used to generate various statistical
measures of a set of floating point data.
Input to 'stats' is a list of numbers, appearing one per line but
free-form within each line, on its first standard input.
Output from 'stats' is a list of statistics, preceded by labels
(unless the "-q" option has been specified) on the first standard output.
.sp
The options control the statistics to be printed.
[cc]mc |
The available options are:
[cc]mc
.sp
.in +10
.rm -5
.lt +15
.ta 6
.tc \
.ti -5
[cc]mc |
-t\Print the sum (total) of all data values.
.ti -5
-a\Print the arithmetic mean (average) of the data values.
.ti -5
-m\Print the mode (most frequently occurring value).
.ti -5
-s\Print the standard deviation of the population sampled.
.ti -5
-v\Print the variance of the population sampled.
.ti -5
-h\Print the highest value in the sample.
.ti -5
-l\Print the lowest value in the sample.
.ti -5
-r\Print the range of values in the sample (highest - lowest).
.ti -5
-q\Quiet; turn off the printing of labels on the output.
.ti -5
-n\Print the number of data values in the sample.
[cc]mc
.ti -5
%\Print percentile ranks for the data.
The percent sign (%) must be followed by the percentile increment
to be used for the ranking.
Note that "-%50" yields the median value for the sample.
.sp
.in -10
.rm +5
The default options are currently "-as%50".
.es
grades> stats
grades> stats -ahl%25
{ ([files .r])> tc -l } | stats -tahl
lf -cw | field 1-8 | stats -tq
.me
"Usage: stats ..." for improper options.
.bu
The mode and percentile rank statistics are limited
to relatively small data
sets because of an internal sort.
