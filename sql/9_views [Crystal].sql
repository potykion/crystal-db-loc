use Crystal;
GO
CREATE VIEW dbo.AcOpTabl
WITH SCHEMABINDING
AS select E, Nsv, Uzv, HeadClue, SingCode, WaveLeng, Nzv, M1, M2, M3, Bknumber, AcOpTablInvariant.ID
from dbo.AcOpTablInvariant
left outer join dbo.AcOpTablLanguage on
AcOpTablLanguage.AcOpTablID = AcOpTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.Bibliogr
WITH SCHEMABINDING
AS select Authors, Source, Title, DOI, BibliogrInvariant.Bknumber
from dbo.BibliogrInvariant
left outer join dbo.BibliogrLanguage on
BibliogrLanguage.BibliogrID = BibliogrInvariant.Bknumber
where LanguageID = 1
go
CREATE VIEW dbo.ConstSel
WITH SCHEMABINDING
AS select Measure, HeadClue, SingCode, Equation, NazvSel, ZnachSel, Bknumber, ConstSelInvariant.ID
from dbo.ConstSelInvariant
left outer join dbo.ConstSelLanguage on
ConstSelLanguage.ConstSelID = ConstSelInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.CuryTabl
WITH SCHEMABINDING
AS select Oboztran, HeadClue, CuryTemp, ErrCury, Bknumber, CuryTablInvariant.ID
from dbo.CuryTablInvariant
left outer join dbo.CuryTablLanguage on
CuryTablLanguage.CuryTablID = CuryTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.DecrTabl
WITH SCHEMABINDING
AS select Nzv, Uzv, WaveType, HeadClue, SingCode, WaveSpeed, Decrement, DecrFreq, Bknumber, DecrTablInvariant.ID
from dbo.DecrTablInvariant
left outer join dbo.DecrTablLanguage on
DecrTablLanguage.DecrTablID = DecrTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.DensTabl
WITH SCHEMABINDING
AS select MethodD, __MethodD, HeadClue, SingCode, Density, ErrDens, Bknumber, DensTablInvariant.ID
from dbo.DensTablInvariant
left outer join dbo.DensTablLanguage on
DensTablLanguage.DensTablID = DensTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.DielDiss
WITH SCHEMABINDING
AS select MethodY, TangName, __MethodY, HeadClue, SingCode, FreqDiss, Temper_3, TangentD, ErrDiss, Bknumber, DielDissInvariant.ID
from dbo.DielDissInvariant
left outer join dbo.DielDissLanguage on
DielDissLanguage.DielDissID = DielDissInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.Dielectr
WITH SCHEMABINDING
AS select MethodY, Znak, __MethodY, HeadClue, SingCode, FreqDiel, Temper_2, Constant, Diel, ErrY, Bknumber, DielectrInvariant.ID
from dbo.DielectrInvariant
left outer join dbo.DielectrLanguage on
DielectrLanguage.DielectrID = DielectrInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.Elastic1
WITH SCHEMABINDING
AS select MethodE, ZnE, __MethodE, HeadClue, SingCode, TemperEl, CondClu1, E1, ErrE, Bknumber, Elastic1Invariant.ID
from dbo.Elastic1Invariant
left outer join dbo.Elastic1Language on
Elastic1Language.Elastic1ID = Elastic1Invariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.ElemTabl
WITH SCHEMABINDING
AS select MethodP, Nazbparam, __MethodP, HeadClue, SingCode, Znparam, Errparam, NazvAngl, ZnAngle, ErrAngl, Bknumber, ElemTablInvariant.ID
from dbo.ElemTablInvariant
left outer join dbo.ElemTablLanguage on
ElemTablLanguage.ElemTablID = ElemTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.ElemTablNew
WITH SCHEMABINDING
AS select MethodP, __MethodP, HeadClue, SingCode, A, AErr, B, BErr, C, CErr, Alpha, AlphaErr, Beta, BetaErr, Gamma, GammaErr, Bknumber, ElemTablNewInvariant.ID
from dbo.ElemTablNewInvariant
left outer join dbo.ElemTablNewLanguage on
ElemTablNewLanguage.ElemTablNewID = ElemTablNewInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.ElOpTabl
WITH SCHEMABINDING
AS select MethodR, ZnN1, __MethodR, HeadClue, SingCode, WvLeng, R, ErrR, Bknumber, ElOpTablInvariant.ID
from dbo.ElOpTablInvariant
left outer join dbo.ElOpTablLanguage on
ElOpTablLanguage.ElOpTablID = ElOpTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.EsOpTabl
WITH SCHEMABINDING
AS select MethodP, ZnP, __MethodP, HeadClue, SingCode, LengWave, P, ErrP, Bknumber, EsOpTablInvariant.ID
from dbo.EsOpTablInvariant
left outer join dbo.EsOpTablLanguage on
EsOpTablLanguage.EsOpTablID = EsOpTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.GrafTabl
WITH SCHEMABINDING
AS select NameGraf, Signatur, HeadClue, NompClue, GrafTablInvariant.ID
from dbo.GrafTablInvariant
left outer join dbo.GrafTablLanguage on
GrafTablLanguage.GrafTablID = GrafTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.HardTabl
WITH SCHEMABINDING
AS select MethodH, __MethodH, HeadClue, SingCode, Hard1, Hard2, ErrHard, Mohs, ErrMohs, Bknumber, HardTablInvariant.ID
from dbo.HardTablInvariant
left outer join dbo.HardTablLanguage on
HardTablLanguage.HardTablID = HardTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.HeadTabl
WITH SCHEMABINDING
AS select Expert, System, Help, Class, HeadTablInvariant.HeadClue
from dbo.HeadTablInvariant
left outer join dbo.HeadTablLanguage on
HeadTablLanguage.HeadTablID = HeadTablInvariant.HeadClue
where LanguageID = 1
go
CREATE VIEW dbo.HeatExpn
WITH SCHEMABINDING
AS select MethodEx, Znak1, __MethodEx, HeadClue, SingCode, DataType, Temper_1, Temper_2, S11, ErrHExp, Bknumber, HeatExpnInvariant.ID
from dbo.HeatExpnInvariant
left outer join dbo.HeatExpnLanguage on
HeatExpnLanguage.HeatExpnID = HeatExpnInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.HeatTabl
WITH SCHEMABINDING
AS select MethodC, __MethodC, HeadClue, Temperat, ZnC, C, ErrC, Bknumber, HeatTablInvariant.ID
from dbo.HeatTablInvariant
left outer join dbo.HeatTablLanguage on
HeatTablLanguage.HeatTablID = HeatTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.LastModified
WITH SCHEMABINDING
AS select Text, LastModified, LastModifiedInvariant.ID
from dbo.LastModifiedInvariant
left outer join dbo.LastModifiedLanguage on
LastModifiedLanguage.LastModifiedID = LastModifiedInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.MechTabl
WITH SCHEMABINDING
AS select MethodK, ZnK, __MethodK, HeadClue, SingCode, Bknumber, FreqCons, Temper, K, ErrK, MechTablInvariant.ID
from dbo.MechTablInvariant
left outer join dbo.MechTablLanguage on
MechTablLanguage.MechTablID = MechTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.MnOpTabl
WITH SCHEMABINDING
AS select MethodK, __MethodK, HeadClue, SingCode, Lyambda, Nw, N2w, Znakcon, K, ErrKj, Bknumber, MnOpTablInvariant.ID
from dbo.MnOpTablInvariant
left outer join dbo.MnOpTablLanguage on
MnOpTablLanguage.MnOpTablID = MnOpTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.ModfTabl
WITH SCHEMABINDING
AS select SpaceGrp, HeadClue, SingCode, SuprTemp, SP2, ErrSupr, PointGrp, Z, Bknumber, ModfTablInvariant.ID
from dbo.ModfTablInvariant
left outer join dbo.ModfTablLanguage on
ModfTablLanguage.ModfTablID = ModfTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.NlOpTabl
WITH SCHEMABINDING
AS select MethodR, ZnR, __MethodR, HeadClue, SingCode, Lyambda, Rij, ErrRij, Bknumber, NlOpTablInvariant.ID
from dbo.NlOpTablInvariant
left outer join dbo.NlOpTablLanguage on
NlOpTablLanguage.NlOpTablID = NlOpTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.PlavTabl
WITH SCHEMABINDING
AS select PlavType, HeadClue, PlavTemp, ErrPlav, Bknumber, PlavTablInvariant.ID
from dbo.PlavTablInvariant
left outer join dbo.PlavTablLanguage on
PlavTablLanguage.PlavTablID = PlavTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.Properties
WITH SCHEMABINDING
AS select NAZVPROP, HTML, TableName, PropertiesInvariant.NOMPROP
from dbo.PropertiesInvariant
left outer join dbo.PropertiesLanguage on
PropertiesLanguage.PropertiesID = PropertiesInvariant.NOMPROP
where LanguageID = 1
go
CREATE VIEW dbo.PzElTabl
WITH SCHEMABINDING
AS select MethodPz, __MethodPz, HeadClue, SingCode, FreqPzEl, ConstD, D, ErrD, Bknumber, PzElTablInvariant.ID
from dbo.PzElTablInvariant
left outer join dbo.PzElTablLanguage on
PzElTablLanguage.PzElTablID = PzElTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.RefrcInd
WITH SCHEMABINDING
AS select MethodIn, __MethodIn, HeadClue, SingCode, Temper, WaveLeng, NazbIndx, ZnachInd, ErrIndex, Bknumber, RefrcIndInvariant.ID
from dbo.RefrcIndInvariant
left outer join dbo.RefrcIndLanguage on
RefrcIndLanguage.RefrcIndID = RefrcIndInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.SuspTabl
WITH SCHEMABINDING
AS select MethodS, SuspName, __MethodS, HeadClue, Temper, Suspense, ErrSusp, Bknumber, SuspTablInvariant.ID
from dbo.SuspTablInvariant
left outer join dbo.SuspTablLanguage on
SuspTablLanguage.SuspTablID = SuspTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.RefrTabl
WITH SCHEMABINDING
AS select HeadClue, Referat, ID
from dbo.RefrTablLanguage
where LanguageId = 1
go
DROP VIEW [dbo].[HeatExpn2]
GO
CREATE VIEW [dbo].[HeatExpn2] AS
Select * FROM HeatExpn
GO
