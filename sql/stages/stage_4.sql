use Crystal_en;
GO

insert into Crystal.dbo.BibliogrLanguage
(BibliogrID, LanguageID, Authors, Source, Title)
select
BibliogrID, LanguageID, Authors, Source, Title
from Crystal_en.dbo.BibliogrLanguage
where BibliogrID in (SELECT BibliogrID
FROM Crystal.dbo.BibliogrLanguage)
;
insert into Crystal.dbo.ElemTablNewLanguage
(ElemTablNewID, LanguageID, MethodP)
select
ElemTablNewID, LanguageID, MethodP
from Crystal_en.dbo.ElemTablNewLanguage
;
insert into Crystal.dbo.HeadTablLanguage
(HeadTablID, LanguageID, Expert)
select
HeadTablID, LanguageID, Expert
from Crystal_en.dbo.HeadTablLanguage
;
insert into Crystal.dbo.PropertiesLanguage
(PropertiesID, LanguageID, NAZVPROP)
select
PropertiesID, LanguageID, NAZVPROP
from Crystal_en.dbo.PropertiesLanguage
;
use Crystal;
GO

SELECT t2.ID as OldID, t1.MinID as NewID
INTO AcOpTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, WaveLeng, Nzv, M1, M2, M3, Bknumber
   FROM AcOpTablInvariant
   GROUP BY HeadClue, SingCode, WaveLeng, Nzv, M1, M2, M3, Bknumber) t1
INNER JOIN
  AcOpTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.WaveLeng = t2.WaveLeng or t1.WaveLeng is NULL and t2.WaveLeng is NULL) and
(t1.Nzv = t2.Nzv or t1.Nzv is NULL and t2.Nzv is NULL) and
(t1.M1 = t2.M1 or t1.M1 is NULL and t2.M1 is NULL) and
(t1.M2 = t2.M2 or t1.M2 is NULL and t2.M2 is NULL) and
(t1.M3 = t2.M3 or t1.M3 is NULL and t2.M3 is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE AcOpTablLanguage
SET AcOpTablLanguage.AcOpTablID = NewID
FROM AcOpTablLanguage
INNER JOIN AcOpTablInvariantUniqueIdMapping U
ON AcOpTablLanguage.AcOpTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM AcOpTablInvariant
WHERE AcOpTablInvariant.ID Not IN
(SELECT NewID FROM AcOpTablInvariantUniqueIdMapping);
GO

drop table AcOpTablInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO ConstSelInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, Equation, NazvSel, ZnachSel, Bknumber
   FROM ConstSelInvariant
   GROUP BY HeadClue, SingCode, Equation, NazvSel, ZnachSel, Bknumber) t1
INNER JOIN
  ConstSelInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.Equation = t2.Equation or t1.Equation is NULL and t2.Equation is NULL) and
(t1.NazvSel = t2.NazvSel or t1.NazvSel is NULL and t2.NazvSel is NULL) and
(t1.ZnachSel = t2.ZnachSel or t1.ZnachSel is NULL and t2.ZnachSel is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE ConstSelLanguage
SET ConstSelLanguage.ConstSelID = NewID
FROM ConstSelLanguage
INNER JOIN ConstSelInvariantUniqueIdMapping U
ON ConstSelLanguage.ConstSelID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM ConstSelInvariant
WHERE ConstSelInvariant.ID Not IN
(SELECT NewID FROM ConstSelInvariantUniqueIdMapping);
GO

drop table ConstSelInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO CuryTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, CuryTemp, ErrCury, Bknumber
   FROM CuryTablInvariant
   GROUP BY HeadClue, CuryTemp, ErrCury, Bknumber) t1
INNER JOIN
  CuryTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.CuryTemp = t2.CuryTemp or t1.CuryTemp is NULL and t2.CuryTemp is NULL) and
(t1.ErrCury = t2.ErrCury or t1.ErrCury is NULL and t2.ErrCury is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE CuryTablLanguage
SET CuryTablLanguage.CuryTablID = NewID
FROM CuryTablLanguage
INNER JOIN CuryTablInvariantUniqueIdMapping U
ON CuryTablLanguage.CuryTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM CuryTablInvariant
WHERE CuryTablInvariant.ID Not IN
(SELECT NewID FROM CuryTablInvariantUniqueIdMapping);
GO

drop table CuryTablInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO DecrTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, WaveSpeed, Decrement, DecrFreq, Bknumber
   FROM DecrTablInvariant
   GROUP BY HeadClue, SingCode, WaveSpeed, Decrement, DecrFreq, Bknumber) t1
INNER JOIN
  DecrTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.WaveSpeed = t2.WaveSpeed or t1.WaveSpeed is NULL and t2.WaveSpeed is NULL) and
(t1.Decrement = t2.Decrement or t1.Decrement is NULL and t2.Decrement is NULL) and
(t1.DecrFreq = t2.DecrFreq or t1.DecrFreq is NULL and t2.DecrFreq is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE DecrTablLanguage
SET DecrTablLanguage.DecrTablID = NewID
FROM DecrTablLanguage
INNER JOIN DecrTablInvariantUniqueIdMapping U
ON DecrTablLanguage.DecrTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM DecrTablInvariant
WHERE DecrTablInvariant.ID Not IN
(SELECT NewID FROM DecrTablInvariantUniqueIdMapping);
GO

drop table DecrTablInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO DensTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, Density, ErrDens, Bknumber
   FROM DensTablInvariant
   GROUP BY HeadClue, SingCode, Density, ErrDens, Bknumber) t1
INNER JOIN
  DensTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.Density = t2.Density or t1.Density is NULL and t2.Density is NULL) and
(t1.ErrDens = t2.ErrDens or t1.ErrDens is NULL and t2.ErrDens is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE DensTablLanguage
SET DensTablLanguage.DensTablID = NewID
FROM DensTablLanguage
INNER JOIN DensTablInvariantUniqueIdMapping U
ON DensTablLanguage.DensTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM DensTablInvariant
WHERE DensTablInvariant.ID Not IN
(SELECT NewID FROM DensTablInvariantUniqueIdMapping);
GO

drop table DensTablInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO DielDissInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, FreqDiss, Temper_3, TangentD, ErrDiss, Bknumber
   FROM DielDissInvariant
   GROUP BY HeadClue, SingCode, FreqDiss, Temper_3, TangentD, ErrDiss, Bknumber) t1
INNER JOIN
  DielDissInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.FreqDiss = t2.FreqDiss or t1.FreqDiss is NULL and t2.FreqDiss is NULL) and
