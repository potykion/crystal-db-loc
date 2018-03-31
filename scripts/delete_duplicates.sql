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


SELECT t2.Bknumber as OldID, t1.MinID as NewID
INTO BibliogrInvariantUniqueIdMapping
FROM
  (SELECT MIN(Bknumber) as MinID, DOI
   FROM BibliogrInvariant
   GROUP BY DOI) t1
INNER JOIN
  BibliogrInvariant t2 ON
(t1.DOI = t2.DOI or t1.DOI is NULL and t2.DOI is NULL);
GO

UPDATE AcOpTablInvariant
SET AcOpTablInvariant.Bknumber = NewID
FROM AcOpTablInvariant
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON AcOpTablInvariant.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE BibliogrLanguage
SET BibliogrLanguage.BibliogrID = NewID
FROM BibliogrLanguage
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON BibliogrLanguage.BibliogrID = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE ConstSelInvariant
SET ConstSelInvariant.Bknumber = NewID
FROM ConstSelInvariant
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON ConstSelInvariant.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE CuryTablLanguage
SET CuryTablLanguage.Bknumber = NewID
FROM CuryTablLanguage
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON CuryTablLanguage.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE DecrTablLanguage
SET DecrTablLanguage.Bknumber = NewID
FROM DecrTablLanguage
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON DecrTablLanguage.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE DensTablLanguage
SET DensTablLanguage.Bknumber = NewID
FROM DensTablLanguage
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON DensTablLanguage.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE DielDissLanguage
SET DielDissLanguage.Bknumber = NewID
FROM DielDissLanguage
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON DielDissLanguage.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE DielectrInvariant
SET DielectrInvariant.Bknumber = NewID
FROM DielectrInvariant
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON DielectrInvariant.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE Elastic1Invariant
SET Elastic1Invariant.Bknumber = NewID
FROM Elastic1Invariant
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON Elastic1Invariant.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE ElemTablInvariant
SET ElemTablInvariant.Bknumber = NewID
FROM ElemTablInvariant
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON ElemTablInvariant.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE ElemTablNewLanguage
SET ElemTablNewLanguage.Bknumber = NewID
FROM ElemTablNewLanguage
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON ElemTablNewLanguage.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE ElOpTablLanguage
SET ElOpTablLanguage.Bknumber = NewID
FROM ElOpTablLanguage
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON ElOpTablLanguage.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE EquationTabl
SET EquationTabl.Bknumber = NewID
FROM EquationTabl
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON EquationTabl.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE EsOpTablLanguage
SET EsOpTablLanguage.Bknumber = NewID
FROM EsOpTablLanguage
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON EsOpTablLanguage.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE HardTablLanguage
SET HardTablLanguage.Bknumber = NewID
FROM HardTablLanguage
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON HardTablLanguage.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE HeatExpnLanguage
SET HeatExpnLanguage.Bknumber = NewID
FROM HeatExpnLanguage
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON HeatExpnLanguage.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE HeatTablInvariant
SET HeatTablInvariant.Bknumber = NewID
FROM HeatTablInvariant
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON HeatTablInvariant.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE MechTablLanguage
SET MechTablLanguage.Bknumber = NewID
FROM MechTablLanguage
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON MechTablLanguage.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE MnOpTablInvariant
SET MnOpTablInvariant.Bknumber = NewID
FROM MnOpTablInvariant
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON MnOpTablInvariant.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE ModfTablInvariant
SET ModfTablInvariant.Bknumber = NewID
FROM ModfTablInvariant
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON ModfTablInvariant.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE NlOpTablLanguage
SET NlOpTablLanguage.Bknumber = NewID
FROM NlOpTablLanguage
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON NlOpTablLanguage.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE PlavTablLanguage
SET PlavTablLanguage.Bknumber = NewID
FROM PlavTablLanguage
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON PlavTablLanguage.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE PzElTablInvariant
SET PzElTablInvariant.Bknumber = NewID
FROM PzElTablInvariant
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON PzElTablInvariant.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE RefrcIndInvariant
SET RefrcIndInvariant.Bknumber = NewID
FROM RefrcIndInvariant
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON RefrcIndInvariant.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE SuspTablLanguage
SET SuspTablLanguage.Bknumber = NewID
FROM SuspTablLanguage
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON SuspTablLanguage.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE Wavepure
SET Wavepure.Bknumber = NewID
FROM Wavepure
INNER JOIN BibliogrInvariantUniqueIdMapping U
ON Wavepure.Bknumber = U.OldID
WHERE U.OldID <> U.NewID;
GO

DELETE FROM BibliogrInvariant
WHERE BibliogrInvariant.Bknumber Not IN
(SELECT NewID FROM BibliogrInvariantUniqueIdMapping);
GO

drop table BibliogrInvariantUniqueIdMapping;
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


