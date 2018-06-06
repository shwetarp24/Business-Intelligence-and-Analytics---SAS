****************************************************************;
******             DECISION TREE SCORING CODE             ******;
****************************************************************;

******         LENGTHS OF NEW CHARACTER VARIABLES         ******;
LENGTH I_TargetBuy  $   12; 
LENGTH _WARN_  $    4; 

******              LABELS FOR NEW VARIABLES              ******;
label _NODE_ = 'Node' ;
label _LEAF_ = 'Leaf' ;
label P_TargetBuy0 = 'Predicted: TargetBuy=0' ;
label P_TargetBuy1 = 'Predicted: TargetBuy=1' ;
label Q_TargetBuy0 = 'Unadjusted P: TargetBuy=0' ;
label Q_TargetBuy1 = 'Unadjusted P: TargetBuy=1' ;
label V_TargetBuy0 = 'Validated: TargetBuy=0' ;
label V_TargetBuy1 = 'Validated: TargetBuy=1' ;
label I_TargetBuy = 'Into: TargetBuy' ;
label U_TargetBuy = 'Unnormalized Into: TargetBuy' ;
label _WARN_ = 'Warnings' ;


******      TEMPORARY VARIABLES FOR FORMATTED VALUES      ******;
LENGTH _ARBFMT_12 $     12; DROP _ARBFMT_12; 
_ARBFMT_12 = ' '; /* Initialize to avoid warning. */
LENGTH _ARBFMT_1 $      1; DROP _ARBFMT_1; 
_ARBFMT_1 = ' '; /* Initialize to avoid warning. */


