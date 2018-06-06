*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "H:\Bia_Priya\Project_PredictiveAnalysis\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids2: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids2_DATA (label="")
/ view=EMWS1.Ids2_DATA
;
set BIA.PVA97NK;
run;
