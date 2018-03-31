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

