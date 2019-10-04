.hd news "news service for Subsystem users" 08/19/81
news [ -p ] { -i | <item_number> }
.ds
'News' gives Subsystem users access to the Software Tools Subsystem
news service.  It has three basic functions:
.sp
.in +10
.tc &
.ta 6
.ti -5
1.&To print an index of currently active news items.
.sp
The "-i" option is available to perform this function.
The command "news -i" will print the index.  Each entry in
the index is of the form:
.sp
     <item_number> <date> <time> <headline>
.sp
The <item_number> is an integer which may be used to select
specific articles to be printed (see below).  The <date> and
<time> are the date and time at which the item was published.
(See the documentation for the 'publish' command.)  The <headline> is
a short description of the contents of the news item.
.sp
.sp
.ti -5
2.&To print selected news items.
.sp
For each <item_number> (see above) specified in its argument
list, 'news' will print a corresponding news item on standard
output.  Available news items may be determined by looking at
the index generated by the "news -i" command.
.sp
.sp
.ti -5
3.&To print the news delivered to a subscriber.
.sp
Users may "subscribe" to the news service by using the
'subscribe' command.  Whenever a subscriber logs in to the
Subsystem (either at Primos login or through the 'swt' command),
he is informed if any news item has been published since he
last checked with the news service.  If news is available, he
should type the command "news", without arguments.  Recent news
items will be printed,
one CRT screenful at a time.
(The user may skip or re-examine the news at this point;
see manual entries for 'pg' (1) and 'page' (2) for further information.)
The user is then asked whether or not
he wishes to save his news.  The correct response is "n" or "N"
for "no"; anything else causes the news to be saved.   News not
saved may still be retrieved through the usual channels outlined
in steps 1 and 2 above.
.in -10
.sp
If the user does not specify the "-p" option and standard output is
directed to his terminal, 'news' will display the requested
articles one page at a time.  Otherwise, 'news' will produce its
output in a continuous stream.
.es
news -p -i
news 22 23 24
news
.fl
.in +5
.ti -5
=news=/articles/art<number> for archived articles
.ti -5
=news=/index for article index
.ti -5
=news=/delivery/<login_name> for delivery to subscribers
.ti -5
=news=/subscribers for a list of subscribers
.br
.in -5
.me
"Usage: news ..." for invalid argument syntax.
.br
"article <number> could not be found" for unknown article number.
.sa
publish (1), retract (1), subscribe (1), pg (1), page (2)