(t1.Temper_3 = t2.Temper_3 or t1.Temper_3 is NULL and t2.Temper_3 is NULL) and
(t1.TangentD = t2.TangentD or t1.TangentD is NULL and t2.TangentD is NULL) and
(t1.ErrDiss = t2.ErrDiss or t1.ErrDiss is NULL and t2.ErrDiss is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE DielDissLanguage
SET DielDissLanguage.DielDissID = NewID
FROM DielDissLanguage
INNER JOIN DielDissInvariantUniqueIdMapping U
ON DielDissLanguage.DielDissID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM DielDissInvariant
WHERE DielDissInvariant.ID Not IN
(SELECT NewID FROM DielDissInvariantUniqueIdMapping);
GO

drop table DielDissInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO DielectrInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, FreqDiel, Temper_2, Constant, Diel, ErrY, Bknumber
   FROM DielectrInvariant
   GROUP BY HeadClue, SingCode, FreqDiel, Temper_2, Constant, Diel, ErrY, Bknumber) t1
INNER JOIN
  DielectrInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.FreqDiel = t2.FreqDiel or t1.FreqDiel is NULL and t2.FreqDiel is NULL) and
(t1.Temper_2 = t2.Temper_2 or t1.Temper_2 is NULL and t2.Temper_2 is NULL) and
(t1.Constant = t2.Constant or t1.Constant is NULL and t2.Constant is NULL) and
(t1.Diel = t2.Diel or t1.Diel is NULL and t2.Diel is NULL) and
(t1.ErrY = t2.ErrY or t1.ErrY is NULL and t2.ErrY is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE DielectrLanguage
SET DielectrLanguage.DielectrID = NewID
FROM DielectrLanguage
INNER JOIN DielectrInvariantUniqueIdMapping U
ON DielectrLanguage.DielectrID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM DielectrInvariant
WHERE DielectrInvariant.ID Not IN
(SELECT NewID FROM DielectrInvariantUniqueIdMapping);
GO

drop table DielectrInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO Elastic1InvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, TemperEl, CondClu1, E1, ErrE, Bknumber
   FROM Elastic1Invariant
   GROUP BY HeadClue, SingCode, TemperEl, CondClu1, E1, ErrE, Bknumber) t1
INNER JOIN
  Elastic1Invariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.TemperEl = t2.TemperEl or t1.TemperEl is NULL and t2.TemperEl is NULL) and
(t1.CondClu1 = t2.CondClu1 or t1.CondClu1 is NULL and t2.CondClu1 is NULL) and
(t1.E1 = t2.E1 or t1.E1 is NULL and t2.E1 is NULL) and
(t1.ErrE = t2.ErrE or t1.ErrE is NULL and t2.ErrE is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE Elastic1Language
SET Elastic1Language.Elastic1ID = NewID
FROM Elastic1Language
INNER JOIN Elastic1InvariantUniqueIdMapping U
ON Elastic1Language.Elastic1ID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM Elastic1Invariant
WHERE Elastic1Invariant.ID Not IN
(SELECT NewID FROM Elastic1InvariantUniqueIdMapping);
GO

drop table Elastic1InvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO ElemTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, Znparam, Errparam, NazvAngl, ZnAngle, ErrAngl, Bknumber
   FROM ElemTablInvariant
   GROUP BY HeadClue, SingCode, Znparam, Errparam, NazvAngl, ZnAngle, ErrAngl, Bknumber) t1
INNER JOIN
  ElemTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.Znparam = t2.Znparam or t1.Znparam is NULL and t2.Znparam is NULL) and
(t1.Errparam = t2.Errparam or t1.Errparam is NULL and t2.Errparam is NULL) and
(t1.NazvAngl = t2.NazvAngl or t1.NazvAngl is NULL and t2.NazvAngl is NULL) and
(t1.ZnAngle = t2.ZnAngle or t1.ZnAngle is NULL and t2.ZnAngle is NULL) and
(t1.ErrAngl = t2.ErrAngl or t1.ErrAngl is NULL and t2.ErrAngl is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE ElemTablLanguage
SET ElemTablLanguage.ElemTablID = NewID
FROM ElemTablLanguage
INNER JOIN ElemTablInvariantUniqueIdMapping U
ON ElemTablLanguage.ElemTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM ElemTablInvariant
WHERE ElemTablInvariant.ID Not IN
(SELECT NewID FROM ElemTablInvariantUniqueIdMapping);
GO

drop table ElemTablInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO ElemTablNewInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, A, AErr, B, BErr, C, CErr, Alpha, AlphaErr, Beta, BetaErr, Gamma, GammaErr, Bknumber
   FROM ElemTablNewInvariant
   GROUP BY HeadClue, SingCode, A, AErr, B, BErr, C, CErr, Alpha, AlphaErr, Beta, BetaErr, Gamma, GammaErr, Bknumber) t1
INNER JOIN
  ElemTablNewInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.A = t2.A or t1.A is NULL and t2.A is NULL) and
(t1.AErr = t2.AErr or t1.AErr is NULL and t2.AErr is NULL) and
(t1.B = t2.B or t1.B is NULL and t2.B is NULL) and
(t1.BErr = t2.BErr or t1.BErr is NULL and t2.BErr is NULL) and
(t1.C = t2.C or t1.C is NULL and t2.C is NULL) and
(t1.CErr = t2.CErr or t1.CErr is NULL and t2.CErr is NULL) and
(t1.Alpha = t2.Alpha or t1.Alpha is NULL and t2.Alpha is NULL) and
(t1.AlphaErr = t2.AlphaErr or t1.AlphaErr is NULL and t2.AlphaErr is NULL) and
(t1.Beta = t2.Beta or t1.Beta is NULL and t2.Beta is NULL) and
(t1.BetaErr = t2.BetaErr or t1.BetaErr is NULL and t2.BetaErr is NULL) and
(t1.Gamma = t2.Gamma or t1.Gamma is NULL and t2.Gamma is NULL) and
(t1.GammaErr = t2.GammaErr or t1.GammaErr is NULL and t2.GammaErr is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE ElemTablNewLanguage
SET ElemTablNewLanguage.ElemTablNewID = NewID
FROM ElemTablNewLanguage
INNER JOIN ElemTablNewInvariantUniqueIdMapping U
ON ElemTablNewLanguage.ElemTablNewID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM ElemTablNewInvariant
WHERE ElemTablNewInvariant.ID Not IN
(SELECT NewID FROM ElemTablNewInvariantUniqueIdMapping);
GO

drop table ElemTablNewInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO ElOpTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, WvLeng, R, ErrR, Bknumber
   FROM ElOpTablInvariant
   GROUP BY HeadClue, SingCode, WvLeng, R, ErrR, Bknumber) t1
INNER JOIN
  ElOpTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.WvLeng = t2.WvLeng or t1.WvLeng is NULL and t2.WvLeng is NULL) and
