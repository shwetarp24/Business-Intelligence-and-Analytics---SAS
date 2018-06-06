*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS3 "H:\Bia_Priya\Project_PredictiveAnalysis\Workspaces\EMWS3";
*------------------------------------------------------------*;
* Ids2: Creating DATA data;
*------------------------------------------------------------*;
data EMWS3.Ids2_DATA (label="")
/ view=EMWS3.Ids2_DATA
;
set BIA.ORGANICS;
run;
