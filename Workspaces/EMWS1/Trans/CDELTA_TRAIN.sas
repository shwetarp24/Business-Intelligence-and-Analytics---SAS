*------------------------------------------------------------*;
* Formula Code;
*------------------------------------------------------------*;

if NAME="DAYLAST_REV" then do;
ROLE ="INPUT";
REPORT ="N";
LEVEL ="INTERVAL";
end;
if NAME="DAYLAST" then delete;