(t1.R = t2.R or t1.R is NULL and t2.R is NULL) and
(t1.ErrR = t2.ErrR or t1.ErrR is NULL and t2.ErrR is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE ElOpTablLanguage
SET ElOpTablLanguage.ElOpTablID = NewID
FROM ElOpTablLanguage
INNER JOIN ElOpTablInvariantUniqueIdMapping U
ON ElOpTablLanguage.ElOpTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM ElOpTablInvariant
WHERE ElOpTablInvariant.ID Not IN
(SELECT NewID FROM ElOpTablInvariantUniqueIdMapping);
GO

drop table ElOpTablInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO EsOpTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, LengWave, P, ErrP, Bknumber
   FROM EsOpTablInvariant
   GROUP BY HeadClue, SingCode, LengWave, P, ErrP, Bknumber) t1
INNER JOIN
  EsOpTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.LengWave = t2.LengWave or t1.LengWave is NULL and t2.LengWave is NULL) and
(t1.P = t2.P or t1.P is NULL and t2.P is NULL) and
(t1.ErrP = t2.ErrP or t1.ErrP is NULL and t2.ErrP is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE EsOpTablLanguage
SET EsOpTablLanguage.EsOpTablID = NewID
FROM EsOpTablLanguage
INNER JOIN EsOpTablInvariantUniqueIdMapping U
ON EsOpTablLanguage.EsOpTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM EsOpTablInvariant
WHERE EsOpTablInvariant.ID Not IN
(SELECT NewID FROM EsOpTablInvariantUniqueIdMapping);
GO

drop table EsOpTablInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO GrafTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, NompClue
   FROM GrafTablInvariant
   GROUP BY HeadClue, NompClue) t1
INNER JOIN
  GrafTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.NompClue = t2.NompClue or t1.NompClue is NULL and t2.NompClue is NULL);
GO

UPDATE GrafTablLanguage
SET GrafTablLanguage.GrafTablID = NewID
FROM GrafTablLanguage
INNER JOIN GrafTablInvariantUniqueIdMapping U
ON GrafTablLanguage.GrafTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM GrafTablInvariant
WHERE GrafTablInvariant.ID Not IN
(SELECT NewID FROM GrafTablInvariantUniqueIdMapping);
GO

drop table GrafTablInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO HardTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, Hard1, Hard2, ErrHard, Mohs, ErrMohs, Bknumber
   FROM HardTablInvariant
   GROUP BY HeadClue, SingCode, Hard1, Hard2, ErrHard, Mohs, ErrMohs, Bknumber) t1
INNER JOIN
  HardTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.Hard1 = t2.Hard1 or t1.Hard1 is NULL and t2.Hard1 is NULL) and
(t1.Hard2 = t2.Hard2 or t1.Hard2 is NULL and t2.Hard2 is NULL) and
(t1.ErrHard = t2.ErrHard or t1.ErrHard is NULL and t2.ErrHard is NULL) and
(t1.Mohs = t2.Mohs or t1.Mohs is NULL and t2.Mohs is NULL) and
(t1.ErrMohs = t2.ErrMohs or t1.ErrMohs is NULL and t2.ErrMohs is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE HardTablLanguage
SET HardTablLanguage.HardTablID = NewID
FROM HardTablLanguage
INNER JOIN HardTablInvariantUniqueIdMapping U
ON HardTablLanguage.HardTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM HardTablInvariant
WHERE HardTablInvariant.ID Not IN
(SELECT NewID FROM HardTablInvariantUniqueIdMapping);
GO

drop table HardTablInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO HeatExpnInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, DataType, Temper_1, Temper_2, S11, ErrHExp, Bknumber
   FROM HeatExpnInvariant
   GROUP BY HeadClue, SingCode, DataType, Temper_1, Temper_2, S11, ErrHExp, Bknumber) t1
INNER JOIN
  HeatExpnInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.DataType = t2.DataType or t1.DataType is NULL and t2.DataType is NULL) and
(t1.Temper_1 = t2.Temper_1 or t1.Temper_1 is NULL and t2.Temper_1 is NULL) and
(t1.Temper_2 = t2.Temper_2 or t1.Temper_2 is NULL and t2.Temper_2 is NULL) and
(t1.S11 = t2.S11 or t1.S11 is NULL and t2.S11 is NULL) and
(t1.ErrHExp = t2.ErrHExp or t1.ErrHExp is NULL and t2.ErrHExp is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE HeatExpnLanguage
SET HeatExpnLanguage.HeatExpnID = NewID
FROM HeatExpnLanguage
INNER JOIN HeatExpnInvariantUniqueIdMapping U
ON HeatExpnLanguage.HeatExpnID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM HeatExpnInvariant
WHERE HeatExpnInvariant.ID Not IN
(SELECT NewID FROM HeatExpnInvariantUniqueIdMapping);
GO

drop table HeatExpnInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO HeatTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, Temperat, ZnC, C, ErrC, Bknumber
   FROM HeatTablInvariant
   GROUP BY HeadClue, Temperat, ZnC, C, ErrC, Bknumber) t1
INNER JOIN
  HeatTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.Temperat = t2.Temperat or t1.Temperat is NULL and t2.Temperat is NULL) and
(t1.ZnC = t2.ZnC or t1.ZnC is NULL and t2.ZnC is NULL) and
(t1.C = t2.C or t1.C is NULL and t2.C is NULL) and
(t1.ErrC = t2.ErrC or t1.ErrC is NULL and t2.ErrC is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE HeatTablLanguage
SET HeatTablLanguage.HeatTablID = NewID
FROM HeatTablLanguage
INNER JOIN HeatTablInvariantUniqueIdMapping U
ON HeatTablLanguage.HeatTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM HeatTablInvariant
WHERE HeatTablInvariant.ID Not IN
(SELECT NewID FROM HeatTablInvariantUniqueIdMapping);
GO

drop table HeatTablInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO LastModifiedInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, LastModified
   FROM LastModifiedInvariant
   GROUP BY LastModified) t1
INNER JOIN
  LastModifiedInvariant t2 ON
(t1.LastModified = t2.LastModified or t1.LastModified is NULL and t2.LastModified is NULL);
GO

UPDATE LastModifiedLanguage
SET LastModifiedLanguage.LastModifiedID = NewID
FROM LastModifiedLanguage
INNER JOIN LastModifiedInvariantUniqueIdMapping U
ON LastModifiedLanguage.LastModifiedID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM LastModifiedInvariant
WHERE LastModifiedInvariant.ID Not IN
(SELECT NewID FROM LastModifiedInvariantUniqueIdMapping);
GO

drop table LastModifiedInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO MechTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, Bknumber, FreqCons, Temper, K, ErrK
   FROM MechTablInvariant
   GROUP BY HeadClue, SingCode, Bknumber, FreqCons, Temper, K, ErrK) t1
INNER JOIN
  MechTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL) and
(t1.FreqCons = t2.FreqCons or t1.FreqCons is NULL and t2.FreqCons is NULL) and
(t1.Temper = t2.Temper or t1.Temper is NULL and t2.Temper is NULL) and
(t1.K = t2.K or t1.K is NULL and t2.K is NULL) and
(t1.ErrK = t2.ErrK or t1.ErrK is NULL and t2.ErrK is NULL);
GO

