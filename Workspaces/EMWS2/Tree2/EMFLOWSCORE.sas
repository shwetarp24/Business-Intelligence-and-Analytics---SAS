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
  IF  NOT MISSING(DEPT25 ) AND
                    32.5 <= DEPT25  THEN DO;
    _NODE_  =                    7;
    _LEAF_  =                    8;
    P_RESPOND1  =      0.4390243902439;
    P_RESPOND0  =     0.56097560975609;
    Q_RESPOND1  =      0.4390243902439;
    Q_RESPOND0  =     0.56097560975609;
    V_RESPOND1  =      0.3076923076923;
    V_RESPOND0  =     0.69230769230769;
    I_RESPOND  = '0' ;
    U_RESPOND  =                    0;
    END;
  ELSE DO;
    IF  NOT MISSING(FREQPRCH ) AND
                       8.5 <= FREQPRCH  THEN DO;
      _NODE_  =                   13;
      _LEAF_  =                    7;
      P_RESPOND1  =     0.17607413647851;
      P_RESPOND0  =     0.82392586352148;
      Q_RESPOND1  =     0.17607413647851;
      Q_RESPOND0  =     0.82392586352148;
      V_RESPOND1  =     0.17874396135265;
      V_RESPOND0  =     0.82125603864734;
      I_RESPOND  = '0' ;
      U_RESPOND  =                    0;
      END;
    ELSE DO;
      _NODE_  =                   12;
      _LEAF_  =                    6;
      P_RESPOND1  =     0.10013175230566;
      P_RESPOND0  =     0.89986824769433;
      Q_RESPOND1  =     0.10013175230566;
      Q_RESPOND0  =     0.89986824769433;
      V_RESPOND1  =       0.089590443686;
      V_RESPOND0  =     0.91040955631399;
      I_RESPOND  = '0' ;
      U_RESPOND  =                    0;
      END;
    END;
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
    IF  NOT MISSING(DOLL24 ) AND
                    23.975 <= DOLL24  THEN DO;
      IF  NOT MISSING(ACTBUY ) AND
                         1.5 <= ACTBUY  THEN DO;
        _NODE_  =                   19;
        _LEAF_  =                    5;
        P_RESPOND1  =     0.10306612486147;
        P_RESPOND0  =     0.89693387513852;
        Q_RESPOND1  =     0.10306612486147;
        Q_RESPOND0  =     0.89693387513852;
        V_RESPOND1  =     0.09674922600619;
        V_RESPOND0  =      0.9032507739938;
        I_RESPOND  = '0' ;
        U_RESPOND  =                    0;
        END;
      ELSE DO;
        _NODE_  =                   18;
        _LEAF_  =                    4;
        P_RESPOND1  =     0.05328917657684;
        P_RESPOND0  =     0.94671082342315;
        Q_RESPOND1  =     0.05328917657684;
        Q_RESPOND0  =     0.94671082342315;
        V_RESPOND1  =     0.05952028427598;
        V_RESPOND0  =     0.94047971572401;
        I_RESPOND  = '0' ;
        U_RESPOND  =                    0;
        END;
      END;
    ELSE DO;
      _NODE_  =                   10;
      _LEAF_  =                    3;
      P_RESPOND1  =     0.03609902631033;
      P_RESPOND0  =     0.96390097368966;
      Q_RESPOND1  =     0.03609902631033;
      Q_RESPOND0  =     0.96390097368966;
      V_RESPOND1  =     0.03674786591713;
      V_RESPOND0  =     0.96325213408286;
      I_RESPOND  = '0' ;
      U_RESPOND  =                    0;
      END;
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
 
drop _LEAF_;
