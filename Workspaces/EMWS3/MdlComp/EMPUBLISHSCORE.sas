drop _temp_;
if (P_TargetBuy1 ge 0.80212014134275) then do;
b_TargetBuy = 1;
end;
else
if (P_TargetBuy1 ge 0.61377245508982) then do;
b_TargetBuy = 2;
end;
else
if (P_TargetBuy1 ge 0.46778042959427) then do;
b_TargetBuy = 3;
end;
else
if (P_TargetBuy1 ge 0.43147208121827) then do;
b_TargetBuy = 4;
end;
else
if (P_TargetBuy1 ge 0.34426229508196) then do;
b_TargetBuy = 5;
end;
else
if (P_TargetBuy1 ge 0.30996309963099) then do;
b_TargetBuy = 6;
end;
else
if (P_TargetBuy1 ge 0.21428571428571) then do;
b_TargetBuy = 7;
end;
else
if (P_TargetBuy1 ge 0.20175438596491) then do;
b_TargetBuy = 8;
end;
else
if (P_TargetBuy1 ge 0.18) then do;
b_TargetBuy = 9;
end;
else
if (P_TargetBuy1 ge 0.15710382513661) then do;
_temp_ = dmran(1234);
b_TargetBuy = floor(10 + 2*_temp_);
end;
else
if (P_TargetBuy1 ge 0.12987012987012) then do;
b_TargetBuy = 12;
end;
else
if (P_TargetBuy1 ge 0.1277330264672) then do;
b_TargetBuy = 13;
end;
else
if (P_TargetBuy1 ge 0.09881422924901) then do;
b_TargetBuy = 14;
end;
else
if (P_TargetBuy1 ge 0.05974842767295) then do;
b_TargetBuy = 15;
end;
else
if (P_TargetBuy1 ge 0.05826771653543) then do;
b_TargetBuy = 16;
end;
else
if (P_TargetBuy1 ge 0.0456333595594) then do;
_temp_ = dmran(1234);
b_TargetBuy = floor(17 + 2*_temp_);
end;
else
do;
_temp_ = dmran(1234);
b_TargetBuy = floor(19 + 2*_temp_);
end;