UPDATE MechTablLanguage
SET MechTablLanguage.MechTablID = NewID
FROM MechTablLanguage
INNER JOIN MechTablInvariantUniqueIdMapping U
ON MechTablLanguage.MechTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM MechTablInvariant
WHERE MechTablInvariant.ID Not IN
(SELECT NewID FROM MechTablInvariantUniqueIdMapping);
GO

drop table MechTablInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO MnOpTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, Lyambda, Nw, N2w, Znakcon, K, ErrKj, Bknumber
   FROM MnOpTablInvariant
   GROUP BY HeadClue, SingCode, Lyambda, Nw, N2w, Znakcon, K, ErrKj, Bknumber) t1
INNER JOIN
  MnOpTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.Lyambda = t2.Lyambda or t1.Lyambda is NULL and t2.Lyambda is NULL) and
(t1.Nw = t2.Nw or t1.Nw is NULL and t2.Nw is NULL) and
(t1.N2w = t2.N2w or t1.N2w is NULL and t2.N2w is NULL) and
(t1.Znakcon = t2.Znakcon or t1.Znakcon is NULL and t2.Znakcon is NULL) and
(t1.K = t2.K or t1.K is NULL and t2.K is NULL) and
(t1.ErrKj = t2.ErrKj or t1.ErrKj is NULL and t2.ErrKj is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE MnOpTablLanguage
SET MnOpTablLanguage.MnOpTablID = NewID
FROM MnOpTablLanguage
INNER JOIN MnOpTablInvariantUniqueIdMapping U
ON MnOpTablLanguage.MnOpTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM MnOpTablInvariant
WHERE MnOpTablInvariant.ID Not IN
(SELECT NewID FROM MnOpTablInvariantUniqueIdMapping);
GO

drop table MnOpTablInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO ModfTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, SuprTemp, SP2, ErrSupr, PointGrp, Z, Bknumber
   FROM ModfTablInvariant
   GROUP BY HeadClue, SingCode, SuprTemp, SP2, ErrSupr, PointGrp, Z, Bknumber) t1
INNER JOIN
  ModfTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.SuprTemp = t2.SuprTemp or t1.SuprTemp is NULL and t2.SuprTemp is NULL) and
(t1.SP2 = t2.SP2 or t1.SP2 is NULL and t2.SP2 is NULL) and
(t1.ErrSupr = t2.ErrSupr or t1.ErrSupr is NULL and t2.ErrSupr is NULL) and
(t1.PointGrp = t2.PointGrp or t1.PointGrp is NULL and t2.PointGrp is NULL) and
(t1.Z = t2.Z or t1.Z is NULL and t2.Z is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE ModfTablLanguage
SET ModfTablLanguage.ModfTablID = NewID
FROM ModfTablLanguage
INNER JOIN ModfTablInvariantUniqueIdMapping U
ON ModfTablLanguage.ModfTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM ModfTablInvariant
WHERE ModfTablInvariant.ID Not IN
(SELECT NewID FROM ModfTablInvariantUniqueIdMapping);
GO

drop table ModfTablInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO NlOpTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, Lyambda, Rij, ErrRij, Bknumber
   FROM NlOpTablInvariant
   GROUP BY HeadClue, SingCode, Lyambda, Rij, ErrRij, Bknumber) t1
INNER JOIN
  NlOpTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.Lyambda = t2.Lyambda or t1.Lyambda is NULL and t2.Lyambda is NULL) and
(t1.Rij = t2.Rij or t1.Rij is NULL and t2.Rij is NULL) and
(t1.ErrRij = t2.ErrRij or t1.ErrRij is NULL and t2.ErrRij is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE NlOpTablLanguage
SET NlOpTablLanguage.NlOpTablID = NewID
FROM NlOpTablLanguage
INNER JOIN NlOpTablInvariantUniqueIdMapping U
ON NlOpTablLanguage.NlOpTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM NlOpTablInvariant
WHERE NlOpTablInvariant.ID Not IN
(SELECT NewID FROM NlOpTablInvariantUniqueIdMapping);
GO

drop table NlOpTablInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO PlavTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, PlavTemp, ErrPlav, Bknumber
   FROM PlavTablInvariant
   GROUP BY HeadClue, PlavTemp, ErrPlav, Bknumber) t1
INNER JOIN
  PlavTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.PlavTemp = t2.PlavTemp or t1.PlavTemp is NULL and t2.PlavTemp is NULL) and
(t1.ErrPlav = t2.ErrPlav or t1.ErrPlav is NULL and t2.ErrPlav is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE PlavTablLanguage
SET PlavTablLanguage.PlavTablID = NewID
FROM PlavTablLanguage
INNER JOIN PlavTablInvariantUniqueIdMapping U
ON PlavTablLanguage.PlavTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM PlavTablInvariant
WHERE PlavTablInvariant.ID Not IN
(SELECT NewID FROM PlavTablInvariantUniqueIdMapping);
GO

drop table PlavTablInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO PzElTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, FreqPzEl, ConstD, D, ErrD, Bknumber
   FROM PzElTablInvariant
   GROUP BY HeadClue, SingCode, FreqPzEl, ConstD, D, ErrD, Bknumber) t1
INNER JOIN
  PzElTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.FreqPzEl = t2.FreqPzEl or t1.FreqPzEl is NULL and t2.FreqPzEl is NULL) and
(t1.ConstD = t2.ConstD or t1.ConstD is NULL and t2.ConstD is NULL) and
(t1.D = t2.D or t1.D is NULL and t2.D is NULL) and
(t1.ErrD = t2.ErrD or t1.ErrD is NULL and t2.ErrD is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE PzElTablLanguage
SET PzElTablLanguage.PzElTablID = NewID
FROM PzElTablLanguage
INNER JOIN PzElTablInvariantUniqueIdMapping U
ON PzElTablLanguage.PzElTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM PzElTablInvariant
WHERE PzElTablInvariant.ID Not IN
(SELECT NewID FROM PzElTablInvariantUniqueIdMapping);
GO

drop table PzElTablInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO RefrcIndInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, Temper, WaveLeng, NazbIndx, ZnachInd, ErrIndex, Bknumber
   FROM RefrcIndInvariant
   GROUP BY HeadClue, SingCode, Temper, WaveLeng, NazbIndx, ZnachInd, ErrIndex, Bknumber) t1
INNER JOIN
  RefrcIndInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.Temper = t2.Temper or t1.Temper is NULL and t2.Temper is NULL) and
