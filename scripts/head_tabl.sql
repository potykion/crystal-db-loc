
-- Create mappings

SELECT t2.HeadClue as OldID, t1.MinID as NewID
INTO HeadTablInvariantUniqueIdMapping
FROM
  (SELECT MIN(HeadClue) as MinID, Help, Class
   FROM HeadTablInvariant
   GROUP BY Help, Class) t1
INNER JOIN
  HeadTablInvariant t2 ON
(t1.Help = t2.Help or t1.Help is NULL and t2.Help is NULL) and
(t1.Class = t2.Class or t1.Class is NULL and t2.Class is NULL);
GO

select S.HeadClue, M.NewId, S.SingType,
ROW_NUMBER() OVER(PARTITION BY M.NewId, S.SingType ORDER BY S.HeadClue DESC)
as duplicated
into SingTablMapping
from SingTabl S
join HeadTablInvariantUniqueIdMapping M
on M.OldId = S.HeadClue
order by M.NewId, S.SingType

go

-- Disable constraints

EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT all"

go

-- Update related tables

UPDATE AcOpTablInvariant
SET AcOpTablInvariant.HeadClue = NewID
FROM AcOpTablInvariant
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON AcOpTablInvariant.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE CuryTablLanguage
SET CuryTablLanguage.HeadClue = NewID
FROM CuryTablLanguage
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON CuryTablLanguage.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE DecrTablLanguage
SET DecrTablLanguage.HeadClue = NewID
FROM DecrTablLanguage
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON DecrTablLanguage.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE DensTablLanguage
SET DensTablLanguage.HeadClue = NewID
FROM DensTablLanguage
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON DensTablLanguage.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE EquationTabl
SET EquationTabl.HeadClue = NewID
FROM EquationTabl
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON EquationTabl.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE GrafTablLanguage
SET GrafTablLanguage.HeadClue = NewID
FROM GrafTablLanguage
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON GrafTablLanguage.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE HardTablLanguage
SET HardTablLanguage.HeadClue = NewID
FROM HardTablLanguage
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON HardTablLanguage.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE HeadTablLanguage
SET HeadTablLanguage.HeadTablID = NewID
FROM HeadTablLanguage
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON HeadTablLanguage.HeadTablID = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE HeatTablInvariant
SET HeatTablInvariant.HeadClue = NewID
FROM HeatTablInvariant
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON HeatTablInvariant.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE LitrTabl
SET LitrTabl.HeadClue = NewID
FROM LitrTabl
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON LitrTabl.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE PlavTablLanguage
SET PlavTablLanguage.HeadClue = NewID
FROM PlavTablLanguage
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON PlavTablLanguage.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE RefrTablLanguage
SET RefrTablLanguage.HeadClue = NewID
FROM RefrTablLanguage
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON RefrTablLanguage.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO


UPDATE SistTabl
SET SistTabl.HeadClue = NewID
FROM SistTabl
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON SistTabl.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE SuspTablLanguage
SET SuspTablLanguage.HeadClue = NewID
FROM SuspTablLanguage
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON SuspTablLanguage.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE Wavepure
SET Wavepure.HeadClue = NewID
FROM Wavepure
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON Wavepure.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE ConstSelInvariant
SET ConstSelInvariant.HeadClue = NewID
FROM ConstSelInvariant
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON ConstSelInvariant.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE DielDissLanguage
SET DielDissLanguage.HeadClue = NewID
FROM DielDissLanguage
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON DielDissLanguage.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE DielectrInvariant
SET DielectrInvariant.HeadClue = NewID
FROM DielectrInvariant
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON DielectrInvariant.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE Elastic1Invariant
SET Elastic1Invariant.HeadClue = NewID
FROM Elastic1Invariant
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON Elastic1Invariant.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE ElemTablInvariant
SET ElemTablInvariant.HeadClue = NewID
FROM ElemTablInvariant
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON ElemTablInvariant.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE ElemTablNewLanguage
SET ElemTablNewLanguage.HeadClue = NewID
FROM ElemTablNewLanguage
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON ElemTablNewLanguage.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE ElOpTablLanguage
SET ElOpTablLanguage.HeadClue = NewID
FROM ElOpTablLanguage
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON ElOpTablLanguage.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE EsOpTablLanguage
SET EsOpTablLanguage.HeadClue = NewID
FROM EsOpTablLanguage
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON EsOpTablLanguage.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE HeatExpnLanguage
SET HeatExpnLanguage.HeadClue = NewID
FROM HeatExpnLanguage
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON HeatExpnLanguage.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE MechTablLanguage
SET MechTablLanguage.HeadClue = NewID
FROM MechTablLanguage
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON MechTablLanguage.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE MnOpTablInvariant
SET MnOpTablInvariant.HeadClue = NewID
FROM MnOpTablInvariant
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON MnOpTablInvariant.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE ModfTablInvariant
SET ModfTablInvariant.HeadClue = NewID
FROM ModfTablInvariant
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON ModfTablInvariant.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE NlOpTablLanguage
SET NlOpTablLanguage.HeadClue = NewID
FROM NlOpTablLanguage
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON NlOpTablLanguage.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE PzElTablInvariant
SET PzElTablInvariant.HeadClue = NewID
FROM PzElTablInvariant
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON PzElTablInvariant.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

UPDATE RefrcIndInvariant
SET RefrcIndInvariant.HeadClue = NewID
FROM RefrcIndInvariant
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON RefrcIndInvariant.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

-- Deal with SingTabl

delete from SingTabl
where exists
(select * from SingTablMapping M
where M.duplicated = 2 and M.HeadClue = SingTabl.HeadClue and M.SingType = SingTabl.SingType);
go

UPDATE SingTabl
SET SingTabl.HeadClue = NewID
FROM SingTabl
INNER JOIN HeadTablInvariantUniqueIdMapping U
ON SingTabl.HeadClue = U.OldID
WHERE U.OldID <> U.NewID;
GO

-- Deal with HeadTabl

DELETE FROM HeadTablInvariant
WHERE HeadTablInvariant.HeadClue Not IN
(SELECT NewID FROM HeadTablInvariantUniqueIdMapping);
GO

-- Drop mappings

drop table HeadTablInvariantUniqueIdMapping;
GO

drop table SingTablMapping;
GO

-- Reenable constraints

exec sp_MSforeachtable @command1="print '?'", @command2="ALTER TABLE ? WITH CHECK CHECK CONSTRAINT all"

go