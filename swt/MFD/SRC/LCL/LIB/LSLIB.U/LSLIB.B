S ( LSGETF: :}LS$BUF	acQ	@A@QK	"@ #	acQ@Q	@	$BC		%	t$QK	9 9	CacA@&Q@acA@"A@&	$#%	t$QK	C	@ QS	$@H$49 9acA@&Q@acA@"A@&	$##acA@"A@.	%	!!S!!' '
S!'!#GETLIN!#LSALLO!#LSMAKE!#LSJOIN!#LSPOS 
 
"%(0&$ LSPUTF: :}LS$BUF	QK	"acA@"Q@A@acQ@Q	@acA@"A@	A		!f !#LSPOS !#LSEXTR!#PUTLIN
 
"%$0&$ LSJOIN9 9}LS$BUF	QK	"acA@"A@QK	t",aSLS$BUFQK	#	!,!'! $LS$BUF!#LSPOS 
 
"%*$0&5( LSCMPK9 9	QK	"A#@HADQK	$	acA@"A@%	$C	%A		&		(#@#@HADQK9 9	$	%A
	$A
	%C(%+,		&-		&0	&	!<! =!>!#LSGETC
 
"%.(0&0( LSCOMP: :	QK	"QK	#	acA@#A@$	%	acA@"A@&	%C	&A		'	: :	&A
	$A
	&C# &'		'(		'+	'	!<!=!> !#LSGETC
 
"%.(0&J( LSCUT : :	QK	"QK	A	QKQS	#acQ	@A@	acA@"Q	@	Aac9 9	Q	@A@QK	#	acA@$A@	"BQS	#"%	acA@"A@&	$'ac; ;A@%A@'acA@$A@&%	#	!!!,!#LSPOS !#LSALLO!#LSGETC!#LSPUTC
 
"%2(0&s"& LSINS ; ;}LS$BUF	QK	A			QK	A	@ "acQ	@Q	@	A@"A@QK	@D#ac; ;A@"A@#A@acA@"A@QK	$	acA@$Q	@	%AQK	$acA@$	#ac9 9A@$A@#	%3	%t",aSLS$BUF	"t$,aSLS$BUF	acA@"A@	$t",aSLS$BUF9 9	acQ	@Q	@	Q	@	"QK	$"QSacA@"A@	$t",aSLS$BUFW		< <!!!,!-s!'!#LSPOS !#LSLEN ! #LSSUBS!$LS$BUF!#LSCOPY!#LSDEL 
 
"%6&0&( LSTAKE9 9}LS$BUF	QK	"	acA@#Q	@	$	acA@"A@%	&	acA@#A@&	A
 	$	!#LSGETC!#LSPUTC!#LSALLO
 
"%.(0&& LSDROP0 0}LS$BUF	@ "QK	B#acA@$A@#A@"A@	"	!!#LSCOPY
 