(t1.WaveLeng = t2.WaveLeng or t1.WaveLeng is NULL and t2.WaveLeng is NULL) and
(t1.NazbIndx = t2.NazbIndx or t1.NazbIndx is NULL and t2.NazbIndx is NULL) and
(t1.ZnachInd = t2.ZnachInd or t1.ZnachInd is NULL and t2.ZnachInd is NULL) and
(t1.ErrIndex = t2.ErrIndex or t1.ErrIndex is NULL and t2.ErrIndex is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE RefrcIndLanguage
SET RefrcIndLanguage.RefrcIndID = NewID
FROM RefrcIndLanguage
INNER JOIN RefrcIndInvariantUniqueIdMapping U
ON RefrcIndLanguage.RefrcIndID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM RefrcIndInvariant
WHERE RefrcIndInvariant.ID Not IN
(SELECT NewID FROM RefrcIndInvariantUniqueIdMapping);
GO

drop table RefrcIndInvariantUniqueIdMapping;
GO


SELECT t2.ID as OldID, t1.MinID as NewID
INTO SuspTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, Temper, Suspense, ErrSusp, Bknumber
   FROM SuspTablInvariant
   GROUP BY HeadClue, Temper, Suspense, ErrSusp, Bknumber) t1
INNER JOIN
  SuspTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.Temper = t2.Temper or t1.Temper is NULL and t2.Temper is NULL) and
(t1.Suspense = t2.Suspense or t1.Suspense is NULL and t2.Suspense is NULL) and
(t1.ErrSusp = t2.ErrSusp or t1.ErrSusp is NULL and t2.ErrSusp is NULL) and
(t1.Bknumber = t2.Bknumber or t1.Bknumber is NULL and t2.Bknumber is NULL);
GO

UPDATE SuspTablLanguage
SET SuspTablLanguage.SuspTablID = NewID
FROM SuspTablLanguage
INNER JOIN SuspTablInvariantUniqueIdMapping U
ON SuspTablLanguage.SuspTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM SuspTablInvariant
WHERE SuspTablInvariant.ID Not IN
(SELECT NewID FROM SuspTablInvariantUniqueIdMapping);
GO

drop table SuspTablInvariantUniqueIdMapping;
GO


DELETE FROM AcOpTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM AcOpTablLanguage GROUP BY AcOpTablID, LanguageID, E, Nsv, Uzv);
DELETE FROM ConstSelLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM ConstSelLanguage GROUP BY ConstSelID, LanguageID, Measure);
DELETE FROM CuryTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM CuryTablLanguage GROUP BY CuryTablID, LanguageID, Oboztran);
DELETE FROM DecrTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM DecrTablLanguage GROUP BY DecrTablID, LanguageID, Nzv, Uzv, WaveType);
DELETE FROM DensTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM DensTablLanguage GROUP BY DensTablID, LanguageID, __MethodD);
DELETE FROM DielDissLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM DielDissLanguage GROUP BY DielDissID, LanguageID, TangName, __MethodY);
DELETE FROM DielectrLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM DielectrLanguage GROUP BY DielectrID, LanguageID, Znak, __MethodY);
DELETE FROM Elastic1Language WHERE ID NOT IN (SELECT MIN(ID) FROM Elastic1Language GROUP BY Elastic1ID, LanguageID, ZnE, __MethodE);
DELETE FROM ElemTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM ElemTablLanguage GROUP BY ElemTablID, LanguageID, Nazbparam, __MethodP);
DELETE FROM ElemTablNewLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM ElemTablNewLanguage GROUP BY ElemTablNewID, LanguageID, __MethodP);
DELETE FROM ElOpTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM ElOpTablLanguage GROUP BY ElOpTablID, LanguageID, ZnN1, __MethodR);
DELETE FROM EsOpTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM EsOpTablLanguage GROUP BY EsOpTablID, LanguageID, ZnP, __MethodP);
DELETE FROM GrafTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM GrafTablLanguage GROUP BY GrafTablID, LanguageID, NameGraf, Signatur);
DELETE FROM HardTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM HardTablLanguage GROUP BY HardTablID, LanguageID, __MethodH);
DELETE FROM HeatExpnLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM HeatExpnLanguage GROUP BY HeatExpnID, LanguageID, Znak1, __MethodEx);
DELETE FROM HeatTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM HeatTablLanguage GROUP BY HeatTablID, LanguageID, __MethodC);
DELETE FROM LastModifiedLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM LastModifiedLanguage GROUP BY LastModifiedID, LanguageID, Text);
DELETE FROM MechTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM MechTablLanguage GROUP BY MechTablID, LanguageID, ZnK, __MethodK);
DELETE FROM MnOpTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM MnOpTablLanguage GROUP BY MnOpTablID, LanguageID, __MethodK);
DELETE FROM ModfTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM ModfTablLanguage GROUP BY ModfTablID, LanguageID, SpaceGrp);
DELETE FROM NlOpTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM NlOpTablLanguage GROUP BY NlOpTablID, LanguageID, ZnR, __MethodR);
DELETE FROM PlavTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM PlavTablLanguage GROUP BY PlavTablID, LanguageID, PlavType);
DELETE FROM PzElTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM PzElTablLanguage GROUP BY PzElTablID, LanguageID, __MethodPz);
DELETE FROM RefrcIndLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM RefrcIndLanguage GROUP BY RefrcIndID, LanguageID, __MethodIn);
DELETE FROM SuspTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM SuspTablLanguage GROUP BY SuspTablID, LanguageID, SuspName, __MethodS);
use Crystal;
go

