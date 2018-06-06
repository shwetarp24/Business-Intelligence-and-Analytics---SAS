ods graphics on;
proc corr data=&em_import_data;
var monlast tenure unitsidd unitslap untlanpo freqprch dolindet dolnetdt dolindea dolnetda doll24;
run;
ods graphics off;