******             ASSIGN OBSERVATION TO NODE             ******;
IF  NOT MISSING(DemAge ) AND 
  DemAge  <                 44.5 THEN DO;
  IF  NOT MISSING(DemAffl ) AND 
    DemAffl  <                  9.5 THEN DO;
    _ARBFMT_1 = PUT( DemGender , $1.);
     %DMNORMIP( _ARBFMT_1);
    IF _ARBFMT_1 IN ('F' ) THEN DO;
      IF  NOT MISSING(DemAffl ) AND 
        DemAffl  <                  6.5 THEN DO;
        _NODE_  =                   16;
        _LEAF_  =                    1;
        P_TargetBuy0  =     0.65573770491803;
        P_TargetBuy1  =     0.34426229508196;
        Q_TargetBuy0  =     0.65573770491803;
        Q_TargetBuy1  =     0.34426229508196;
        V_TargetBuy0  =     0.59696969696969;
        V_TargetBuy1  =      0.4030303030303;
        I_TargetBuy  = '0' ;
        U_TargetBuy  =                    0;
        END;
      ELSE DO;
        IF  NOT MISSING(DemAge ) AND 
                          39.5 <= DemAge  THEN DO;
          _NODE_  =                   33;
          _LEAF_  =                    3;
          P_TargetBuy0  =     0.56852791878172;
          P_TargetBuy1  =     0.43147208121827;
          Q_TargetBuy0  =     0.56852791878172;
          Q_TargetBuy1  =     0.43147208121827;
          V_TargetBuy0  =     0.57219251336898;
          V_TargetBuy1  =     0.42780748663101;
          I_TargetBuy  = '0' ;
          U_TargetBuy  =                    0;
          END;
        ELSE DO;
          _NODE_  =                   32;
          _LEAF_  =                    2;
          P_TargetBuy0  =     0.38622754491017;
          P_TargetBuy1  =     0.61377245508982;
          Q_TargetBuy0  =     0.38622754491017;
          Q_TargetBuy1  =     0.61377245508982;
          V_TargetBuy0  =     0.37978142076502;
          V_TargetBuy1  =     0.62021857923497;
          I_TargetBuy  = '1' ;
          U_TargetBuy  =                    1;
          END;
        END;
      END;
    ELSE DO;
      _ARBFMT_1 = PUT( DemGender , $1.);
       %DMNORMIP( _ARBFMT_1);
      IF _ARBFMT_1 IN ('M' ) THEN DO;
        IF  NOT MISSING(DemAge ) AND 
                          39.5 <= DemAge  THEN DO;
          _NODE_  =                   35;
          _LEAF_  =                    5;
          P_TargetBuy0  =                 0.82;
          P_TargetBuy1  =                 0.18;
          Q_TargetBuy0  =                 0.82;
          Q_TargetBuy1  =                 0.18;
          V_TargetBuy0  =     0.84615384615384;
          V_TargetBuy1  =     0.15384615384615;
          I_TargetBuy  = '0' ;
          U_TargetBuy  =                    0;
          END;
        ELSE DO;
          _NODE_  =                   34;
          _LEAF_  =                    4;
          P_TargetBuy0  =      0.6255707762557;
          P_TargetBuy1  =     0.37442922374429;
          Q_TargetBuy0  =      0.6255707762557;
          Q_TargetBuy1  =     0.37442922374429;
          V_TargetBuy0  =     0.65945945945945;
          V_TargetBuy1  =     0.34054054054054;
          I_TargetBuy  = '0' ;
          U_TargetBuy  =                    0;
          END;
        END;
      ELSE DO;
        _NODE_  =                   19;
        _LEAF_  =                    6;
        P_TargetBuy0  =     0.87012987012987;
        P_TargetBuy1  =     0.12987012987012;
        Q_TargetBuy0  =     0.87012987012987;
        Q_TargetBuy1  =     0.12987012987012;
        V_TargetBuy0  =     0.86792452830188;
        V_TargetBuy1  =     0.13207547169811;
        I_TargetBuy  = '0' ;
        U_TargetBuy  =                    0;
        END;
      END;
    END;
  ELSE DO;
    _ARBFMT_1 = PUT( DemGender , $1.);
     %DMNORMIP( _ARBFMT_1);
    IF _ARBFMT_1 IN ('F' ) THEN DO;
      IF  NOT MISSING(DemAffl ) AND 
                        11.5 <= DemAffl  THEN DO;
        IF  NOT MISSING(DemAffl ) AND 
                          14.5 <= DemAffl  THEN DO;
          _NODE_  =                   39;
          _LEAF_  =                   10;
          P_TargetBuy0  =     0.06467661691542;
          P_TargetBuy1  =     0.93532338308457;
          Q_TargetBuy0  =     0.06467661691542;
          Q_TargetBuy1  =     0.93532338308457;
          V_TargetBuy0  =     0.05729166666666;
          V_TargetBuy1  =     0.94270833333333;
          I_TargetBuy  = '1' ;
          U_TargetBuy  =                    1;
          END;
        ELSE DO;
          _NODE_  =                   38;
          _LEAF_  =                    9;
          P_TargetBuy0  =     0.19787985865724;
          P_TargetBuy1  =     0.80212014134275;
          Q_TargetBuy0  =     0.19787985865724;
          Q_TargetBuy1  =     0.80212014134275;
          V_TargetBuy0  =     0.22535211267605;
          V_TargetBuy1  =     0.77464788732394;
          I_TargetBuy  = '1' ;
          U_TargetBuy  =                    1;
          END;
        END;
      ELSE DO;
        IF  NOT MISSING(DemAge ) AND 
                          40.5 <= DemAge  THEN DO;
          _NODE_  =                   37;
          _LEAF_  =                    8;
          P_TargetBuy0  =     0.46491228070175;
          P_TargetBuy1  =     0.53508771929824;
          Q_TargetBuy0  =     0.46491228070175;
          Q_TargetBuy1  =     0.53508771929824;
          V_TargetBuy0  =     0.37234042553191;
          V_TargetBuy1  =     0.62765957446808;
          I_TargetBuy  = '1' ;
          U_TargetBuy  =                    1;
          END;
        ELSE DO;
          _NODE_  =                   36;
          _LEAF_  =                    7;
          P_TargetBuy0  =     0.26206896551724;
          P_TargetBuy1  =     0.73793103448275;
          Q_TargetBuy0  =     0.26206896551724;
          Q_TargetBuy1  =     0.73793103448275;
          V_TargetBuy0  =      0.2369337979094;
          V_TargetBuy1  =     0.76306620209059;
          I_TargetBuy  = '1' ;
          U_TargetBuy  =                    1;
          END;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(DemAffl ) AND 
                        14.5 <= DemAffl  THEN DO;
        _NODE_  =                   23;
        _LEAF_  =                   13;
        P_TargetBuy0  =     0.11111111111111;
        P_TargetBuy1  =     0.88888888888888;
        Q_TargetBuy0  =     0.11111111111111;
        Q_TargetBuy1  =     0.88888888888888;
        V_TargetBuy0  =     0.17567567567567;
        V_TargetBuy1  =     0.82432432432432;
        I_TargetBuy  = '1' ;
        U_TargetBuy  =                    1;
        END;
      ELSE DO;
        IF  NOT MISSING(DemAffl ) AND 
                          12.5 <= DemAffl  THEN DO;
          _NODE_  =                   41;
          _LEAF_  =                   12;
          P_TargetBuy0  =     0.38028169014084;
          P_TargetBuy1  =     0.61971830985915;
          Q_TargetBuy0  =     0.38028169014084;
          Q_TargetBuy1  =     0.61971830985915;
          V_TargetBuy0  =     0.48333333333333;
          V_TargetBuy1  =     0.51666666666666;
          I_TargetBuy  = '1' ;
          U_TargetBuy  =                    1;
          END;
        ELSE DO;
          _NODE_  =                   40;
          _LEAF_  =                   11;
          P_TargetBuy0  =     0.58394160583941;
          P_TargetBuy1  =     0.41605839416058;
          Q_TargetBuy0  =     0.58394160583941;
          Q_TargetBuy1  =     0.41605839416058;
          V_TargetBuy0  =     0.65551839464882;
          V_TargetBuy1  =     0.34448160535117;
          I_TargetBuy  = '0' ;
          U_TargetBuy  =                    0;
          END;
        END;
      END;
    END;
  END;
