.hd retract "retract a news article" 08/17/82
retract [ -q ] { <article number> }
.ds
'Retract' is the recommended means of retracting an article from
the Software Tools Subsystem news service.  The articles mentioned
by number as arguments are removed from the news index, news archive,
and news delivery files.  If the article has been read by a subscriber,
a notice of retraction is placed in his newsbox; otherwise, no notice
of the retraction is published.
.sp
Under normal circumstances, one never need retract a news story.
'Retract' exists to remedy the all-too-frequent circumstance of an
erroneous news article.
By retracting an incorrect article and re-publishing a correct version,
the news archive is less cluttered
and those users who have not read their news never know of the
retraction.
.sp
When called with the "-q" option, 'retract' does not tell subscribers
who have read an article that it has been retracted.  This "quiet"
option is often useful for removing all traces of an outdated article
without bothering users who have read it.
.sp
WARNING: When news has a large circulation, 'retract' will
take a significant amount of time to do its job.  DO NOT
interrupt it, or you may leave an article in a half-retracted
state.  In the event 'retract' is interrupted, just retract
the article again -- the only problem (in almost all cases)
will be that some users are given two retraction notices.
.es
retract -q 12
retract 299 233
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
"<article>: not an article number" for a non-numeric article number.
.ti -5
"<article>: can't retract" for an unwritable delivery file.
.ti -5
"<article>: not found" for trying to retract a non-existant article.
.ti -5
"<article>: not your article" for trying to retract someone else's article.
.ti -5
"can't open index file" for not being able to open index file.
.ti -5
"can't open subscribers list" for not being able to open subscriber file.
.ti -5
"Usage: retract ..."  for incorrect arguments.
.in -5
.sa
news (1), subscribe (1), publish (1)
