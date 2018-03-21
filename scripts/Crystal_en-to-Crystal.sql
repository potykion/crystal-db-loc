INSERT INTO Crystal.dbo.SingTabl
(HeadClue, SingType, SingClue)
SELECT HeadClue, SingType, SingClue
from Crystal_en.dbo.SingTabl;

insert into Crystal.dbo.DielDissLanguage 
(HeadClue, SingCode, FreqDiss, Temper_3, TangName, TangentD, ErrDiss, MethodY, Bknumber, LanguageID)
select HeadClue, SingCode, FreqDiss, Temper_3, TangName, TangentD, ErrDiss, MethodY, Bknumber, LanguageID
from Crystal_en.dbo.DielDissLanguage

insert into Crystal.dbo.ElOpTablLanguage 
(HeadClue, SingCode, WvLeng, ZnN1, R, ErrR, MethodR, Bknumber, LanguageID)
select HeadClue, SingCode, WvLeng, ZnN1, R, ErrR, MethodR, Bknumber, LanguageID
from Crystal_en.dbo.ElOpTablLanguage

insert into Crystal.dbo.EsOpTablLanguage 
(HeadClue, SingCode, LengWave, ZnP, P, ErrP, MethodP, Bknumber, LanguageID)
select HeadClue, SingCode, LengWave, ZnP, P, ErrP, MethodP, Bknumber, LanguageID
from Crystal_en.dbo.EsOpTablLanguage

insert into Crystal.dbo.ElemTablNewLanguage 
(HeadClue, SingCode, A, AErr, B, BErr, C, CErr, Alpha, AlphaErr, Beta, BetaErr, Gamma, GammaErr, MethodP, Bknumber, LanguageID)
select HeadClue, SingCode, A, AErr, B, BErr, C, CErr, Alpha, AlphaErr, Beta, BetaErr, Gamma, GammaErr, MethodP, Bknumber, LanguageID
from Crystal_en.dbo.ElemTablNewLanguage

insert into Crystal.dbo.MechTablLanguage 
(HeadClue, SingCode, Bknumber, FreqCons, Temper, ZnK, K, ErrK, MethodK, LanguageID)
select HeadClue, SingCode, Bknumber, FreqCons, Temper, ZnK, K, ErrK, MethodK, LanguageID
from Crystal_en.dbo.MechTablLanguage

insert into Crystal.dbo.NlOpTablLanguage 
(HeadClue, SingCode, Lyambda, ZnR, Rij, ErrRij, MethodR, Bknumber, LanguageID)
select HeadClue, SingCode, Lyambda, ZnR, Rij, ErrRij, MethodR, Bknumber, LanguageID
from Crystal_en.dbo.NlOpTablLanguage

insert into Crystal.dbo.RefrTablLanguage 
(Referat, LanguageID)
select Referat, LanguageID
from Crystal_en.dbo.RefrTablLanguage

insert into Crystal.dbo.Elastic1Language 
(Elastic1ID, LanguageID, MethodE, ZnE)
select Elastic1ID, LanguageID, MethodE, ZnE
from Crystal_en.dbo.Elastic1Language

insert into Crystal.dbo.LastModifiedLanguage 
(Text, LastModified, LanguageID)
select Text, LastModified, LanguageID
from Crystal_en.dbo.LastModifiedLanguage

insert into Crystal.dbo.MnOpTablLanguage 
(MnOpTablID, LanguageID, MethodK)
select MnOpTablID, LanguageID, MethodK
from Crystal_en.dbo.MnOpTablLanguage

insert into Crystal.dbo.GrafTablLanguage 
(HeadClue, NompClue, NameGraf, Signatur, LanguageID)
select HeadClue, NompClue, NameGraf, Signatur, LanguageID
from Crystal_en.dbo.GrafTablLanguage

insert into Crystal.dbo.ModfTablLanguage 
(ModfTablID, LanguageID, SpaceGrp)
select ModfTablID, LanguageID, SpaceGrp
from Crystal_en.dbo.ModfTablLanguage

insert into Crystal.dbo.PlavTablLanguage 
(HeadClue, PlavType, PlavTemp, ErrPlav, Bknumber, LanguageID)
select HeadClue, PlavType, PlavTemp, ErrPlav, Bknumber, LanguageID
from Crystal_en.dbo.PlavTablLanguage

insert into Crystal.dbo.PzElTablLanguage 
(PzElTablID, LanguageID, MethodPz)
select PzElTablID, LanguageID, MethodPz
from Crystal_en.dbo.PzElTablLanguage

