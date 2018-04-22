use Crystal;
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
INTO ElemTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(ID) as MinID, HeadClue, SingCode, Nazbparam, Znparam, Errparam, NazvAngl, ZnAngle, ErrAngl, Bknumber
   FROM ElemTablInvariant
   GROUP BY HeadClue, SingCode, Nazbparam, Znparam, Errparam, NazvAngl, ZnAngle, ErrAngl, Bknumber) t1
INNER JOIN
  ElemTablInvariant t2 ON
(t1.HeadClue = t2.HeadClue or t1.HeadClue is NULL and t2.HeadClue is NULL) and
(t1.SingCode = t2.SingCode or t1.SingCode is NULL and t2.SingCode is NULL) and
(t1.Nazbparam = t2.Nazbparam or t1.Nazbparam is NULL and t2.Nazbparam is NULL) and
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


SELECT t2.NOMPROP as OldID, t1.MinID as NewID
INTO PropertiesInvariantUniqueIdMapping
FROM
  (SELECT MIN(NOMPROP) as MinID, HTML, TableName
   FROM PropertiesInvariant
   GROUP BY HTML, TableName) t1
INNER JOIN
  PropertiesInvariant t2 ON
(t1.HTML = t2.HTML or t1.HTML is NULL and t2.HTML is NULL) and
(t1.TableName = t2.TableName or t1.TableName is NULL and t2.TableName is NULL);
GO

UPDATE EquationTabl
SET EquationTabl.NOMPROP = NewID
FROM EquationTabl
INNER JOIN PropertiesInvariantUniqueIdMapping U
ON EquationTabl.NOMPROP = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE PropertiesLanguage
SET PropertiesLanguage.PropertiesID = NewID
FROM PropertiesLanguage
INNER JOIN PropertiesInvariantUniqueIdMapping U
ON PropertiesLanguage.PropertiesID = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM PropertiesInvariant
WHERE PropertiesInvariant.NOMPROP Not IN
(SELECT NewID FROM PropertiesInvariantUniqueIdMapping);
GO

drop table PropertiesInvariantUniqueIdMapping;
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


