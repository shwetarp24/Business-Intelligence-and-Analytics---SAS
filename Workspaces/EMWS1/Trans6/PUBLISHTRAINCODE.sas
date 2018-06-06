*------------------------------------------------------------*;
* TRANSFORM: GiftCntAll , Quantile(5);
*------------------------------------------------------------*;
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
*------------------------------------------------------------*;
* TRANSFORM: GiftDolAll , Quantile(5);
*------------------------------------------------------------*;
label PCTL_GiftDolAll = 'Transformed GiftDolAll';
length PCTL_GiftDolAll $36;
if (GiftDolAll eq .) then PCTL_GiftDolAll="";
else
if (GiftDolAll < 36) then
PCTL_GiftDolAll = "01:low-36";
else
if (GiftDolAll >= 36 and GiftDolAll < 65.01) then
PCTL_GiftDolAll = "02:36-65.01";
else
if (GiftDolAll >= 65.01 and GiftDolAll < 99.96) then
PCTL_GiftDolAll = "03:65.01-99.96";
else
if (GiftDolAll >= 99.96 and GiftDolAll < 150.96) then
PCTL_GiftDolAll = "04:99.96-150.96";
else
if (GiftDolAll >= 150.96) then
PCTL_GiftDolAll = "05:150.96-high";
*------------------------------------------------------------*;
* TRANSFORM: GiftTimeLast_Rev , Quantile(5);
*------------------------------------------------------------*;
label PCTL_GiftTimeLast_Rev = 'Transformed GiftTimeLast_Rev';
length PCTL_GiftTimeLast_Rev $36;
if (GiftTimeLast_Rev eq .) then PCTL_GiftTimeLast_Rev="";
else
if (GiftTimeLast_Rev < -21) then
PCTL_GiftTimeLast_Rev = "01:low--21";
else
if (GiftTimeLast_Rev >= -21 and GiftTimeLast_Rev < -18) then
PCTL_GiftTimeLast_Rev = "02:-21--18";
else
if (GiftTimeLast_Rev >= -18 and GiftTimeLast_Rev < -17) then
PCTL_GiftTimeLast_Rev = "03:-18--17";
else
if (GiftTimeLast_Rev >= -17 and GiftTimeLast_Rev < -16) then
PCTL_GiftTimeLast_Rev = "04:-17--16";
else
if (GiftTimeLast_Rev >= -16) then
PCTL_GiftTimeLast_Rev = "05:-16-high";
