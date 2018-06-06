
if NAME="PCTL_GiftCntAll" then do;
   COMMENT = "Quantile(5) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="NOMINAL";
end;
if NAME="GiftCntAll" then delete;

if NAME="PCTL_GiftDolAll" then do;
   COMMENT = "Quantile(5) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="NOMINAL";
end;
if NAME="GiftDolAll" then delete;

if NAME="PCTL_GiftTimeLast_Rev" then do;
   COMMENT = "Quantile(5) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="NOMINAL";
end;
if NAME="GiftTimeLast_Rev" then delete;