use Crystal;
DELETE FROM DielDissLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM DielDissLanguage GROUP BY HeadClue, SingCode, FreqDiss, Temper_3, TangName, TangentD, ErrDiss, Bknumber, __MethodY, LanguageID);
DELETE FROM ElOpTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM ElOpTablLanguage GROUP BY HeadClue, SingCode, WvLeng, ZnN1, R, ErrR, Bknumber, __MethodR, LanguageID);
DELETE FROM EsOpTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM EsOpTablLanguage GROUP BY HeadClue, SingCode, LengWave, ZnP, P, ErrP, Bknumber, __MethodP, LanguageID);
DELETE FROM ElemTablNewLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM ElemTablNewLanguage GROUP BY HeadClue, SingCode, A, AErr, B, BErr, C, CErr, Alpha, AlphaErr, Beta, BetaErr, Gamma, GammaErr, Bknumber, __MethodP, LanguageID);
DELETE FROM MechTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM MechTablLanguage GROUP BY HeadClue, SingCode, Bknumber, FreqCons, Temper, ZnK, K, ErrK, __MethodK, LanguageID);
DELETE FROM NlOpTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM NlOpTablLanguage GROUP BY HeadClue, SingCode, Lyambda, ZnR, Rij, ErrRij, Bknumber, __MethodR, LanguageID);
DELETE FROM LastModifiedLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM LastModifiedLanguage GROUP BY Text, LastModified, LanguageID);
DELETE FROM GrafTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM GrafTablLanguage GROUP BY HeadClue, NompClue, NameGraf, Signatur, LanguageID);
DELETE FROM PlavTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM PlavTablLanguage GROUP BY HeadClue, PlavType, PlavTemp, ErrPlav, Bknumber, LanguageID);
DELETE FROM Elastic1Language WHERE ID NOT IN (SELECT MIN(ID) FROM Elastic1Language GROUP BY Elastic1ID, LanguageID, ZnE, __MethodE);
DELETE FROM MnOpTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM MnOpTablLanguage GROUP BY MnOpTablID, LanguageID, __MethodK);
DELETE FROM CuryTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM CuryTablLanguage GROUP BY HeadClue, CuryTemp, ErrCury, Oboztran, Bknumber, LanguageID);
DELETE FROM ModfTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM ModfTablLanguage GROUP BY ModfTablID, LanguageID, SpaceGrp);
DELETE FROM HardTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM HardTablLanguage GROUP BY HeadClue, SingCode, Hard1, Hard2, ErrHard, Mohs, ErrMohs, Bknumber, __MethodH, LanguageID);
DELETE FROM SuspTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM SuspTablLanguage GROUP BY HeadClue, Temper, SuspName, Suspense, ErrSusp, Bknumber, __MethodS, LanguageID);
DELETE FROM PzElTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM PzElTablLanguage GROUP BY PzElTablID, LanguageID, __MethodPz);
DELETE FROM RefrcIndLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM RefrcIndLanguage GROUP BY RefrcIndID, LanguageID, __MethodIn);
DELETE FROM DecrTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM DecrTablLanguage GROUP BY HeadClue, SingCode, Nzv, Uzv, WaveType, WaveSpeed, Decrement, DecrFreq, Bknumber, LanguageID);
DELETE FROM DielectrLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM DielectrLanguage GROUP BY DielectrID, LanguageID, Znak, __MethodY);
DELETE FROM HeatExpnLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM HeatExpnLanguage GROUP BY HeadClue, SingCode, DataType, Temper_1, Temper_2, Znak1, S11, ErrHExp, Bknumber, __MethodEx, LanguageID);
DELETE FROM ElemTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM ElemTablLanguage GROUP BY ElemTablID, LanguageID, __MethodP);
DELETE FROM PropertiesLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM PropertiesLanguage GROUP BY PropertiesID, LanguageID, NAZVPROP);
DELETE FROM HeatTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM HeatTablLanguage GROUP BY HeatTablID, LanguageID, __MethodC);
DELETE FROM DensTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM DensTablLanguage GROUP BY HeadClue, SingCode, Density, ErrDens, Bknumber, __MethodD, LanguageID);
DELETE FROM AcOpTablLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM AcOpTablLanguage GROUP BY AcOpTablID, LanguageID, E, Nsv, Uzv);
DELETE FROM BibliogrLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM BibliogrLanguage GROUP BY BibliogrID, LanguageID, Authors, Source, Title);
DELETE FROM ConstSelLanguage WHERE ID NOT IN (SELECT MIN(ID) FROM ConstSelLanguage GROUP BY ConstSelID, LanguageID, Measure);

go

use Crystal;
DELETE FROM Elastic1Invariant WHERE ID NOT IN (SELECT MIN(ID) FROM Elastic1Invariant GROUP BY HeadClue, SingCode, TemperEl, CondClu1, E1, ErrE, Bknumber);
DELETE FROM MnOpTablInvariant WHERE ID NOT IN (SELECT MIN(ID) FROM MnOpTablInvariant GROUP BY HeadClue, SingCode, Lyambda, Nw, N2w, Znakcon, K, ErrKj, Bknumber);
DELETE FROM ModfTablInvariant WHERE ID NOT IN (SELECT MIN(ID) FROM ModfTablInvariant GROUP BY HeadClue, SingCode, SuprTemp, SP2, ErrSupr, PointGrp, Z, Bknumber);
DELETE FROM PzElTablInvariant WHERE ID NOT IN (SELECT MIN(ID) FROM PzElTablInvariant GROUP BY HeadClue, SingCode, FreqPzEl, ConstD, D, ErrD, Bknumber);
DELETE FROM RefrcIndInvariant WHERE ID NOT IN (SELECT MIN(ID) FROM RefrcIndInvariant GROUP BY HeadClue, SingCode, Temper, WaveLeng, NazbIndx, ZnachInd, ErrIndex, Bknumber);
DELETE FROM DielectrInvariant WHERE ID NOT IN (SELECT MIN(ID) FROM DielectrInvariant GROUP BY HeadClue, SingCode, FreqDiel, Temper_2, Constant, Diel, ErrY, Bknumber);
DELETE FROM ElemTablInvariant WHERE ID NOT IN (SELECT MIN(ID) FROM ElemTablInvariant GROUP BY HeadClue, SingCode, Nazbparam, Znparam, Errparam, NazvAngl, ZnAngle, ErrAngl, Bknumber);
DELETE FROM PropertiesInvariant WHERE NOMPROP NOT IN (SELECT MIN(NOMPROP) FROM PropertiesInvariant GROUP BY HTML, TableName);
DELETE FROM HeatTablInvariant WHERE ID NOT IN (SELECT MIN(ID) FROM HeatTablInvariant GROUP BY HeadClue, Temperat, ZnC, C, ErrC, Bknumber);
DELETE FROM AcOpTablInvariant WHERE ID NOT IN (SELECT MIN(ID) FROM AcOpTablInvariant GROUP BY HeadClue, SingCode, WaveLeng, Nzv, M1, M2, M3, Bknumber);
DELETE FROM ConstSelInvariant WHERE ID NOT IN (SELECT MIN(ID) FROM ConstSelInvariant GROUP BY HeadClue, SingCode, Equation, NazvSel, ZnachSel, Bknumber);

