*------------------------------------------------------------*;
* Data Source Setup;
*------------------------------------------------------------*;
libname EMWS2 "H:\Bia_Priya\Project_PredictiveAnalysis\Workspaces\EMWS2";
*------------------------------------------------------------*;
* Ids: Creating DATA data;
*------------------------------------------------------------*;
data EMWS2.Ids_DATA (label="")
/ view=EMWS2.Ids_DATA
;
set BIA.CATALOG2010;
run;
