label PCTL_GiftCntAll = 'Transformed: Gift Count All Months';
length PCTL_GiftCntAll $36;
if (GiftCntAll eq .) then PCTL_GiftCntAll="";
else
if (GiftCntAll < 3) then
PCTL_GiftCntAll = "01:low-3";
else
if (GiftCntAll >= 3 and GiftCntAll < 6) then
PCTL_GiftCntAll = "02:3-6";
else
if (GiftCntAll >= 6 and GiftCntAll < 10) then
PCTL_GiftCntAll = "03:6-10";
else
if (GiftCntAll >= 10 and GiftCntAll < 16) then
PCTL_GiftCntAll = "04:10-16";
else
if (GiftCntAll >= 16) then
PCTL_GiftCntAll = "05:16-high";
