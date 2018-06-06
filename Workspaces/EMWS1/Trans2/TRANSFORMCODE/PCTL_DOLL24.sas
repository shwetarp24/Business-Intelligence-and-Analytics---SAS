label PCTL_DOLL24 = 'Transformed: $ last 24 months';
length PCTL_DOLL24 $36;
if (DOLL24 eq .) then PCTL_DOLL24="";
else
if (DOLL24 < 0) then
PCTL_DOLL24 = "01:low-0";
else
if (DOLL24 >= 0 and DOLL24 < 24.75) then
PCTL_DOLL24 = "03:0-24.75";
else
if (DOLL24 >= 24.75 and DOLL24 < 71.6) then
PCTL_DOLL24 = "04:24.75-71.6";
else
if (DOLL24 >= 71.6) then
PCTL_DOLL24 = "05:71.6-high";
