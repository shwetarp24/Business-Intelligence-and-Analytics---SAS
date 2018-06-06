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
