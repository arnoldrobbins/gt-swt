[cc]mc |
.hd tscan$ "traverse subtree of the file system" 09/10/84
[cc]mc
integer function tscan$ (path, buf, clev, nlev, action)
character path (MAXPATH)
[cc]mc |
integer buf (MAXDIRENTRY), clev, nlev, action
[cc]mc
.sp
Library:  vswtlb  (standard Subsystem library)
.fs
'Tscan$' is used to traverse a subtree of the file system rooted
at 'path'.
Each time 'tscan$' is called, it returns the entry of the next
file (or directory) in 'buf', as controlled by 'action'
(discussed below).
'Clev' is the current level of descent into the subtree; it
must be initialized to zero before calling 'tscan$'.
'Nlev' is the maximum level of descent into the subtree;
'clev' will never be greater than 'nlev'.
The function return is OK if an entry was successfully fetched,
ERR if the fetch was unsuccessful, EOF when the entire subtree
has been scanned, or EOD if a directory has been completely
scanned and the EODPAUSE action has been specified (see below).
.sp
The argument 'action' is a bit mask composed of the sum of several
action codes.
The codes POSTORDER and PREORDER control the visitation of
directories.
If POSTORDER is in effect, each directory entry will be returned
after all the files in the directory have been visited.
If PREORDER is in effect, each directory entry will be returned
before any of the files in the directory have been visited.
The first element of 'buf' is set to 0 or 1 to indicate
a preorder or postorder encounter, respectively.
Note that both PREORDER and POSTORDER may be specified;
in this case, each directory in the subtree is visited twice.
The code EODPAUSE causes 'tscan$' to return the code EOD when
it completes the scan of a directory.
Finally, the code REATTACH causes 'tscan$' to insure that
the user is always attached to the directory currently being
scanned.
(Maintaining the attach point can be expensive, so it has been
made optional.)
.im
Various pieces of state information are retained in the common
block 'c$tscn'.
'Tscan$' changes state as it scans the subtree, deciding when
to ascend, descend, pause, get the next entry, etc.
The algorithm is a simple tree traversal, complicated mainly
by the difficulties of error handling and maintaining the
attach point.
.am
buf, clev, path
.ca
[cc]mc |
at$swt, ctoc, error, expand, equal, follow, move$, upkfn$,
Primos at$hom, Primos dir$rd, Primos gpas$$, Primos srch$$,
Primos texto$
[cc]mc
.bu
No more than one instance of 'tscan$' may be active at a given time.
.sa
[cc]mc |
Primos dir$rd
lf (1), del (1), chat (1), cp (1), follow (2)
[cc]mc