insert into Crystal.dbo.RefrcIndLanguage 
(RefrcIndID, LanguageID, MethodIn)
select RefrcIndID, LanguageID, MethodIn
from Crystal_en.dbo.RefrcIndLanguage

insert into Crystal.dbo.DielectrLanguage 
(DielectrID, LanguageID, MethodY, Znak)
select DielectrID, LanguageID, MethodY, Znak
from Crystal_en.dbo.DielectrLanguage

insert into Crystal.dbo.ElemTablLanguage 
(ElemTablID, LanguageID, MethodP)
select ElemTablID, LanguageID, MethodP
from Crystal_en.dbo.ElemTablLanguage

insert into Crystal.dbo.CuryTablLanguage 
(HeadClue, CuryTemp, ErrCury, Oboztran, Bknumber, LanguageID)
select HeadClue, CuryTemp, ErrCury, Oboztran, Bknumber, LanguageID
from Crystal_en.dbo.CuryTablLanguage

insert into Crystal.dbo.HardTablLanguage 
(HeadClue, SingCode, Hard1, Hard2, ErrHard, Mohs, ErrMohs, MethodH, Bknumber, LanguageID)
select HeadClue, SingCode, Hard1, Hard2, ErrHard, Mohs, ErrMohs, MethodH, Bknumber, LanguageID
from Crystal_en.dbo.HardTablLanguage

insert into Crystal.dbo.SuspTablLanguage 
(HeadClue, Temper, SuspName, Suspense, ErrSusp, MethodS, Bknumber, LanguageID)
select HeadClue, Temper, SuspName, Suspense, ErrSusp, MethodS, Bknumber, LanguageID
from Crystal_en.dbo.SuspTablLanguage

insert into Crystal.dbo.PropertiesLanguage 
(PropertiesID, LanguageID, NAZVPROP)
select PropertiesID, LanguageID, NAZVPROP
from Crystal_en.dbo.PropertiesLanguage

insert into Crystal.dbo.DecrTablLanguage 
(HeadClue, SingCode, Nzv, Uzv, WaveType, WaveSpeed, Decrement, DecrFreq, Bknumber, LanguageID)
select HeadClue, SingCode, Nzv, Uzv, WaveType, WaveSpeed, Decrement, DecrFreq, Bknumber, LanguageID
from Crystal_en.dbo.DecrTablLanguage

insert into Crystal.dbo.HeatTablLanguage 
(HeatTablID, LanguageID, MethodC)
select HeatTablID, LanguageID, MethodC
from Crystal_en.dbo.HeatTablLanguage

insert into Crystal.dbo.Properties_ComplexLanguage 
(NAZVPROP, LanguageID)
select NAZVPROP, LanguageID
from Crystal_en.dbo.Properties_ComplexLanguage

insert into Crystal.dbo.HeatExpnLanguage 
(HeadClue, SingCode, DataType, Temper_1, Temper_2, Znak1, S11, ErrHExp, MethodEx, Bknumber, LanguageID)
select HeadClue, SingCode, DataType, Temper_1, Temper_2, Znak1, S11, ErrHExp, MethodEx, Bknumber, LanguageID
from Crystal_en.dbo.HeatExpnLanguage

insert into Crystal.dbo.AcOpTablLanguage 
(AcOpTablID, LanguageID, E, Nsv, Uzv)
select AcOpTablID, LanguageID, E, Nsv, Uzv
from Crystal_en.dbo.AcOpTablLanguage

insert into Crystal.dbo.HeadTablLanguage 
(HeadTablID, LanguageID, Expert, System)
select HeadTablID, LanguageID, Expert, System
from Crystal_en.dbo.HeadTablLanguage

insert into Crystal.dbo.BibliogrLanguage 
(BibliogrID, LanguageID, Authors, Source, Title)
select BibliogrID, LanguageID, Authors, Source, Title
from Crystal_en.dbo.BibliogrLanguage

insert into Crystal.dbo.DensTablLanguage 
(HeadClue, SingCode, Density, ErrDens, MethodD, Bknumber, LanguageID)
select HeadClue, SingCode, Density, ErrDens, MethodD, Bknumber, LanguageID
from Crystal_en.dbo.DensTablLanguage

insert into Crystal.dbo.ConstSelLanguage 
(ConstSelID, LanguageID, Measure)
select ConstSelID, LanguageID, Measure
from Crystal_en.dbo.ConstSelLanguage