ALTER TABLE AcOpTablInvariant ADD CONSTRAINT U_AcOpTablInvariant UNIQUE (HeadClue, SingCode, WaveLeng, Nzv, M1, M2, M3, Bknumber)
ALTER TABLE AcOpTablLanguage ADD CONSTRAINT U_AcOpTablLanguage UNIQUE (AcOpTablID, LanguageID, E, Nsv, Uzv)
ALTER TABLE ConstSelLanguage ADD CONSTRAINT U_ConstSelLanguage UNIQUE (ConstSelID, LanguageID, Measure)
ALTER TABLE CuryTablInvariant ADD CONSTRAINT U_CuryTablInvariant UNIQUE (HeadClue, CuryTemp, ErrCury, Bknumber)
ALTER TABLE CuryTablLanguage ADD CONSTRAINT U_CuryTablLanguage UNIQUE (CuryTablID, LanguageID, Oboztran)
ALTER TABLE DecrTablInvariant ADD CONSTRAINT U_DecrTablInvariant UNIQUE (HeadClue, SingCode, WaveSpeed, Decrement, DecrFreq, Bknumber)
ALTER TABLE DecrTablLanguage ADD CONSTRAINT U_DecrTablLanguage UNIQUE (DecrTablID, LanguageID, Nzv, Uzv, WaveType)
ALTER TABLE DensTablInvariant ADD CONSTRAINT U_DensTablInvariant UNIQUE (HeadClue, SingCode, Density, ErrDens, Bknumber)
ALTER TABLE DensTablLanguage ADD CONSTRAINT U_DensTablLanguage UNIQUE (DensTablID, LanguageID, __MethodD)
ALTER TABLE DielDissInvariant ADD CONSTRAINT U_DielDissInvariant UNIQUE (HeadClue, SingCode, FreqDiss, Temper_3, TangentD, ErrDiss, Bknumber)
ALTER TABLE DielDissLanguage ADD CONSTRAINT U_DielDissLanguage UNIQUE (DielDissID, LanguageID, TangName, __MethodY)
ALTER TABLE DielectrInvariant ADD CONSTRAINT U_DielectrInvariant UNIQUE (HeadClue, SingCode, FreqDiel, Temper_2, Constant, Diel, ErrY, Bknumber)
ALTER TABLE DielectrLanguage ADD CONSTRAINT U_DielectrLanguage UNIQUE (DielectrID, LanguageID, Znak, __MethodY)
ALTER TABLE Elastic1Invariant ADD CONSTRAINT U_Elastic1Invariant UNIQUE (HeadClue, SingCode, TemperEl, CondClu1, E1, ErrE, Bknumber)
ALTER TABLE Elastic1Language ADD CONSTRAINT U_Elastic1Language UNIQUE (Elastic1ID, LanguageID, ZnE, __MethodE)
ALTER TABLE ElemTablInvariant ADD CONSTRAINT U_ElemTablInvariant UNIQUE (HeadClue, SingCode, Znparam, Errparam, NazvAngl, ZnAngle, ErrAngl, Bknumber)
ALTER TABLE ElemTablLanguage ADD CONSTRAINT U_ElemTablLanguage UNIQUE (ElemTablID, LanguageID, Nazbparam, __MethodP)
ALTER TABLE ElemTablNewInvariant ADD CONSTRAINT U_ElemTablNewInvariant UNIQUE (HeadClue, SingCode, A, AErr, B, BErr, C, CErr, Alpha, AlphaErr, Beta, BetaErr, Gamma, GammaErr, Bknumber)
ALTER TABLE ElemTablNewLanguage ADD CONSTRAINT U_ElemTablNewLanguage UNIQUE (ElemTablNewID, LanguageID, __MethodP)
ALTER TABLE ElOpTablInvariant ADD CONSTRAINT U_ElOpTablInvariant UNIQUE (HeadClue, SingCode, WvLeng, R, ErrR, Bknumber)
ALTER TABLE ElOpTablLanguage ADD CONSTRAINT U_ElOpTablLanguage UNIQUE (ElOpTablID, LanguageID, ZnN1, __MethodR)
ALTER TABLE EsOpTablInvariant ADD CONSTRAINT U_EsOpTablInvariant UNIQUE (HeadClue, SingCode, LengWave, P, ErrP, Bknumber)
ALTER TABLE EsOpTablLanguage ADD CONSTRAINT U_EsOpTablLanguage UNIQUE (EsOpTablID, LanguageID, ZnP, __MethodP)
ALTER TABLE GrafTablInvariant ADD CONSTRAINT U_GrafTablInvariant UNIQUE (HeadClue, NompClue)
ALTER TABLE HardTablInvariant ADD CONSTRAINT U_HardTablInvariant UNIQUE (HeadClue, SingCode, Hard1, Hard2, ErrHard, Mohs, ErrMohs, Bknumber)
ALTER TABLE HardTablLanguage ADD CONSTRAINT U_HardTablLanguage UNIQUE (HardTablID, LanguageID, __MethodH)
ALTER TABLE HeadTablInvariant ADD CONSTRAINT U_HeadTablInvariant UNIQUE (System, Help, Class)
ALTER TABLE HeadTablLanguage ADD CONSTRAINT U_HeadTablLanguage UNIQUE (HeadTablID, LanguageID, Expert)
ALTER TABLE HeatExpnInvariant ADD CONSTRAINT U_HeatExpnInvariant UNIQUE (HeadClue, SingCode, DataType, Temper_1, Temper_2, S11, ErrHExp, Bknumber)
ALTER TABLE HeatExpnLanguage ADD CONSTRAINT U_HeatExpnLanguage UNIQUE (HeatExpnID, LanguageID, Znak1, __MethodEx)
ALTER TABLE HeatTablInvariant ADD CONSTRAINT U_HeatTablInvariant UNIQUE (HeadClue, Temperat, ZnC, C, ErrC, Bknumber)
ALTER TABLE HeatTablLanguage ADD CONSTRAINT U_HeatTablLanguage UNIQUE (HeatTablID, LanguageID, __MethodC)
ALTER TABLE LastModifiedInvariant ADD CONSTRAINT U_LastModifiedInvariant UNIQUE (LastModified)
ALTER TABLE LastModifiedLanguage ADD CONSTRAINT U_LastModifiedLanguage UNIQUE (LastModifiedID, LanguageID, Text)
ALTER TABLE MechTablInvariant ADD CONSTRAINT U_MechTablInvariant UNIQUE (HeadClue, SingCode, Bknumber, FreqCons, Temper, K, ErrK)
ALTER TABLE MechTablLanguage ADD CONSTRAINT U_MechTablLanguage UNIQUE (MechTablID, LanguageID, ZnK, __MethodK)
ALTER TABLE MnOpTablInvariant ADD CONSTRAINT U_MnOpTablInvariant UNIQUE (HeadClue, SingCode, Lyambda, Nw, N2w, Znakcon, K, ErrKj, Bknumber)
ALTER TABLE MnOpTablLanguage ADD CONSTRAINT U_MnOpTablLanguage UNIQUE (MnOpTablID, LanguageID, __MethodK)
ALTER TABLE ModfTablInvariant ADD CONSTRAINT U_ModfTablInvariant UNIQUE (HeadClue, SingCode, SuprTemp, SP2, ErrSupr, PointGrp, Z, Bknumber)
ALTER TABLE ModfTablLanguage ADD CONSTRAINT U_ModfTablLanguage UNIQUE (ModfTablID, LanguageID, SpaceGrp)
ALTER TABLE NlOpTablInvariant ADD CONSTRAINT U_NlOpTablInvariant UNIQUE (HeadClue, SingCode, Lyambda, Rij, ErrRij, Bknumber)
ALTER TABLE NlOpTablLanguage ADD CONSTRAINT U_NlOpTablLanguage UNIQUE (NlOpTablID, LanguageID, ZnR, __MethodR)
ALTER TABLE PlavTablInvariant ADD CONSTRAINT U_PlavTablInvariant UNIQUE (HeadClue, PlavTemp, ErrPlav, Bknumber)
ALTER TABLE PlavTablLanguage ADD CONSTRAINT U_PlavTablLanguage UNIQUE (PlavTablID, LanguageID, PlavType)
ALTER TABLE PropertiesInvariant ADD CONSTRAINT U_PropertiesInvariant UNIQUE (HTML, TableName)
ALTER TABLE PropertiesLanguage ADD CONSTRAINT U_PropertiesLanguage UNIQUE (PropertiesID, LanguageID, NAZVPROP)
ALTER TABLE PzElTablInvariant ADD CONSTRAINT U_PzElTablInvariant UNIQUE (HeadClue, SingCode, FreqPzEl, ConstD, D, ErrD, Bknumber)
ALTER TABLE PzElTablLanguage ADD CONSTRAINT U_PzElTablLanguage UNIQUE (PzElTablID, LanguageID, __MethodPz)
ALTER TABLE RefrcIndInvariant ADD CONSTRAINT U_RefrcIndInvariant UNIQUE (HeadClue, SingCode, Temper, WaveLeng, NazbIndx, ZnachInd, ErrIndex, Bknumber)
ALTER TABLE RefrcIndLanguage ADD CONSTRAINT U_RefrcIndLanguage UNIQUE (RefrcIndID, LanguageID, __MethodIn)
ALTER TABLE SuspTablInvariant ADD CONSTRAINT U_SuspTablInvariant UNIQUE (HeadClue, Temper, Suspense, ErrSusp, Bknumber)
ALTER TABLE SuspTablLanguage ADD CONSTRAINT U_SuspTablLanguage UNIQUE (SuspTablID, LanguageID, SuspName, __MethodS)
alter table dbo.GrafTablLanguage
add [__Signatur] as (left([Signatur],(50)));
go
ALTER TABLE GrafTablLanguage ADD CONSTRAINT U_GrafTablLanguage UNIQUE (GrafTablID, LanguageID, NameGraf, __Signatur)
go

