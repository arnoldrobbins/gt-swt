# The Georgia Tech Software Tools Subsystem and C Compiler for Prime Computers

This repo contains the source code and documentation for version 9.1 (the last version) of the *Georgia Tech Software Tools Subsystem for Prime Computers* and version 2.0 (also the last version) of the *Georgia Tech C Compiler for Prime Computers*.

This repo is primarily of historical interest, for those who worked on the subsystem, as well as for those who used it; there are no actual Prime computers still in use (to our knowledge), although emulators and emulated systems may be found on the Internet.

This <tt>README.md</tt> is still a work in progress. If you can fill in any of the missing information, please feel free to contact me!

## Software Tools Subsystem History

The Software Tools Subsystem was developed and maintained for a long time by (in alphabetical order) Allen Aiken, Perry Flinn, and Dan Forsyth.  Jack Waugh created the <tt>se</tt> screen editor. When the initial three developers left Georgia Tech, support then moved to Jeanette Myers, Terry Countryman, and Peter Wan. The final versions were developed and maintained by Scott (then known as Jeff) Lee and Arnold Robbins.

The final version of the subsystem was sent out to users in the fall of 1984, sometime around September or October of that year. At that point, the subsystem passed into history; we have no knowledge about how long it continued to be used by its licensees.

### Questions We'd Like The Answers To

Q. When did work first start?
Q. Did development start from the tools in the *Software Tools* book, or from the tools provided by the Software Tools User Group?
Q. At what point did Georgia Tech start licensing and supporting the subsystem?
Q. When did work on the C compiler start, and by whom? (PDC - Program Development Corporation)
Q. GT bought back the C compiler circa 1983 or 1984 - Arnold Robbins did work on the C library and Version 8.1 switched the <tt>EOS</tt> character from -2 to 0 for compatibility with the C compiler and library.

## Recovery History

While some of the documentation was saved (see the links, below), the subsystem code itself was believed lost for over 30 years.

Fortunately, in April of 2019, Scott Lee found two tapes he had made from the Georgia Tech Prime systems. One contained the subsystem, and the other contained the C compiler!  These tapes were 35 years old, but had been kept in good condition, in a moisture-controlled environment.

With support from Arnold Robbins and Dennis Boone, the tapes were sent to a recovery service which was able to extract the contents with only one (!) damaged file.  The non-binary contents of those tapes make up the content of this repository.

### Installation Tape vs. Dump Tape

It appears that the Subsystem files are from a dump of one of the Georgia Tech Prime systems, and not from a formal installation tape as they were distributed to licensees. However, the C compiler files do appear to be from an installation tape.

## Branches

The <tt>recovery</tt> branch contains all the files exactly as they were recovered from the magnetic tapes, including binary and executable files. Also available are <tt>.tap</tt> format files (tape images) for use with SIMH or other emulators.

The <tt>master</tt> branch contains the code and documentation in a format suitable for browsing on Unix-style systems. In particular:

* All filenames are in lower case.
* Line endings are LF, not CR-LF.
* All binary files (executables, objects, anything noted as ``data'' by *file*(1)) have been removed.

The Software Tools Subsystem is underneath the <tt>swt</tt> directory, whereas the C compiler is under the <tt>c_tape</tt> directory.

## C Compiler History

## Links Of Interest

Several bits of the Subsystem code were converted to C and are available separately. Of interest:

* The [<tt>se</tt> screen editor](http://se-editor.org).
* The [<tt>fmt</tt> formatter](https://github.com/arnoldrobbins/swtfmt-with-history).
* The [<tt>stacc</tt> parser generator](https://github.com/arnoldrobbins/stacc).
* The [<tt>hp</tt> RPN calculator](https://github.com/arnoldrobbins/hp).

A Prime emulator is available on the Web. Here is the [announcement](https://groups.google.com/forum/#!topic/comp.sys.prime/FRwgdMrDBqM).  To access it, use <tt>telnet</tt>:

	$ telnet em.prirun.com 8006

Different versions of Primos are available on ports 8001-8007.

TODO: Add documentation links from email
http://bitsavers.org/pdf/georgiaTech/

##### Last Modified
Fri Sep 13 16:19:04 IDT 2019
