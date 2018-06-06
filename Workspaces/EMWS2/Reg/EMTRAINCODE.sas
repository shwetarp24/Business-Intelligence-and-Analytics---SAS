*------------------------------------------------------------*;
* Reg: Create decision matrix;
*------------------------------------------------------------*;
data WORK.RESPOND;
  length   RESPOND                          $  32
           COUNT                                8
           DATAPRIOR                            8
           TRAINPRIOR                           8
           DECPRIOR                             8
           DECISION1                            8
           DECISION2                            8
           ;

  label    COUNT="Level Counts"
           DATAPRIOR="Data Proportions"
           TRAINPRIOR="Training Proportions"
           DECPRIOR="Decision Priors"
           DECISION1="1"
           DECISION2="0"
           ;
  format   COUNT 10.
           ;
RESPOND="1"; COUNT=2739; DATAPRIOR=0.0566424021838; TRAINPRIOR=0.0566424021838; DECPRIOR=.; DECISION1=1; DECISION2=0;
output;
RESPOND="0"; COUNT=45617; DATAPRIOR=0.94335759781619; TRAINPRIOR=0.94335759781619; DECPRIOR=.; DECISION1=0; DECISION2=1;
output;
;
run;
proc datasets lib=work nolist;
modify RESPOND(type=PROFIT label=RESPOND);
label DECISION1= '1';
label DECISION2= '0';
run;
quit;
data EM_DMREG / view=EM_DMREG;
set EMWS2.VarClus_TRAIN(keep=
BOTHPAYM0 CATALOGCNT CCPAYM0 DEPT03 DEPT12 DEPT19 DEPT21 DOLINDEA DOLINDET
DOLLARQ02 DOLLARQ03 DOLLARQ04 DOLLARQ08 DOLLARQ09 DOLLARQ10 DOLLARQ16 DOLLARQ17
METHPAYMCK MONLAST RESPOND TENURE TOTORDQ01 TOTORDQ05 TOTORDQ06 TOTORDQ07
TOTORDQ11 TOTORDQ12 TOTORDQ13 TOTORDQ14 TOTORDQ15 TOTORDQ18 TOTORDQ19 TOTORDQ20
TOTORDQ21 TOTORDQ22 UNTLANPO );
run;
*------------------------------------------------------------* ;
* Reg: DMDBClass Macro ;
*------------------------------------------------------------* ;
%macro DMDBClass;
    RESPOND(DESC)
%mend DMDBClass;
*------------------------------------------------------------* ;
* Reg: DMDBVar Macro ;
*------------------------------------------------------------* ;
%macro DMDBVar;
    BOTHPAYM0 CATALOGCNT CCPAYM0 DEPT03 DEPT12 DEPT19 DEPT21 DOLINDEA DOLINDET
   DOLLARQ02 DOLLARQ03 DOLLARQ04 DOLLARQ08 DOLLARQ09 DOLLARQ10 DOLLARQ16 DOLLARQ17
   METHPAYMCK MONLAST TENURE TOTORDQ01 TOTORDQ05 TOTORDQ06 TOTORDQ07 TOTORDQ11
   TOTORDQ12 TOTORDQ13 TOTORDQ14 TOTORDQ15 TOTORDQ18 TOTORDQ19 TOTORDQ20 TOTORDQ21
   TOTORDQ22 UNTLANPO
%mend DMDBVar;
*------------------------------------------------------------*;
* Reg: Create DMDB;
*------------------------------------------------------------*;
proc dmdb batch data=WORK.EM_DMREG
dmdbcat=WORK.Reg_DMDB
maxlevel = 513
;
class %DMDBClass;
var %DMDBVar;
target
RESPOND
;
run;
quit;
*------------------------------------------------------------*;
* Reg: Run DMREG procedure;
*------------------------------------------------------------*;
proc dmreg data=EM_DMREG dmdbcat=WORK.Reg_DMDB
validata = EMWS2.VarClus_VALIDATE
outest = EMWS2.Reg_EMESTIMATE
outterms = EMWS2.Reg_OUTTERMS
outmap= EMWS2.Reg_MAPDS namelen=200
;
class
RESPOND
;
model RESPOND =
BOTHPAYM0
CATALOGCNT
CCPAYM0
DEPT03
DEPT12
DEPT19
DEPT21
DOLINDEA
DOLINDET
DOLLARQ02
DOLLARQ03
DOLLARQ04
DOLLARQ08
DOLLARQ09
DOLLARQ10
DOLLARQ16
DOLLARQ17
METHPAYMCK
MONLAST
TENURE
TOTORDQ01
TOTORDQ05
TOTORDQ06
TOTORDQ07
TOTORDQ11
TOTORDQ12
TOTORDQ13
TOTORDQ14
TOTORDQ15
TOTORDQ18
TOTORDQ19
TOTORDQ20
TOTORDQ21
TOTORDQ22
UNTLANPO
/error=binomial link=LOGIT
coding=DEVIATION
nodesignprint
selection=FORWARD choose=VERROR
Hierarchy=CLASS
Rule=NONE
;
;
code file="H:\Bia_Priya\Project_PredictiveAnalysis\Workspaces\EMWS2\Reg\EMPUBLISHSCORE.sas"
group=Reg
;
code file="H:\Bia_Priya\Project_PredictiveAnalysis\Workspaces\EMWS2\Reg\EMFLOWSCORE.sas"
group=Reg
residual
;
run;
quit;
