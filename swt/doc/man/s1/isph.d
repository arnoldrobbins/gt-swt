.# documentation header
.# format :
.#    .hd <name> "<short description>" <date doc written>
.hd isph "see if process is a phantom" "11/07/82"
.# invocation line syntax
.# format :
.#    <name> <option BNF>
isph
.#
.# program description
.ds
'Isph' allows a shell file to test and see if its invoker
is a phantom.  It writes a "1" to standard output if the
invoker is a phantom,
and a "0" it it is being run from a terminal.
.# invocation examples
.es
if [isph]
   then
      error "screen editor must be run at a terminal"
   else
      se -a my_prog
fi
