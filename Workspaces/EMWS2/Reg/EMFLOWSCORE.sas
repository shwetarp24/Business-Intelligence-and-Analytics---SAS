*************************************;
*** begin scoring code for regression;
*************************************;

length _WARN_ $4;
label _WARN_ = 'Warnings' ;

length I_RESPOND $ 12;
label I_RESPOND = 'Into: RESPOND' ;
*** Target Values;
array REGDRF [2] $12 _temporary_ ('1' '0' );
label U_RESPOND = 'Unnormalized Into: RESPOND' ;
format U_RESPOND BEST12.;
*** Unnormalized target values;
ARRAY REGDRU[2]  _TEMPORARY_ (1 0);

*** Generate dummy variables for RESPOND ;
drop _Y ;
label F_RESPOND = 'From: RESPOND' ;
length F_RESPOND $ 12;
F_RESPOND = put( RESPOND , BEST12. );
%DMNORMIP( F_RESPOND )
if missing( RESPOND ) then do;
   _Y = .;
end;
else do;
   if F_RESPOND = '0'  then do;
      _Y = 1;
   end;
   else if F_RESPOND = '1'  then do;
      _Y = 0;
   end;
   else do;
      _Y = .;
   end;
end;

drop _DM_BAD;
_DM_BAD=0;

*** Check CATALOGCNT for missing values ;
if missing( CATALOGCNT ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check DOLINDET for missing values ;
if missing( DOLINDET ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check MONLAST for missing values ;
if missing( MONLAST ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TOTORDQ12 for missing values ;
if missing( TOTORDQ12 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TOTORDQ18 for missing values ;
if missing( TOTORDQ18 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TOTORDQ20 for missing values ;
if missing( TOTORDQ20 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TOTORDQ21 for missing values ;
if missing( TOTORDQ21 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;

*** Check TOTORDQ22 for missing values ;
if missing( TOTORDQ22 ) then do;
   substr(_warn_,1,1) = 'M';
   _DM_BAD = 1;
end;
*** If missing inputs, use averages;
if _DM_BAD > 0 then do;
   _P0 = 0.0566154801;
   _P1 = 0.9433845199;
   goto REGDR1;
end;

*** Compute Linear Predictor;
drop _TEMP;
drop _LP0;
_LP0 = 0;

***  Effect: CATALOGCNT ;
_TEMP = CATALOGCNT ;
_LP0 = _LP0 + (    0.05287828242888 * _TEMP);

***  Effect: DOLINDET ;
_TEMP = DOLINDET ;
_LP0 = _LP0 + (    0.00010924816054 * _TEMP);

***  Effect: MONLAST ;
_TEMP = MONLAST ;
_LP0 = _LP0 + (   -0.00585533206157 * _TEMP);

***  Effect: TOTORDQ12 ;
_TEMP = TOTORDQ12 ;
_LP0 = _LP0 + (    0.16138576104677 * _TEMP);

***  Effect: TOTORDQ18 ;
_TEMP = TOTORDQ18 ;
_LP0 = _LP0 + (    0.24376385459683 * _TEMP);

***  Effect: TOTORDQ20 ;
_TEMP = TOTORDQ20 ;
_LP0 = _LP0 + (    0.37824440278404 * _TEMP);

***  Effect: TOTORDQ21 ;
_TEMP = TOTORDQ21 ;
_LP0 = _LP0 + (    0.22907161943856 * _TEMP);

***  Effect: TOTORDQ22 ;
_TEMP = TOTORDQ22 ;
_LP0 = _LP0 + (     0.3705163693338 * _TEMP);

*** Naive Posterior Probabilities;
drop _MAXP _IY _P0 _P1;
_TEMP =    -3.10290798141029 + _LP0;
if (_TEMP < 0) then do;
   _TEMP = exp(_TEMP);
   _P0 = _TEMP / (1 + _TEMP);
end;
else _P0 = 1 / (1 + exp(-_TEMP));
_P1 = 1.0 - _P0;

REGDR1:

*** Residuals;
if (_Y = .) then do;
   R_RESPOND1 = .;
   R_RESPOND0 = .;
end;
else do;
    label R_RESPOND1 = 'Residual: RESPOND=1' ;
    label R_RESPOND0 = 'Residual: RESPOND=0' ;
   R_RESPOND1 = - _P0;
   R_RESPOND0 = - _P1;
   select( _Y );
      when (0)  R_RESPOND1 = R_RESPOND1 + 1;
      when (1)  R_RESPOND0 = R_RESPOND0 + 1;
   end;
end;

*** Posterior Probabilities and Predicted Level;
label P_RESPOND1 = 'Predicted: RESPOND=1' ;
label P_RESPOND0 = 'Predicted: RESPOND=0' ;
P_RESPOND1 = _P0;
_MAXP = _P0;
_IY = 1;
P_RESPOND0 = _P1;
if (_P1 >  _MAXP + 1E-8) then do;
   _MAXP = _P1;
   _IY = 2;
end;
I_RESPOND = REGDRF[_IY];
U_RESPOND = REGDRU[_IY];

*************************************;
***** end scoring code for regression;
*************************************;
