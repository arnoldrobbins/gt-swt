.hd eval "evaluate arithmetic expressions" 03/20/80
eval { <expression_element> }
.ds
'Eval' is used to evaluate arithmetic expressions involving
32-bit integers and shell variables.  The expression to be evaluated
is given in the arguments, and may be spread out over as many
arguments as desired.
The value of the expression is printed on standard output one.
.sp
'Eval' supports the following operators:
.sp
.tc \
.ta 11
.in +15
.ti -10
+\addition
.ti -10
-\subtraction and unary minus
.ti -10
*\multiplication
.ti -10
/\division
.ti -10
%\modulus
.ti -10
<<\logical left shift
.ti -10
>>\logical right shift
.ti -10
**\exponentiation
.ti -10
<\less than (returns 1 or 0)
.ti -10
>\greater than
.ti -10
=\equal to
.ti -10
<=\less than or equal to
.ti -10
>=\greater than or equal to
.ti -10
~=\not equal to
.ti -10
&\bitwise logical and
.ti -10
|\bitwise logical or
.ti -10
~\bitwise logical complement
.in -15
.sp
Operator priority, from highest to lowest, is as follows:
.sp
.nf
     -   (unary minus)
     **
     *      /     %     <<    >>
     +      -
     <      <=    =     ~=    >=    >
     ~
     &
     |
.fi
.sp
Parentheses may be freely used to specify the desired order
of evaluation.
.sp
Shell variables may appear in expressions; their values will be
substituted when necessary.  As always, shell function calls may be
included as part of the command line, and will be processed before
'eval' sees the expression.
.sp
Care should be taken in using characters recognized by the shell as
meta-characters (e.g. parentheses, vertical bar, greater than sign).
For this reason, it is probably wise to enclose the expression in
quotes.
.es
eval 10 - 14 + 37**2
set i = [eval i + 1]
cat file_stack[eval sp-1]
.me
.in +5
.ti -5
"Bad element in expression" for missing or unrecognizable expression
element.
.ti -5
"<var>: domain error" for reference to non-numeric shell variable.
.ti -5
"<var>: value error" for reference to undefined shell variable.
.in -5
.sa
cmp (1), declare (1), forget (1), set (1), hp (1)
