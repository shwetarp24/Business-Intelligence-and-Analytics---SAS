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
