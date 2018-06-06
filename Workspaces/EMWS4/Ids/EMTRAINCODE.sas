*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS4 "H:\Bia_Priya\Project_PredictiveAnalysis\Workspaces\EMWS4";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS4.Ids_DATA (label="")
/ view=EMWS4.Ids_DATA
;
set BIA.BANK;
run;