use Crystal;
GO
CREATE VIEW dbo.AcOpTabl
WITH SCHEMABINDING
AS select E, Nsv, Uzv, HeadClue, SingCode, WaveLeng, Nzv, M1, M2, M3, Bknumber, AcOpTablInvariant.ID
from dbo.AcOpTablLanguage
join dbo.AcOpTablInvariant on
AcOpTablLanguage.AcOpTablID = AcOpTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.Bibliogr
WITH SCHEMABINDING
AS select Authors, Source, Title, DOI, BibliogrInvariant.Bknumber
from dbo.BibliogrLanguage
join dbo.BibliogrInvariant on
BibliogrLanguage.BibliogrID = BibliogrInvariant.Bknumber
where LanguageID = 1
go
CREATE VIEW dbo.ConstSel
WITH SCHEMABINDING
AS select Measure, HeadClue, SingCode, Equation, NazvSel, ZnachSel, Bknumber, ConstSelInvariant.ID
from dbo.ConstSelLanguage
join dbo.ConstSelInvariant on
ConstSelLanguage.ConstSelID = ConstSelInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.CuryTabl
WITH SCHEMABINDING
AS select Oboztran, HeadClue, CuryTemp, ErrCury, Bknumber, CuryTablInvariant.ID
from dbo.CuryTablLanguage
join dbo.CuryTablInvariant on
CuryTablLanguage.CuryTablID = CuryTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.DecrTabl
WITH SCHEMABINDING
AS select Nzv, Uzv, WaveType, HeadClue, SingCode, WaveSpeed, Decrement, DecrFreq, Bknumber, DecrTablInvariant.ID
from dbo.DecrTablLanguage
join dbo.DecrTablInvariant on
DecrTablLanguage.DecrTablID = DecrTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.DensTabl
WITH SCHEMABINDING
AS select MethodD, __MethodD, HeadClue, SingCode, Density, ErrDens, Bknumber, DensTablInvariant.ID
from dbo.DensTablLanguage
join dbo.DensTablInvariant on
DensTablLanguage.DensTablID = DensTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.DielDiss
WITH SCHEMABINDING
AS select MethodY, TangName, __MethodY, HeadClue, SingCode, FreqDiss, Temper_3, TangentD, ErrDiss, Bknumber, DielDissInvariant.ID
from dbo.DielDissLanguage
join dbo.DielDissInvariant on
DielDissLanguage.DielDissID = DielDissInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.Dielectr
WITH SCHEMABINDING
AS select MethodY, Znak, __MethodY, HeadClue, SingCode, FreqDiel, Temper_2, Constant, Diel, ErrY, Bknumber, DielectrInvariant.ID
from dbo.DielectrLanguage
join dbo.DielectrInvariant on
DielectrLanguage.DielectrID = DielectrInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.Elastic1
WITH SCHEMABINDING
AS select MethodE, ZnE, __MethodE, HeadClue, SingCode, TemperEl, CondClu1, E1, ErrE, Bknumber, Elastic1Invariant.ID
from dbo.Elastic1Language
join dbo.Elastic1Invariant on
Elastic1Language.Elastic1ID = Elastic1Invariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.ElemTabl
WITH SCHEMABINDING
AS select MethodP, Nazbparam, __MethodP, HeadClue, SingCode, Znparam, Errparam, NazvAngl, ZnAngle, ErrAngl, Bknumber, ElemTablInvariant.ID
from dbo.ElemTablLanguage
join dbo.ElemTablInvariant on
ElemTablLanguage.ElemTablID = ElemTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.ElemTablNew
WITH SCHEMABINDING
AS select MethodP, __MethodP, HeadClue, SingCode, A, AErr, B, BErr, C, CErr, Alpha, AlphaErr, Beta, BetaErr, Gamma, GammaErr, Bknumber, ElemTablNewInvariant.ID
from dbo.ElemTablNewLanguage
join dbo.ElemTablNewInvariant on
ElemTablNewLanguage.ElemTablNewID = ElemTablNewInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.ElOpTabl
WITH SCHEMABINDING
AS select MethodR, ZnN1, __MethodR, HeadClue, SingCode, WvLeng, R, ErrR, Bknumber, ElOpTablInvariant.ID
from dbo.ElOpTablLanguage
join dbo.ElOpTablInvariant on
ElOpTablLanguage.ElOpTablID = ElOpTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.EsOpTabl
WITH SCHEMABINDING
AS select MethodP, ZnP, __MethodP, HeadClue, SingCode, LengWave, P, ErrP, Bknumber, EsOpTablInvariant.ID
from dbo.EsOpTablLanguage
join dbo.EsOpTablInvariant on
EsOpTablLanguage.EsOpTablID = EsOpTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.GrafTabl
WITH SCHEMABINDING
AS select NameGraf, Signatur, HeadClue, NompClue, GrafTablInvariant.ID
from dbo.GrafTablLanguage
join dbo.GrafTablInvariant on
GrafTablLanguage.GrafTablID = GrafTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.HardTabl
WITH SCHEMABINDING
AS select MethodH, __MethodH, HeadClue, SingCode, Hard1, Hard2, ErrHard, Mohs, ErrMohs, Bknumber, HardTablInvariant.ID
from dbo.HardTablLanguage
join dbo.HardTablInvariant on
HardTablLanguage.HardTablID = HardTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.HeadTabl
WITH SCHEMABINDING
AS select Expert, System, Help, Class, HeadTablInvariant.HeadClue
from dbo.HeadTablLanguage
join dbo.HeadTablInvariant on
HeadTablLanguage.HeadTablID = HeadTablInvariant.HeadClue
where LanguageID = 1
go
CREATE VIEW dbo.HeatExpn
WITH SCHEMABINDING
AS select MethodEx, Znak1, __MethodEx, HeadClue, SingCode, DataType, Temper_1, Temper_2, S11, ErrHExp, Bknumber, HeatExpnInvariant.ID
from dbo.HeatExpnLanguage
join dbo.HeatExpnInvariant on
HeatExpnLanguage.HeatExpnID = HeatExpnInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.HeatTabl
WITH SCHEMABINDING
AS select MethodC, __MethodC, HeadClue, Temperat, ZnC, C, ErrC, Bknumber, HeatTablInvariant.ID
from dbo.HeatTablLanguage
join dbo.HeatTablInvariant on
HeatTablLanguage.HeatTablID = HeatTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.LastModified
WITH SCHEMABINDING
AS select Text, LastModified, LastModifiedInvariant.ID
from dbo.LastModifiedLanguage
join dbo.LastModifiedInvariant on
LastModifiedLanguage.LastModifiedID = LastModifiedInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.MechTabl
WITH SCHEMABINDING
AS select MethodK, ZnK, __MethodK, HeadClue, SingCode, Bknumber, FreqCons, Temper, K, ErrK, MechTablInvariant.ID
from dbo.MechTablLanguage
join dbo.MechTablInvariant on
MechTablLanguage.MechTablID = MechTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.MnOpTabl
WITH SCHEMABINDING
AS select MethodK, __MethodK, HeadClue, SingCode, Lyambda, Nw, N2w, Znakcon, K, ErrKj, Bknumber, MnOpTablInvariant.ID
from dbo.MnOpTablLanguage
join dbo.MnOpTablInvariant on
MnOpTablLanguage.MnOpTablID = MnOpTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.ModfTabl
WITH SCHEMABINDING
AS select SpaceGrp, HeadClue, SingCode, SuprTemp, SP2, ErrSupr, PointGrp, Z, Bknumber, ModfTablInvariant.ID
from dbo.ModfTablLanguage
join dbo.ModfTablInvariant on
ModfTablLanguage.ModfTablID = ModfTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.NlOpTabl
WITH SCHEMABINDING
AS select MethodR, ZnR, __MethodR, HeadClue, SingCode, Lyambda, Rij, ErrRij, Bknumber, NlOpTablInvariant.ID
from dbo.NlOpTablLanguage
join dbo.NlOpTablInvariant on
NlOpTablLanguage.NlOpTablID = NlOpTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.PlavTabl
WITH SCHEMABINDING
AS select PlavType, HeadClue, PlavTemp, ErrPlav, Bknumber, PlavTablInvariant.ID
from dbo.PlavTablLanguage
join dbo.PlavTablInvariant on
PlavTablLanguage.PlavTablID = PlavTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.Properties
WITH SCHEMABINDING
AS select NAZVPROP, HTML, TableName, PropertiesInvariant.NOMPROP
from dbo.PropertiesLanguage
join dbo.PropertiesInvariant on
PropertiesLanguage.PropertiesID = PropertiesInvariant.NOMPROP
where LanguageID = 1
go
CREATE VIEW dbo.PzElTabl
WITH SCHEMABINDING
AS select MethodPz, __MethodPz, HeadClue, SingCode, FreqPzEl, ConstD, D, ErrD, Bknumber, PzElTablInvariant.ID
from dbo.PzElTablLanguage
join dbo.PzElTablInvariant on
PzElTablLanguage.PzElTablID = PzElTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.RefrcInd
WITH SCHEMABINDING
AS select MethodIn, __MethodIn, HeadClue, SingCode, Temper, WaveLeng, NazbIndx, ZnachInd, ErrIndex, Bknumber, RefrcIndInvariant.ID
from dbo.RefrcIndLanguage
join dbo.RefrcIndInvariant on
RefrcIndLanguage.RefrcIndID = RefrcIndInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.SuspTabl
WITH SCHEMABINDING
AS select MethodS, SuspName, __MethodS, HeadClue, Temper, Suspense, ErrSusp, Bknumber, SuspTablInvariant.ID
from dbo.SuspTablLanguage
join dbo.SuspTablInvariant on
SuspTablLanguage.SuspTablID = SuspTablInvariant.ID
where LanguageID = 1
go
CREATE VIEW dbo.RefrTabl
WITH SCHEMABINDING
AS select HeadClue, Referat, ID
from dbo.RefrTablLanguage
where LanguageId = 1
go

