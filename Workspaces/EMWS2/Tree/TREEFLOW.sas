****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH F_RESPOND  $   12; 
LENGTH I_RESPOND  $   12; 
LENGTH _WARN_  $    4; 

******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_RESPOND1 = 'Predicted: RESPOND=1' ;
label P_RESPOND0 = 'Predicted: RESPOND=0' ;
label Q_RESPOND1 = 'Unadjusted P: RESPOND=1' ;
label Q_RESPOND0 = 'Unadjusted P: RESPOND=0' ;
label V_RESPOND1 = 'Validated: RESPOND=1' ;
label V_RESPOND0 = 'Validated: RESPOND=0' ;
label R_RESPOND1 = 'Residual: RESPOND=1' ;
label R_RESPOND0 = 'Residual: RESPOND=0' ;
label F_RESPOND = 'From: RESPOND' ;
label I_RESPOND = 'Into: RESPOND' ;
label U_RESPOND = 'Unnormalized Into: RESPOND' ;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12; 
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */


_ARBFMT_12 = PUT( RESPOND , BEST12.);
 %DMNORMCP( _ARBFMT_12, F_RESPOND );

******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(DOLL24 ) AND 
                 121.2 <= DOLL24  THEN DO;
  _NODE_  =                    3;
  _LEAF_  =                    4;
  P_RESPOND1  =     0.13338973491257;
  P_RESPOND0  =     0.86661026508742;
  Q_RESPOND1  =     0.13338973491257;
  Q_RESPOND0  =     0.86661026508742;
  V_RESPOND1  =     0.12445414847161;
  V_RESPOND0  =     0.87554585152838;
  I_RESPOND  = '0' ;
  U_RESPOND  =                    0;
  END;
ELSE DO;
  IF  NOT MISSING(TENURE ) AND 
    TENURE  <                  1.5 THEN DO;
    IF  NOT MISSING(DAYLAST ) AND 
                      46.5 <= DAYLAST  THEN DO;
      _NODE_  =                    9;
      _LEAF_  =                    2;
      P_RESPOND1  =     0.11111111111111;
      P_RESPOND0  =     0.88888888888888;
      Q_RESPOND1  =     0.11111111111111;
      Q_RESPOND0  =     0.88888888888888;
      V_RESPOND1  =                    0;
      V_RESPOND0  =                    1;
      I_RESPOND  = '0' ;
      U_RESPOND  =                    0;
      END;
    ELSE DO;
      _NODE_  =                    8;
      _LEAF_  =                    1;
      P_RESPOND1  =     0.95454545454545;
      P_RESPOND0  =     0.04545454545454;
      Q_RESPOND1  =     0.95454545454545;
      Q_RESPOND0  =     0.04545454545454;
      V_RESPOND1  =                    1;
      V_RESPOND0  =                    0;
      I_RESPOND  = '1' ;
      U_RESPOND  =                    1;
      END;
    END;
  ELSE DO;
    _NODE_  =                    5;
    _LEAF_  =                    3;
    P_RESPOND1  =     0.04640937957987;
    P_RESPOND0  =     0.95359062042012;
    Q_RESPOND1  =     0.04640937957987;
    Q_RESPOND0  =     0.95359062042012;
    V_RESPOND1  =     0.04756567425569;
    V_RESPOND0  =      0.9524343257443;
    I_RESPOND  = '0' ;
    U_RESPOND  =                    0;
    END;
  END;

*****  RESIDUALS R_ *************;
IF  F_RESPOND  NE '1' 
AND F_RESPOND  NE '0'  THEN DO; 
        R_RESPOND1  = .;
        R_RESPOND0  = .;
 END;
 ELSE DO;
       R_RESPOND1  =  -P_RESPOND1 ;
       R_RESPOND0  =  -P_RESPOND0 ;
       SELECT( F_RESPOND  );
          WHEN( '1'  ) R_RESPOND1  = R_RESPOND1  +1;
          WHEN( '0'  ) R_RESPOND0  = R_RESPOND0  +1;
       END;
 END;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

