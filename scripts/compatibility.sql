use Crystal;
GO
CREATE VIEW dbo.AcOpTabl
WITH SCHEMABINDING
AS select E, Nsv, Uzv, HeadClue, SingCode, WaveLeng, Nzv, M1, M2, M3, Bknumber, AcOpTablInvariant.ID
from dbo.AcOpTablLanguage
join dbo.AcOpTablInvariant on
AcOpTablLanguage.AcOpTablID = AcOpTablInvariant.ID
where LanguageID = 1
GO
CREATE VIEW dbo.HeadTabl
WITH SCHEMABINDING
AS select Expert, System, Help, Class, HeadTablInvariant.HeadClue
from dbo.HeadTablLanguage
join dbo.HeadTablInvariant on
HeadTablLanguage.HeadTablID = HeadTablInvariant.HeadClue
where LanguageID = 1
GO
CREATE VIEW dbo.Bibliogr
WITH SCHEMABINDING
AS select Authors, Source, Title, DOI, BibliogrInvariant.Bknumber
from dbo.BibliogrLanguage
join dbo.BibliogrInvariant on
BibliogrLanguage.BibliogrID = BibliogrInvariant.Bknumber
where LanguageID = 1
GO
CREATE VIEW dbo.ConstSel
WITH SCHEMABINDING
AS select Measure, HeadClue, SingCode, Equation, NazvSel, ZnachSel, Bknumber, ConstSelInvariant.ID
from dbo.ConstSelLanguage
join dbo.ConstSelInvariant on
ConstSelLanguage.ConstSelID = ConstSelInvariant.ID
where LanguageID = 1
GO
CREATE VIEW dbo.DielDiss
WITH SCHEMABINDING
AS select HeadClue, SingCode, FreqDiss, Temper_3, TangName, TangentD, ErrDiss, MethodY, Bknumber, __MethodY, ID
from dbo.DielDissLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.ElOpTabl
WITH SCHEMABINDING
AS select HeadClue, SingCode, WvLeng, ZnN1, R, ErrR, MethodR, Bknumber, __MethodR, ID
from dbo.ElOpTablLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.EsOpTabl
WITH SCHEMABINDING
AS select HeadClue, SingCode, LengWave, ZnP, P, ErrP, MethodP, Bknumber, __MethodP, ID
from dbo.EsOpTablLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.ElemTablNew
WITH SCHEMABINDING
AS select HeadClue, SingCode, A, AErr, B, BErr, C, CErr, Alpha, AlphaErr, Beta, BetaErr, Gamma, GammaErr, MethodP, Bknumber, __MethodP, ID
from dbo.ElemTablNewLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.MechTabl
WITH SCHEMABINDING
AS select HeadClue, SingCode, Bknumber, FreqCons, Temper, ZnK, K, ErrK, MethodK, __MethodK, ID
from dbo.MechTablLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.NlOpTabl
WITH SCHEMABINDING
AS select HeadClue, SingCode, Lyambda, ZnR, Rij, ErrRij, MethodR, Bknumber, __MethodR, ID
from dbo.NlOpTablLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.RefrTabl
WITH SCHEMABINDING
AS select HeadClue, Referat
from dbo.RefrTablLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.stModified
WITH SCHEMABINDING
AS select Text, LastModified, ID
from dbo.LastModifiedLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.GrafTabl
WITH SCHEMABINDING
AS select HeadClue, NompClue, NameGraf, Signatur, ID
from dbo.GrafTablLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.PlavTabl
WITH SCHEMABINDING
AS select HeadClue, PlavType, PlavTemp, ErrPlav, Bknumber, ID
from dbo.PlavTablLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.Elastic1
WITH SCHEMABINDING
AS select ID, Elastic1ID, MethodE, ZnE, __MethodE
from dbo.Elastic1Language
where LanguageId = 1
GO
CREATE VIEW dbo.MnOpTabl
WITH SCHEMABINDING
AS select ID, MnOpTablID, MethodK, __MethodK
from dbo.MnOpTablLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.CuryTabl
WITH SCHEMABINDING
AS select HeadClue, CuryTemp, ErrCury, Oboztran, Bknumber, ID
from dbo.CuryTablLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.ModfTabl
WITH SCHEMABINDING
AS select ID, ModfTablID, SpaceGrp
from dbo.ModfTablLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.HardTabl
WITH SCHEMABINDING
AS select HeadClue, SingCode, Hard1, Hard2, ErrHard, Mohs, ErrMohs, MethodH, Bknumber, __MethodH, ID
from dbo.HardTablLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.SuspTabl
WITH SCHEMABINDING
AS select HeadClue, Temper, SuspName, Suspense, ErrSusp, MethodS, Bknumber, __MethodS, ID
from dbo.SuspTablLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.PzElTabl
WITH SCHEMABINDING
AS select ID, PzElTablID, MethodPz, __MethodPz
from dbo.PzElTablLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.RefrcInd
WITH SCHEMABINDING
AS select ID, RefrcIndID, MethodIn, __MethodIn
from dbo.RefrcIndLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.DecrTabl
WITH SCHEMABINDING
AS select HeadClue, SingCode, Nzv, Uzv, WaveType, WaveSpeed, Decrement, DecrFreq, Bknumber, ID
from dbo.DecrTablLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.Properties_Complex
WITH SCHEMABINDING
AS select NOMPROP, NAZVPROP
from dbo.Properties_ComplexLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.Dielectr
WITH SCHEMABINDING
AS select ID, DielectrID, MethodY, Znak, __MethodY
from dbo.DielectrLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.HeatExp
WITH SCHEMABINDING
AS select HeadClue, SingCode, DataType, Temper_1, Temper_2, Znak1, S11, ErrHExp, MethodEx, Bknumber, __MethodEx, ID
from dbo.HeatExpnLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.ElemTabl
WITH SCHEMABINDING
AS select ID, ElemTablID, MethodP, __MethodP
from dbo.ElemTablLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.Properties
WITH SCHEMABINDING
AS select ID, PropertiesID, NAZVPROP
from dbo.PropertiesLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.HeatTabl
WITH SCHEMABINDING
AS select ID, HeatTablID, MethodC, __MethodC
from dbo.HeatTablLanguage
where LanguageId = 1
GO
CREATE VIEW dbo.DensTabl
WITH SCHEMABINDING
AS select HeadClue, SingCode, Density, ErrDens, MethodD, Bknumber, __MethodD, ID
from dbo.DensTablLanguage
where LanguageId = 1
GO
