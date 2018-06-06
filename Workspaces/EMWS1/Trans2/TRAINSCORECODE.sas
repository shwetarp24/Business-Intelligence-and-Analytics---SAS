*------------------------------------------------------------*;
* TRANSFORM: DAYLAST_REV , Quantile(5);
*------------------------------------------------------------*;
label PCTL_DAYLAST_REV = 'Transformed DAYLAST_REV';
length PCTL_DAYLAST_REV $36;
if (DAYLAST_REV eq .) then PCTL_DAYLAST_REV="";
else
if (DAYLAST_REV < -1826) then
PCTL_DAYLAST_REV = "01:low--1826";
else
if (DAYLAST_REV >= -1826 and DAYLAST_REV < -1008) then
PCTL_DAYLAST_REV = "02:-1826--1008";
else
if (DAYLAST_REV >= -1008 and DAYLAST_REV < -573) then
PCTL_DAYLAST_REV = "03:-1008--573";
else
if (DAYLAST_REV >= -573 and DAYLAST_REV < -256) then
PCTL_DAYLAST_REV = "04:-573--256";
else
if (DAYLAST_REV >= -256) then
PCTL_DAYLAST_REV = "05:-256-high";
*------------------------------------------------------------*;
* TRANSFORM: DOLL24 , Quantile(5);
*------------------------------------------------------------*;
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
*------------------------------------------------------------*;
* TRANSFORM: FREQPRCH , Quantile(5);
*------------------------------------------------------------*;
label PCTL_FREQPRCH = 'Transformed: lifetime orders';
length PCTL_FREQPRCH $36;
if (FREQPRCH eq .) then PCTL_FREQPRCH="";
else
if (FREQPRCH < 1) then
PCTL_FREQPRCH = "01:low-1";
else
if (FREQPRCH >= 1 and FREQPRCH < 2) then
PCTL_FREQPRCH = "02:1-2";
else
if (FREQPRCH >= 2 and FREQPRCH < 3) then
PCTL_FREQPRCH = "03:2-3";
else
if (FREQPRCH >= 3 and FREQPRCH < 6) then
PCTL_FREQPRCH = "04:3-6";
else
if (FREQPRCH >= 6) then
PCTL_FREQPRCH = "05:6-high";
