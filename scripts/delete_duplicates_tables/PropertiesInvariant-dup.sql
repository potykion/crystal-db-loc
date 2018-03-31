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

