if ROLE in('INPUT', 'REJECTED') then do;
if upcase(NAME) in(
'CATALOGCNT'
'DOLINDET'
'MONLAST'
'TOTORDQ12'
'TOTORDQ18'
'TOTORDQ20'
'TOTORDQ21'
'TOTORDQ22'
) then ROLE='INPUT';
else do;
ROLE='REJECTED';
COMMENT = "Reg: Rejected using forward selection";
end;
end;
