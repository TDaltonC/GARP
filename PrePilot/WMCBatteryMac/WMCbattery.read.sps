*** Syntax for reading the output of the WMCbattery.
CD '/xxxxxx'.
**Replace '/xxxxxx' with the full path name of the directory where your data are located. Do NOT remove the quotes (' and ') and period at the end. After replacing the  '/xxxxxx' , click on ``Run'' followed by ``All.'' 

* Read Memory Updating. 
* id = subject number, r1 to r5 = responses to memory probe 1 to 5, corr1 to 5 = correctness of responses 1 to 5, x and z are irrelevant variables. 

data list file = 'mu.dat' free
/id trial r1 r2 r3 r4 r5 x corr1 corr2 corr3 corr4 corr5 z.
exe.

do repeat
a = corr1, corr2, corr3, corr4, corr5.
recode a (-1 = sysmis).
end repeat.
exe.
compute mu.pc = mean(corr1 to corr5).
exe.

sort cases by id.
aggregate
/outfile = 'mu.sav'
/break = id
/MUMean = mean(mu.pc).
exe.


* Read Operation Span.
* list1 to list8 = actually presented letters, resp1 to resp8 = recalled letters, rt1 to rt8 = reaction time of recall, equstatus1 to 8 = status of presented equations, 
* equresp = response to equations, equrt = reaction time for response to equations. 

data list file = 'os.dat' free
/id * trial * listlength *
list1 (A) list2 (A) list3 (A) list4 (A) list5 (A) list6 (A) list7 (A) list8 (A)
resp1 (A) resp2 (A) resp3 (A) resp4 (A) resp5 (A) resp6 (A) resp7 (A) resp8 (A)
rt1 * rt2 * rt3 * rt4 * rt5 * rt6 * rt7 * rt8 *
equstatus1 * equstatus2 * equstatus3 * equstatus4 * equstatus5 * equstatus6 * equstatus7 * equstatus8 *
equresp1 * equresp2 * equresp3 * equresp4 * equresp5 * equresp6 * equresp7 * equresp8 *
equrt1 * equrt2 * equrt3 * equrt4 * equrt5 * equrt6 * equrt7 * equrt8. 
exe.

do repeat
a = list1, list2, list3, list4, list5, list6, list7, list8
/b = resp1, resp2, resp3, resp4, resp5, resp6, resp7, resp8
/c = corr1, corr2, corr3, corr4, corr5, corr6, corr7, corr8
/d = equstatus1, equstatus2, equstatus3, equstatus4, equstatus5, equstatus6, equstatus7, equstatus8
/e = equresp1, equresp2, equresp3, equresp4, equresp5, equresp6, equresp7, equresp8
/f = equcorr1, equcorr2, equcorr3, equcorr4, equcorr5, equcorr6, equcorr7, equcorr8.
compute c = 0.
if (a = b) c = 1.
if (a = '%') c = -1.
recode c (-1 = SYSMIS).
compute f = 0.
if (d = e) f = 1.
if (d = -1) f = -1.
recode f (-1 = SYSMIS).
end repeat.
exe. 
* computes correctness of memory items by comparing to true list items; recodes items not presented as missing. Does the same for responses to processing task. 


compute os.pc = mean(corr1, corr2, corr3, corr4, corr5, corr6, corr7, corr8).
compute os.equationpc = mean(equcorr1, equcorr2, equcorr3, equcorr4, equcorr5, equcorr6, equcorr7, equcorr8).
exe.

sort cases by id.
aggregate
/outfile = 'os.sav'
/break = id
/OSMean = mean(os.pc)/OSptMean = mean(os.equationpc).
exe.



* Read Sentence Span.
* list1 to list8 = actually presented letters, resp1 to resp8 = recalled letters, rt1 to rt8 = reaction time of recall, sentstatus1 to 8 = status of presented sentences, 
* sentresp = response to sentences, sentrt = reaction time for response to sentences. 

data list file = 'ss.dat' free
/id * trial * listlength *
list1 (A) list2 (A) list3 (A) list4 (A) list5 (A) list6 (A) list7 (A) list8 (A)
resp1 (A) resp2 (A) resp3 (A) resp4 (A) resp5 (A) resp6 (A) resp7 (A) resp8 (A)
rt1 * rt2 * rt3 * rt4 * rt5 * rt6 * rt7 * rt8 *
sentstatus1 * sentstatus2 * sentstatus3 * sentstatus4 * sentstatus5 * sentstatus6 * sentstatus7 * sentstatus8 *
sentresp1 * sentresp2 * sentresp3 * sentresp4 * sentresp5 * sentresp6 * sentresp7 * sentresp8 *
sentrt1 * sentrt2 * sentrt3 * sentrt4 * sentrt5 * sentrt6 * sentrt7 * sentrt8. 
exe.

do repeat
a = list1, list2, list3, list4, list5, list6, list7, list8
/b = resp1, resp2, resp3, resp4, resp5, resp6, resp7, resp8
/c = corr1, corr2, corr3, corr4, corr5, corr6, corr7, corr8
/d = sentstatus1, sentstatus2, sentstatus3, sentstatus4, sentstatus5, sentstatus6, sentstatus7, sentstatus8
/e = sentresp1, sentresp2, sentresp3, sentresp4, sentresp5, sentresp6, sentresp7, sentresp8
/f = sentcorr1, sentcorr2, sentcorr3, sentcorr4, sentcorr5, sentcorr6, sentcorr7, sentcorr8.
compute c = 0.
if (a = b) c = 1.
if (a = '%') c = -1.
recode c (-1 = SYSMIS).
compute f = 0.
if (d = e) f = 1.
if (d = -1) f = -1.
recode f (-1 = SYSMIS).
end repeat.
exe. 
* computes correctness of memory items by comparing to true list items; recodes items not presented as missing. Does the same for responses to processing task. 

compute ss.pc = mean(corr1, corr2, corr3, corr4, corr5, corr6, corr7, corr8).
compute ss.sentencepc = mean(sentcorr1, sentcorr2, sentcorr3, sentcorr4, sentcorr5, sentcorr6, sentcorr7, sentcorr8).
exe.

sort cases by id.
aggregate
/outfile = 'ss.sav'
/break = id
/SSMean = mean(ss.pc)/SSptMean = mean(ss.sentencepc).
exe.



*** Read SSTM summary file SSTM.dat. 
data list file = 'SSTM.dat' records = 1
/1 maxscore 23-25. 
select if ($casenum = 1).
compute const = 1.
exe.
save outfile = 'temp.sav'.


data list file = 'SSTM.dat' free skip=1
/id * sstm.score * date (A20) time (A12).
compute const = 1.
exe.
match files
/file = *
/table = 'temp.sav'
/by const.
exe.
compute SSTMMean = sstm.score/maxscore. 
exe.
save outfile = 'sstm.sav'/keep id SSTMMean.
exe.


*********************** Putting it all together ***********************.


match files
/file =  'mu.sav'
/file =  'os.sav'
/by id.

match files
/file =  *
/file =  'ss.sav'
/by id.

match files
/file =  *
/file =  'sstm.sav'
/by id.
exe.


