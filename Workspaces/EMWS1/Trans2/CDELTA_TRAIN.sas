*------------------------------------------------------------*;
* Computed Code;
*------------------------------------------------------------*;

if NAME="PCTL_DAYLAST_REV" then do;
   COMMENT = "Quantile(5) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="NOMINAL";
end;
if NAME="DAYLAST_REV" then delete;

if NAME="PCTL_DOLL24" then do;
   COMMENT = "Quantile(5) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="NOMINAL";
end;
if NAME="DOLL24" then delete;

if NAME="PCTL_FREQPRCH" then do;
   COMMENT = "Quantile(5) ";
ROLE ="INPUT";
REPORT ="N";
LEVEL  ="NOMINAL";
end;
if NAME="FREQPRCH" then delete;
