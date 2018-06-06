*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS1 "H:\Bia_Priya\Project_PredictiveAnalysis\Workspaces\EMWS1";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS1.Ids_DATA (label="")
/ view=EMWS1.Ids_DATA
;
set BIA.CATALOG2010;
run;