go

use Crystal;
ALTER TABLE DielDissLanguage ADD CONSTRAINT U_DielDissLanguage UNIQUE (HeadClue, SingCode, FreqDiss, Temper_3, TangName, TangentD, ErrDiss, Bknumber, __MethodY, LanguageID)
ALTER TABLE Elastic1Invariant ADD CONSTRAINT U_Elastic1Invariant UNIQUE (HeadClue, SingCode, TemperEl, CondClu1, E1, ErrE, Bknumber)
ALTER TABLE ElOpTablLanguage ADD CONSTRAINT U_ElOpTablLanguage UNIQUE (HeadClue, SingCode, WvLeng, ZnN1, R, ErrR, Bknumber, __MethodR, LanguageID)
ALTER TABLE EsOpTablLanguage ADD CONSTRAINT U_EsOpTablLanguage UNIQUE (HeadClue, SingCode, LengWave, ZnP, P, ErrP, Bknumber, __MethodP, LanguageID)
ALTER TABLE ElemTablNewLanguage ADD CONSTRAINT U_ElemTablNewLanguage UNIQUE (HeadClue, SingCode, A, AErr, B, BErr, C, CErr, Alpha, AlphaErr, Beta, BetaErr, Gamma, GammaErr, Bknumber, __MethodP, LanguageID)
ALTER TABLE MechTablLanguage ADD CONSTRAINT U_MechTablLanguage UNIQUE (HeadClue, SingCode, Bknumber, FreqCons, Temper, ZnK, K, ErrK, __MethodK, LanguageID)
ALTER TABLE MnOpTablInvariant ADD CONSTRAINT U_MnOpTablInvariant UNIQUE (HeadClue, SingCode, Lyambda, Nw, N2w, Znakcon, K, ErrKj, Bknumber)
ALTER TABLE ModfTablInvariant ADD CONSTRAINT U_ModfTablInvariant UNIQUE (HeadClue, SingCode, SuprTemp, SP2, ErrSupr, PointGrp, Z, Bknumber)
ALTER TABLE NlOpTablLanguage ADD CONSTRAINT U_NlOpTablLanguage UNIQUE (HeadClue, SingCode, Lyambda, ZnR, Rij, ErrRij, Bknumber, __MethodR, LanguageID)
ALTER TABLE PzElTablInvariant ADD CONSTRAINT U_PzElTablInvariant UNIQUE (HeadClue, SingCode, FreqPzEl, ConstD, D, ErrD, Bknumber)
ALTER TABLE RefrcIndInvariant ADD CONSTRAINT U_RefrcIndInvariant UNIQUE (HeadClue, SingCode, Temper, WaveLeng, NazbIndx, ZnachInd, ErrIndex, Bknumber)
ALTER TABLE LastModifiedLanguage ADD CONSTRAINT U_LastModifiedLanguage UNIQUE (Text, LastModified, LanguageID)
ALTER TABLE DielectrInvariant ADD CONSTRAINT U_DielectrInvariant UNIQUE (HeadClue, SingCode, FreqDiel, Temper_2, Constant, Diel, ErrY, Bknumber)
ALTER TABLE GrafTablLanguage ADD CONSTRAINT U_GrafTablLanguage UNIQUE (HeadClue, NompClue, NameGraf, Signatur, LanguageID)
ALTER TABLE PlavTablLanguage ADD CONSTRAINT U_PlavTablLanguage UNIQUE (HeadClue, PlavType, PlavTemp, ErrPlav, Bknumber, LanguageID)
ALTER TABLE Elastic1Language ADD CONSTRAINT U_Elastic1Language UNIQUE (Elastic1ID, LanguageID, ZnE, __MethodE)
ALTER TABLE ElemTablInvariant ADD CONSTRAINT U_ElemTablInvariant UNIQUE (HeadClue, SingCode, Nazbparam, Znparam, Errparam, NazvAngl, ZnAngle, ErrAngl, Bknumber)
ALTER TABLE MnOpTablLanguage ADD CONSTRAINT U_MnOpTablLanguage UNIQUE (MnOpTablID, LanguageID, __MethodK)
ALTER TABLE CuryTablLanguage ADD CONSTRAINT U_CuryTablLanguage UNIQUE (HeadClue, CuryTemp, ErrCury, Oboztran, Bknumber, LanguageID)
ALTER TABLE ModfTablLanguage ADD CONSTRAINT U_ModfTablLanguage UNIQUE (ModfTablID, LanguageID, SpaceGrp)
ALTER TABLE HardTablLanguage ADD CONSTRAINT U_HardTablLanguage UNIQUE (HeadClue, SingCode, Hard1, Hard2, ErrHard, Mohs, ErrMohs, Bknumber, __MethodH, LanguageID)
ALTER TABLE SuspTablLanguage ADD CONSTRAINT U_SuspTablLanguage UNIQUE (HeadClue, Temper, SuspName, Suspense, ErrSusp, Bknumber, __MethodS, LanguageID)
ALTER TABLE PzElTablLanguage ADD CONSTRAINT U_PzElTablLanguage UNIQUE (PzElTablID, LanguageID, __MethodPz)
ALTER TABLE RefrcIndLanguage ADD CONSTRAINT U_RefrcIndLanguage UNIQUE (RefrcIndID, LanguageID, __MethodIn)
ALTER TABLE DecrTablLanguage ADD CONSTRAINT U_DecrTablLanguage UNIQUE (HeadClue, SingCode, Nzv, Uzv, WaveType, WaveSpeed, Decrement, DecrFreq, Bknumber, LanguageID)
ALTER TABLE PropertiesInvariant ADD CONSTRAINT U_PropertiesInvariant UNIQUE (HTML, TableName)
ALTER TABLE DielectrLanguage ADD CONSTRAINT U_DielectrLanguage UNIQUE (DielectrID, LanguageID, Znak, __MethodY)
ALTER TABLE HeatExpnLanguage ADD CONSTRAINT U_HeatExpnLanguage UNIQUE (HeadClue, SingCode, DataType, Temper_1, Temper_2, Znak1, S11, ErrHExp, Bknumber, __MethodEx, LanguageID)
ALTER TABLE ElemTablLanguage ADD CONSTRAINT U_ElemTablLanguage UNIQUE (ElemTablID, LanguageID, __MethodP)
ALTER TABLE HeatTablInvariant ADD CONSTRAINT U_HeatTablInvariant UNIQUE (HeadClue, Temperat, ZnC, C, ErrC, Bknumber)
ALTER TABLE PropertiesLanguage ADD CONSTRAINT U_PropertiesLanguage UNIQUE (PropertiesID, LanguageID, NAZVPROP)
ALTER TABLE HeatTablLanguage ADD CONSTRAINT U_HeatTablLanguage UNIQUE (HeatTablID, LanguageID, __MethodC)
ALTER TABLE DensTablLanguage ADD CONSTRAINT U_DensTablLanguage UNIQUE (HeadClue, SingCode, Density, ErrDens, Bknumber, __MethodD, LanguageID)
ALTER TABLE AcOpTablLanguage ADD CONSTRAINT U_AcOpTablLanguage UNIQUE (AcOpTablID, LanguageID, E, Nsv, Uzv)
ALTER TABLE AcOpTablInvariant ADD CONSTRAINT U_AcOpTablInvariant UNIQUE (HeadClue, SingCode, WaveLeng, Nzv, M1, M2, M3, Bknumber)
ALTER TABLE ConstSelLanguage ADD CONSTRAINT U_ConstSelLanguage UNIQUE (ConstSelID, LanguageID, Measure)
ALTER TABLE ConstSelInvariant ADD CONSTRAINT U_ConstSelInvariant UNIQUE (HeadClue, SingCode, Equation, NazvSel, ZnachSel, Bknumber)

go

