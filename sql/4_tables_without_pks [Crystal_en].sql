use Crystal_en;
GO
insert into Crystal.dbo.AcOpTabl
(HeadClue, SingCode, WaveLeng, Nzv, Uzv, Nsv, E, M1, M2, M3, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), WaveLeng, Nzv, Uzv, Nsv, E, M1, M2, M3, Bknumber, LanguageID
from Crystal_en.dbo.AcOpTabl;

insert into Crystal.dbo.ConstSel
(HeadClue, SingCode, Equation, NazvSel, ZnachSel, Measure, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), Equation, NazvSel, ZnachSel, Measure, Bknumber, LanguageID
from Crystal_en.dbo.ConstSel;

insert into Crystal.dbo.CuryTabl
(HeadClue, CuryTemp, ErrCury, Oboztran, Bknumber, LanguageID)
select 
HeadClue, CuryTemp, ErrCury, Oboztran, Bknumber, LanguageID
from Crystal_en.dbo.CuryTabl;

insert into Crystal.dbo.DecrTabl
(HeadClue, SingCode, Nzv, Uzv, WaveType, WaveSpeed, Decrement, DecrFreq, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), Nzv, Uzv, WaveType, WaveSpeed, Decrement, DecrFreq, Bknumber, LanguageID
from Crystal_en.dbo.DecrTabl;

insert into Crystal.dbo.DensTabl
(HeadClue, SingCode, Density, ErrDens, MethodD, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), Density, ErrDens, MethodD, Bknumber, LanguageID
from Crystal_en.dbo.DensTabl;

insert into Crystal.dbo.DielDiss
(HeadClue, SingCode, FreqDiss, Temper_3, TangName, TangentD, ErrDiss, MethodY, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), FreqDiss, Temper_3, TangName, TangentD, ErrDiss, MethodY, Bknumber, LanguageID
from Crystal_en.dbo.DielDiss;

insert into Crystal.dbo.Dielectr
(HeadClue, SingCode, FreqDiel, Temper_2, Constant, Znak, Diel, ErrY, MethodY, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), FreqDiel, Temper_2, Constant, Znak, Diel, ErrY, MethodY, Bknumber, LanguageID
from Crystal_en.dbo.Dielectr;

insert into Crystal.dbo.Elastic1
(HeadClue, SingCode, TemperEl, CondClu1, ZnE, E1, ErrE, MethodE, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), TemperEl, CondClu1, ZnE, E1, ErrE, MethodE, Bknumber, LanguageID
from Crystal_en.dbo.Elastic1;

insert into Crystal.dbo.ElemTabl
(HeadClue, SingCode, Nazbparam, Znparam, Errparam, NazvAngl, ZnAngle, ErrAngl, MethodP, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), Nazbparam, Znparam, Errparam, NazvAngl, ZnAngle, ErrAngl, MethodP, Bknumber, LanguageID
from Crystal_en.dbo.ElemTabl;

insert into Crystal.dbo.ElOpTabl
(HeadClue, SingCode, WvLeng, ZnN1, R, ErrR, MethodR, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), WvLeng, ZnN1, R, ErrR, MethodR, Bknumber, LanguageID
from Crystal_en.dbo.ElOpTabl;

insert into Crystal.dbo.EsOpTabl
(HeadClue, SingCode, LengWave, ZnP, P, ErrP, MethodP, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), LengWave, ZnP, P, ErrP, MethodP, Bknumber, LanguageID
from Crystal_en.dbo.EsOpTabl;

insert into Crystal.dbo.GrafTabl
(HeadClue, NompClue, NameGraf, Signatur, LanguageID)
select 
HeadClue, NompClue, NameGraf, Signatur, LanguageID
from Crystal_en.dbo.GrafTabl;