use Crystal;

alter table dbo.HeadTablInvariant
add [SystemUrl] as (replace(replace(System, '<sub>', ''),'</sub>', ''));
go

alter table dbo.PropertiesInvariant add TableNameUrl varchar(50);
go

update P
set TableNameUrl = (case
  when P.TableName = 'RefrTabl' then 'Review'
	when P.TableName = 'SistTabl' then 'Composition'
	when P.TableName = 'HeatTabl' then 'Heat'
	when P.TableName = 'DensTabl' then 'Density'
	when P.TableName = 'HardTabl' then 'Hardness'
	when P.TableName = 'SuspTabl' then 'Solubility'
	when P.TableName = 'PlavTabl' then 'Melt'
	when P.TableName = 'CuryTabl' then 'Cury'
	when P.TableName = 'ModfTabl' then 'Crystal_Mod'
	when P.TableName = 'ElemTabl' then 'Lattice'
	when P.TableName = 'HeatExpn0' then 'Thermal_Expansion'
	when P.TableName = 'HeatExpn1' then 'Thermal_Conductivity'
	when P.TableName = 'Dielectr' then 'Dielectric'
	when P.TableName = 'DielDiss' then 'Dielectric_Loss'
	when P.TableName = 'PzElTabl' then 'Piezoelectric'
	when P.TableName = 'MechTabl' then 'Piezoelectric_Coupling'
	when P.TableName = 'MechTabl' then 'Piezoelectric_Coupling'
	when P.TableName = 'Elastic1' then 'Elastic'
	when P.TableName = 'Wavepure' then 'Transparency'
	when P.TableName = 'RefrcInd' then 'Refractive'
	when P.TableName = 'ConstSel' then 'Sellmeier'
	when P.TableName = 'ElOpTabl' then 'Electro-optical'
	when P.TableName = 'EsOpTabl' then 'Elasto-optical'
	when P.TableName = 'NlOpTabl' then 'Nonlinear-optical'
	when P.TableName = 'DecrTabl' then 'Wave'
	when P.TableName = 'AcOpTabl' then 'Acousto-optical'
	when P.TableName = 'LitrTabl' then 'References'
end)
from dbo.PropertiesInvariant P;
go