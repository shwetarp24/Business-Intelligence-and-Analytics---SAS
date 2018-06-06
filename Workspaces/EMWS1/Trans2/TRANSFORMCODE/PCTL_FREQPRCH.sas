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
