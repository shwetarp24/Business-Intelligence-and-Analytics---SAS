*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS3 "H:\Bia_Priya\Project_PredictiveAnalysis\Workspaces\EMWS3";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS3.Ids_DATA (label="")
/ view=EMWS3.Ids_DATA
;
set BIA.ORGANICS;
run;
