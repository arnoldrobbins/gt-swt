# The Georgia Tech Software Tools Subsystem and C Compiler for Prime Computers

This repo contains the source code and documentation for version 9.1
(the last version) of the *Georgia Tech Software Tools Subsystem for
Prime Computers* and version 2.0 (also the last version) of the *Georgia
Tech C Compiler for Prime Computers*.

This repo is primarily of historical interest, for those who worked on
the subsystem, as well as for those who used it; there are no actual
Prime computers still in use (to our knowledge), although emulators and
emulated systems may be found on the Internet.

This `README.md` is still a work in progress. If you can fill in
any of the missing information, please feel free to contact me!

## Software Tools Subsystem History

The Software Tools Subsystem was developed and maintained for a long time
by (in alphabetical order) Allen Aiken, Perry Flinn, and Dan Forsyth.
Jack Waugh created the `se` screen editor. When the initial three
developers left Georgia Tech, support then moved to Jeanette Myers,
Terry Countryman, and Peter Wan. The final versions were developed and
maintained by Scott (then known as Jeff) Lee and Arnold Robbins.

The final version of the subsystem was sent out to users in the fall of
1984, sometime around September or October of that year. At that point,
the subsystem passed into history; we have no knowledge about how long
it continued to be used by its licensees.

### Some More History, Thanks to Dan Forsyth

Q. When did work first start?

> I believe it was late fall of 1976.  We were suffering withdrawal from
> the retirement of our beloved Burroughs B5500 and the dedication of our
> PDP-11/45 to a medical project.

Q. Did development start from the tools in the *Software Tools* book,
or from the tools provided by the Software Tools User Group?

> Absolutely from the book.  There was no STUG at that point.  Brian K. told
> us at one point later that we were the only people he knew of that had
> actually done all the exercises in the book.

Q. At what point did Georgia Tech start licensing and supporting the subsystem?

> I’m going to guess about 1978 or 1979.  I might be able to find this out.


## Recovery History

While some of the documentation was saved (see the links, below), the
subsystem code itself was believed lost for over 30 years.

Fortunately, in April of 2019, Scott Lee found two tapes he had made
from the Georgia Tech Prime systems. One contained the subsystem, and
the other contained the C compiler!  These tapes were 35 years old,
but had been kept in good condition, in a moisture-controlled environment.

With support from Arnold Robbins and Dennis Boone, the tapes were sent to
a recovery service which was able to extract the contents with only one
(!) damaged file.  The non-binary contents of those tapes make up the
content of this repository.

### Installation Tape vs. Dump Tape

It appears that the Subsystem files are from a dump of one of the Georgia
Tech Prime systems, and not from a formal installation tape as they were
distributed to licensees. However, the C compiler files do appear to be
from an installation tape.

## Branches

The `recovery` branch contains all the files exactly as they were
recovered from the magnetic tapes, including binary and executable
files. Also available are `.tap` format files (tape images) for use with
SIMH or other emulators.

The `master` branch contains the code and documentation in a format
suitable for browsing on Unix-style systems. In particular:

* All directory and file names are in lower case.
* Line endings are LF, not CR-LF.
* All binary files (executables, objects, anything noted as ``data''
by *file*(1)) have been removed.

The Software Tools Subsystem is underneath the `swt` directory, whereas
the C compiler is under the `c_tape` directory.

## C Compiler History

Paul Manno recounts:

> Program Development Corporation was formed and I was one of the officers
> of the company.  We did produce and sell a C compiler and library for the
> PR1ME Computers that operated under PR1MOS (their OS).  Most realized
> we lacked enough corporate knowledge and there were no incubators that
> we knew enough about to fund us.  So, after completing the sale of the
> C Compiler and run time libraries [to Georgia Tech], we agreed to close
> the company and seek our fortunes on a different path.  The company was
> inclusive of Dan Forsyth, Win Strickland, Allen Akin, and a few others.

Dan Forsyth answers some questions:

Q. When did work on the C compiler start, and by whom? What years?

> I think about 1980.  I might have info on this that I can look up.
> PDC was Perry, Allen, Win Strickland, Paul, and me.  I wrote most of
> the compiler front end and Allen wrote the back end (vcg) and used it
> as part of his master’s thesis.

Q. When did Georgia Tech buy back the C compiler?

> I’m thinking this was late 1981 or early 1982.

Arnold Robbins thinks that Paul Manno wrote the first version of
the C library. Arnold remembers working on it subsequently. For version
8.1 of the subsystem, the `EOS` character in the subsystem was changed
from `-2` to zero, for compatibility with the C compiler and library.

Arnold also recalls that Edward J. Hunt converted the `vcg` code generator
to generate object code directly, instead of generating assembly code
that had to be assembled with PMA (Prime's macro assembler).  Ed used
an object code generation library written by Scott Lee to do so. This
basically doubled the compilation speed. Arnold *thinks* it was his
suggestion to make this change, but he no longer remembers for sure.

## Links Of Interest

Several bits of the Subsystem code were converted to C in the 1980s and
are available separately. Of interest:

* The [`se` screen editor](http://se-editor.org).
* The [`fmt` formatter](https://github.com/arnoldrobbins/swtfmt-with-history).
* The [`stacc` parser generator](https://github.com/arnoldrobbins/stacc).
* The [`hp` RPN calculator](https://github.com/arnoldrobbins/hp).

A Prime emulator is available on the Web. Here is the
[announcement](https://groups.google.com/forum/#!topic/comp.sys.prime/FRwgdMrDBqM).
To access it, use `telnet`:

	$ telnet em.prirun.com 8006

Different versions of Primos are available on ports 8001-8007.

Scott Lee's `pdump` program to extract Prime MAGSAV tapes on Unix is
available [here](https://github.com/arnoldrobbins/pdump).

Dennis Boone has a number of Prime tools
[here](https://bitbucket.org/kb8zqz/drbprimetools).

## Documentation Links

PDF files made by scanning some of the original documents are available
on the Internet. Here are some links:

* The *Software Tools Subsystem User's Guide, 2nd edition* is available [here](http://bitsavers.org/pdf/georgiaTech/GIT-ICS-80-03_Software_Tools_Subsystem_Users_Guide_2ed_Apr80.pdf).
* The *Software Tools Subsystem User's Guide, 4th edition* is available [here](http://bitsavers.org/pdf/georgiaTech/GIT-ICS-85-08_Software_Tools_Subsystem_Users_Guide_4ed_May85.pdf).
* The technical report on the reusable code generator used in the C compiler, Allen Aiken's MS thesis, is available [here](http://bitsavers.org/pdf/prime/georgiaTech/GIT-ICS-81-16_primeCodeGen.pdf).
* A (now) funny USENET article about C compilers and Unix for Prime computers is available [here](https://groups.google.com/forum/#!topic/net.unix-wizards/y2a7uwis4sc).

Dennis Boone has built PDFs of the User's Guide and the Reference Manual:

* The [user's guide](https://yagi.h-net.org/prime_manuals/swt91_guide.pdf).
* The [reference manual](https://yagi.h-net.org/prime_manuals/swt91_refman.pdf).

##### Last Modified
Fri Oct  4 14:34:43 IDT 2019
