.hd publish "publish a news article" 03/23/82
publish <path_name> { <path_name> }
.ds
'Publish' is the recommended means of publishing an article in
the Software Tools Subsystem news service.  The
contents of the files given as arguments (there must be at least one) are
entered into the news service archive and sent to all news service
subscribers.
.sp
Each file named is published as a separate news item.
The first non-blank line of each file should be the "headline."
The headline may be left-justified or centered.
The headline is placed in the index
entry for an item, along with the time and date of publishing and the
item number.  (The item number is used for retrieving specific news items;
see the help for the 'news' command.)

'Publish' deletes leading and trailing blank lines and always insures
that there is a blank line following the headline.
Because of this, output from the text formatter is suitable for
publication if it contains no underlining or boldfacing.
.sp
WARNING: When news has a large circulation, 'publish' will
take a significant amount of time to do its job.  DO NOT
interrupt it, or you may prevent some users from obtaining
a copy in their news box.  In the event that 'publish' is
interrupted, use "retract -q" to remove the article and
then publish it again.
.es
publish new_york_times
publish first second
.fl
.in +5
.ti -5
=news=/articles/art<number> for archived articles
.ti -5
=news=/index for article index
.ti -5
=news=/delivery/<login_name> for delivery to subscribers
.ti -5
=news=/subscribers for the subscription list
.in -5
.me
.in +5
.ti -5
"<article>: cannot open" for not being able to access article file.
.ti -5
"<article>: empty file" for trying to publish an empty file.
.ti -5
"Headline too long: <headline>" for trying to use a headline that will
not fit in the index.
.ti -5
"can't open archive copy file" for not being able to open
=news=/article/art<number>.
.ti -5
"cannot make delivery" for not being able to open delivery file.
.ti -5
"can't open index file" for not being able to open index file.
.br
.in -5
.sa
news (1), subscribe (1), retract (1)
