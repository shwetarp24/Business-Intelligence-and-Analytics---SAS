drop _temp_;
if (P_RESPOND1 ge 0.10306612486147) then do;
_temp_ = dmran(1234);
b_RESPOND = floor(1 + 2*_temp_);
end;
else
if (P_RESPOND1 ge 0.10013175230566) then do;
b_RESPOND = 3;
end;
else
if (P_RESPOND1 ge 0.05328917657684) then do;
_temp_ = dmran(1234);
b_RESPOND = floor(4 + 5*_temp_);
end;
else
do;
_temp_ = dmran(1234);
b_RESPOND = floor(9 + 12*_temp_);
end;