"%,&0&C* LSSUBS; ;}LS$BUF		Qg	@	acQ	@Q_	@D"QK	"	acA@#A@"	$QK< <	%	acA@%Q	@	&A'	('@%	&A('Q_	CEA	(	AacA@%A@&	)ac1 1A@#A@)&2	$	!'!#LSGETC!#LSPOS !#LSLEN !#LSALLO!#LSPUTC
 
"%4*0&%$ LSDEL : :}LS$BUF	QK	A			QK	"	acA@"Q	@	"#	acA@#Q	@	#A	@ 9 9	t",aSLS$BUF	#t",aSLS$BUF		!,%!$LS$BUF!#LSPOS !#LSFREE
 
"%.$0&6& LSCOPY< <}LS$BUF	QK	"acA@"Q	@QK	AacA@"Q[		@H#	acQ	@A@#QK9 9	$acA@$Q	@	acA@"A@%	#	acA@$A@#	A
%3		!#LSGETC!#LSPUTC !#LSLEN !#LSPOS !#LSALLO
 
"%2&0&6$ LSPOS 9 9}LS$BUF	A"	("@	"Qg			Qw,agLS$BUF	@,a_LS$BUF	A9 9QSQw,aKLS$BUF	A
Qk		Qw,agLS$BUF1 1	@,a_LS$BUF	AQS#(Qw,aKLS$BUF	#	!,6!$LS$BUF
 
"%*$0&*& LSMAKE: :}LS$BUF	acQ	@	"acQ	@A@"QK	#A$	($@         $@HAD	QGQQK	A
* *acA@#Q	@QK	%	!#LENGTH!#LSALLO!#LSPUTC
 
"%.&0&(& LSEXTR: :}LS$BUF	QK	"A#	(#@	#Qg	@HADQGQ
acA@"Q	@
	A 	#@HAD@ QS	#@H$	!#LSGETC
 
"%2&0&& LSLEN 6 6}LS$BUF	QK	"A#	(#@	acA@"A@$	A
	#@H%	!#LSGETC
 
"%*&0&+$ LSGETC< <}LS$BUF		Qw,agLS$BUF	@,a_LS$BUF	AQSQw,aKLS$BUFQS9 9	",aKLS$BUF	A
Qk	@	Qw,agLS$BUF	@,a_LS$BUF	AQS! 	"	!,+!$LS$BUF
 
"%*$0&.$ LSPUTC: :}LS$BUF		Qw,agLS$BUF	@,a_LS$BUF	AQSQw,aKLS$BUF	A
: :QK,aSLS$BUFQk	@AQK	"	acA@"A@QK	#	@ #) 	#	!,.!'!$LS$BUF!#LSFREE
 
"%*$0&TR( LSALLO9 9}LS$BUF"Too many linked strings"(program terminated5 5	@ "QK,a[<LS$BUF	@D,ag>LS$BUF	@,aK<LS$BUF	BQSQK	B9 9,a[<LS$BUF,aS<LS$BUFQK	#	(#@	#,ag<LS$BUF!		t#,aS@LS$BUF8 8"	@ ,aw<LS$BUF,aS@LS$BUFQK	$	
	@ %,aKBLS$BUF	#	(#@6	t#: :,aK@LS$BUF	A
		t#,ag@LS$BUF	@,a_@LS$BUF	A#>B	t#,aK@LS$BUF	A< <=M	(%@QK	$%T,aKBLS$BUFQS	@ t#,aS@LS$BUF	#B,aSBLS$BUFQK8 8	$	U7N	"@HCacDa@acFacHa@(j	A"acJ,a
@BLS$BUFA@9 9,aK<LS$BUF	@H,aS<LS$BUF},aw<LS$BUF,aK@LS$BUF	BC~	,aK<LS$BUF	#9 9	B,aS<LS$BUF	@ ,aw<LS$BUF,aS@LS$BUF,aK<LS$BUF,aSBLS$BUF	A$#	#; ;	@H#	t#,aK@LS$BUF	%('	#%	@+,aKBLS$BUF	t#,aS@LS$BUF9 9	#@H#	#@H#7	#@HCA&t#,aK@LS$BUF	BCBA	&	A		,aS@LS$BUF8G	#9 9	B,aSBLS$BUF-	$	!~!T!T!,T!'!D$LS$BUF. .!H$LS$BUF!B$LS$BUF!F$LS$BUF!J#REMARK!L#LSDUMP!N#ERROR !P#LSFREE
 
"%.(0&C& LSFREE9 9}LS$BUF	QK	A
Qw,aKLS$BUF	%			@ "QK	#	(#9 9	@	"Qg		t#,agLS$BUF	@#$t$,aKLS$BUF	#	,aSLS$BUF: :	t#,aKLS$BUF	A		,aSLS$BUF	@ QS		0		t#,aSLS$BUF	(" 	#QS		!C!,C!$LS$BUF
 
"%,&0&" LSINIT6 6}LS$BUF		,aSLS$BUF	A,aSLS$BUF,aSLS$BUF	@ ,aSLS$BUF		!y! $LS$BUF!$LS$BUF!$LS$BUF!$LS$BUF
 
"%""0&[
( LSDUMP9 9}LS$BUF"Top=*i  HO=*i  NA=*i*n"(
Loc *i:  "2LSVOI9 9	D (*i)*n"@LSNULL (*i)*n"N>>"R<*i>"X*n> 8 8
> > > > >"f<<*n"l	Ptr *i*n	acvA@a@,a
@xLS$BUF: :,a
@zLS$BUF,a
@|LS$BUF	A"	("@	",agzLS$BUF	@acvA@a@(A@"	@ : :	#	@ $	("@#	t",aK~LS$BUF	@DCB%",a_zLS$BUF	CEA	%	A	($$$9 93acvA@a@2A@$	"@H"	@ $	("@E	t",aK~LS$BUF	BCB%",a_zLS$BUF9 9	CEA	%	A	($FFUacvA@a@@A@$	"@H"BacvA@a@N	("@k< <	t",aG~LS$BUFQQK	CD%",a_zLS$BUF	CEA	%	AQK	CE%QK	C@A	%9 9	AacQ	@A@	t",aG~LS$BUFQacvA@a@RQ	@	(#@	$#%9 9	acvA@a@X	@ #&	t",aK~LS$BUF	A	("53l6	acvA@a@f	": :	@H"d 	t",aK~LS$BUF	%H!	%KC	%OOe	&acvA@a@lA@&7 7A		!q!~![![! [!~!,[!$LS$BUF!   $LS$BUF!$LS$BUF!$LS$BUF!~#PRINT !#PUTCH 
 
"%*(0&