insert into Crystal.dbo.HardTabl
(HeadClue, SingCode, Hard1, Hard2, ErrHard, Mohs, ErrMohs, MethodH, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), Hard1, Hard2, ErrHard, Mohs, ErrMohs, MethodH, Bknumber, LanguageID
from Crystal_en.dbo.HardTabl;

insert into Crystal.dbo.HeatExpn
(HeadClue, SingCode, DataType, Temper_1, Temper_2, Znak1, S11, ErrHExp, MethodEx, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), DataType, Temper_1, Temper_2, Znak1, S11, ErrHExp, MethodEx, Bknumber, LanguageID
from Crystal_en.dbo.HeatExpn;

insert into Crystal.dbo.HeatTabl
(HeadClue, Temperat, ZnC, C, ErrC, MethodC, Bknumber, LanguageID)
select 
HeadClue, Temperat, ZnC, C, ErrC, MethodC, Bknumber, LanguageID
from Crystal_en.dbo.HeatTabl;

insert into Crystal.dbo.LastModified
(Text, LastModified, LanguageID)
select 
Text, LastModified, LanguageID
from Crystal_en.dbo.LastModified;

insert into Crystal.dbo.MechTabl
(HeadClue, SingCode, Bknumber, FreqCons, Temper, ZnK, K, ErrK, MethodK, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), Bknumber, FreqCons, Temper, ZnK, K, ErrK, MethodK, LanguageID
from Crystal_en.dbo.MechTabl;

insert into Crystal.dbo.MnOpTabl
(HeadClue, SingCode, Lyambda, Nw, N2w, Znakcon, K, ErrKj, MethodK, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), Lyambda, Nw, N2w, Znakcon, K, ErrKj, MethodK, Bknumber, LanguageID
from Crystal_en.dbo.MnOpTabl;

insert into Crystal.dbo.ModfTabl
(HeadClue, SingCode, SuprTemp, SP2, ErrSupr, PointGrp, SpaceGrp, Z, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), SuprTemp, SP2, ErrSupr, PointGrp, SpaceGrp, Z, Bknumber, LanguageID
from Crystal_en.dbo.ModfTabl;

insert into Crystal.dbo.NlOpTabl
(HeadClue, SingCode, Lyambda, ZnR, Rij, ErrRij, MethodR, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), Lyambda, ZnR, Rij, ErrRij, MethodR, Bknumber, LanguageID
from Crystal_en.dbo.NlOpTabl;

insert into Crystal.dbo.PlavTabl
(HeadClue, PlavType, PlavTemp, ErrPlav, Bknumber, LanguageID)
select 
HeadClue, PlavType, PlavTemp, ErrPlav, Bknumber, LanguageID
from Crystal_en.dbo.PlavTabl;

insert into Crystal.dbo.PzElTabl
(HeadClue, SingCode, FreqPzEl, ConstD, D, ErrD, MethodPz, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), FreqPzEl, ConstD, D, ErrD, MethodPz, Bknumber, LanguageID
from Crystal_en.dbo.PzElTabl;

insert into Crystal.dbo.RefrcInd
(HeadClue, SingCode, Temper, WaveLeng, NazbIndx, ZnachInd, ErrIndex, MethodIn, Bknumber, LanguageID)
select 
HeadClue, SingCode = (case SingCode 
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), Temper, WaveLeng, NazbIndx, ZnachInd, ErrIndex, MethodIn, Bknumber, LanguageID
from Crystal_en.dbo.RefrcInd;

insert into Crystal.dbo.SuspTabl
(HeadClue, Temper, SuspName, Suspense, ErrSusp, MethodS, Bknumber, LanguageID)
select 
HeadClue, Temper, SuspName, Suspense, ErrSusp, MethodS, Bknumber, LanguageID
from Crystal_en.dbo.SuspTabl;

insert into Crystal.dbo.RefrTabl
(HeadClue, Referat, LanguageID)
select 
HeadClue, Referat, LanguageID
from Crystal_en.dbo.RefrTabl;