ELSE DO;
  IF  NOT MISSING(DemAffl ) AND 
                    12.5 <= DemAffl  THEN DO;
    IF  NOT MISSING(DemAffl ) AND 
                      16.5 <= DemAffl  THEN DO;
      IF  NOT MISSING(DemAffl ) AND 
                        19.5 <= DemAffl  THEN DO;
        _NODE_  =                   31;
        _LEAF_  =                   29;
        P_TargetBuy0  =                    0;
        P_TargetBuy1  =                    1;
        Q_TargetBuy0  =                    0;
        Q_TargetBuy1  =                    1;
        V_TargetBuy0  =                 0.04;
        V_TargetBuy1  =                 0.96;
        I_TargetBuy  = '1' ;
        U_TargetBuy  =                    1;
        END;
      ELSE DO;
        _ARBFMT_1 = PUT( DemGender , $1.);
         %DMNORMIP( _ARBFMT_1);
        IF _ARBFMT_1 IN ('M' ,'F' ) THEN DO;
          _NODE_  =                   50;
          _LEAF_  =                   27;
          P_TargetBuy0  =               0.2625;
          P_TargetBuy1  =               0.7375;
          Q_TargetBuy0  =               0.2625;
          Q_TargetBuy1  =               0.7375;
          V_TargetBuy0  =     0.28169014084507;
          V_TargetBuy1  =     0.71830985915492;
          I_TargetBuy  = '1' ;
          U_TargetBuy  =                    1;
          END;
        ELSE DO;
          _NODE_  =                   51;
          _LEAF_  =                   28;
          P_TargetBuy0  =     0.72727272727272;
          P_TargetBuy1  =     0.27272727272727;
          Q_TargetBuy0  =     0.72727272727272;
          Q_TargetBuy1  =     0.27272727272727;
          V_TargetBuy0  =                  0.9;
          V_TargetBuy1  =                  0.1;
          I_TargetBuy  = '0' ;
          U_TargetBuy  =                    0;
          END;
        END;
      END;
    ELSE DO;
      _ARBFMT_1 = PUT( DemGender , $1.);
       %DMNORMIP( _ARBFMT_1);
      IF _ARBFMT_1 IN ('F' ) THEN DO;
        _NODE_  =                   29;
        _LEAF_  =                   26;
        P_TargetBuy0  =     0.53221957040572;
        P_TargetBuy1  =     0.46778042959427;
        Q_TargetBuy0  =     0.53221957040572;
        Q_TargetBuy1  =     0.46778042959427;
        V_TargetBuy0  =     0.46172839506172;
        V_TargetBuy1  =     0.53827160493827;
        I_TargetBuy  = '0' ;
        U_TargetBuy  =                    0;
        END;
      ELSE DO;
        _NODE_  =                   28;
        _LEAF_  =                   25;
        P_TargetBuy0  =     0.76029962546816;
        P_TargetBuy1  =     0.23970037453183;
        Q_TargetBuy0  =     0.76029962546816;
        Q_TargetBuy1  =     0.23970037453183;
        V_TargetBuy0  =     0.77935943060498;
        V_TargetBuy1  =     0.22064056939501;
        I_TargetBuy  = '0' ;
        U_TargetBuy  =                    0;
        END;
      END;
    END;
  ELSE DO;
    _ARBFMT_1 = PUT( DemGender , $1.);
     %DMNORMIP( _ARBFMT_1);
    IF _ARBFMT_1 IN ('F' ) THEN DO;
      IF  NOT MISSING(DemAffl ) AND 
        DemAffl  <                  8.5 THEN DO;
        IF  NOT MISSING(DemAffl ) AND 
          DemAffl  <                  5.5 THEN DO;
          IF  NOT MISSING(DemAge ) THEN DO;
            _NODE_  =                   52;
            _LEAF_  =                   14;
            P_TargetBuy0  =     0.94025157232704;
            P_TargetBuy1  =     0.05974842767295;
            Q_TargetBuy0  =     0.94025157232704;
            Q_TargetBuy1  =     0.05974842767295;
            V_TargetBuy0  =     0.91891891891891;
            V_TargetBuy1  =     0.08108108108108;
            I_TargetBuy  = '0' ;
            U_TargetBuy  =                    0;
            END;
          ELSE DO;
            _NODE_  =                   53;
            _LEAF_  =                   15;
            P_TargetBuy0  =     0.78571428571428;
            P_TargetBuy1  =     0.21428571428571;
            Q_TargetBuy0  =     0.78571428571428;
            Q_TargetBuy1  =     0.21428571428571;
            V_TargetBuy0  =     0.79245283018867;
            V_TargetBuy1  =     0.20754716981132;
            I_TargetBuy  = '0' ;
            U_TargetBuy  =                    0;
            END;
          END;
        ELSE DO;
          _NODE_  =                   43;
          _LEAF_  =                   16;
          P_TargetBuy0  =     0.84289617486338;
          P_TargetBuy1  =     0.15710382513661;
          Q_TargetBuy0  =     0.84289617486338;
          Q_TargetBuy1  =     0.15710382513661;
          V_TargetBuy0  =     0.86320109439124;
          V_TargetBuy1  =     0.13679890560875;
          I_TargetBuy  = '0' ;
          U_TargetBuy  =                    0;
          END;
        END;
      ELSE DO;
        IF  NOT MISSING(DemAge ) THEN DO;
          IF  NOT MISSING(DemAffl ) AND 
                            10.5 <= DemAffl  THEN DO;
            _NODE_  =                   55;
            _LEAF_  =                   18;
            P_TargetBuy0  =       0.690036900369;
            P_TargetBuy1  =     0.30996309963099;
            Q_TargetBuy0  =       0.690036900369;
            Q_TargetBuy1  =     0.30996309963099;
            V_TargetBuy0  =     0.69047619047619;
            V_TargetBuy1  =      0.3095238095238;
            I_TargetBuy  = '0' ;
            U_TargetBuy  =                    0;
            END;
          ELSE DO;
            _NODE_  =                   54;
            _LEAF_  =                   17;
            P_TargetBuy0  =     0.79824561403508;
            P_TargetBuy1  =     0.20175438596491;
            Q_TargetBuy0  =     0.79824561403508;
            Q_TargetBuy1  =     0.20175438596491;
            V_TargetBuy0  =     0.76797698945349;
            V_TargetBuy1  =      0.2320230105465;
            I_TargetBuy  = '0' ;
            U_TargetBuy  =                    0;
            END;
          END;
        ELSE DO;
          _NODE_  =                   45;
          _LEAF_  =                   19;
          P_TargetBuy0  =     0.55294117647058;
          P_TargetBuy1  =     0.44705882352941;
          Q_TargetBuy0  =     0.55294117647058;
          Q_TargetBuy1  =     0.44705882352941;
          V_TargetBuy0  =     0.55089820359281;
          V_TargetBuy1  =     0.44910179640718;
          I_TargetBuy  = '0' ;
          U_TargetBuy  =                    0;
          END;
        END;
      END;
    ELSE DO;
      IF  NOT MISSING(DemAffl ) AND 
        DemAffl  <                  8.5 THEN DO;
        IF  NOT MISSING(DemAge ) AND 
          DemAge  <                 76.5 THEN DO;
          IF  NOT MISSING(DemAffl ) AND 
            DemAffl  <                  5.5 THEN DO;
            _NODE_  =                   56;
            _LEAF_  =                   20;
            P_TargetBuy0  =     0.98786039453717;
            P_TargetBuy1  =     0.01213960546282;
            Q_TargetBuy0  =     0.98786039453717;
            Q_TargetBuy1  =     0.01213960546282;
            V_TargetBuy0  =     0.98095238095238;
            V_TargetBuy1  =     0.01904761904761;
            I_TargetBuy  = '0' ;
            U_TargetBuy  =                    0;
            END;
          ELSE DO;
            _NODE_  =                   57;
            _LEAF_  =                   21;
            P_TargetBuy0  =     0.95436664044059;
            P_TargetBuy1  =      0.0456333595594;
            Q_TargetBuy0  =     0.95436664044059;
            Q_TargetBuy1  =      0.0456333595594;
            V_TargetBuy0  =     0.96105919003115;
            V_TargetBuy1  =     0.03894080996884;
            I_TargetBuy  = '0' ;
            U_TargetBuy  =                    0;
            END;
          END;
        ELSE DO;
          _NODE_  =                   47;
          _LEAF_  =                   22;
          P_TargetBuy0  =     0.90118577075098;
          P_TargetBuy1  =     0.09881422924901;
          Q_TargetBuy0  =     0.90118577075098;
          Q_TargetBuy1  =     0.09881422924901;
          V_TargetBuy0  =     0.91860465116279;
          V_TargetBuy1  =      0.0813953488372;
          I_TargetBuy  = '0' ;
          U_TargetBuy  =                    0;
          END;
        END;
      ELSE DO;
        _ARBFMT_1 = PUT( DemGender , $1.);
         %DMNORMIP( _ARBFMT_1);
        IF _ARBFMT_1 IN ('M' ) THEN DO;
          _NODE_  =                   48;
          _LEAF_  =                   23;
          P_TargetBuy0  =     0.87226697353279;
          P_TargetBuy1  =      0.1277330264672;
          Q_TargetBuy0  =     0.87226697353279;
          Q_TargetBuy1  =      0.1277330264672;
          V_TargetBuy0  =     0.88209606986899;
          V_TargetBuy1  =       0.117903930131;
          I_TargetBuy  = '0' ;
          U_TargetBuy  =                    0;
          END;
        ELSE DO;
          _NODE_  =                   49;
          _LEAF_  =                   24;
          P_TargetBuy0  =     0.94173228346456;
          P_TargetBuy1  =     0.05826771653543;
          Q_TargetBuy0  =     0.94173228346456;
          Q_TargetBuy1  =     0.05826771653543;
          V_TargetBuy0  =     0.93944099378882;
          V_TargetBuy1  =     0.06055900621118;
          I_TargetBuy  = '0' ;
          U_TargetBuy  =                    0;
          END;
        END;
      END;
    END;
  END;

****************************************************************;
******          END OF DECISION TREE SCORING CODE         ******;
****************************************************************;

