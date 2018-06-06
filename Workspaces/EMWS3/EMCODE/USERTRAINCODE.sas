ods graphics on;
proc corr data=&em_import_data;
var targetbuy targetamt;
run;
ods graphics off;
