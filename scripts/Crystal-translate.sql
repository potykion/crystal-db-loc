use Crystal;

---Создаем PK для DensTabl
ALTER TABLE dbo.DensTabl ADD PRIMARY KEY (ID);
GO

--- Таблица - DielDiss
-- Удаляем LanguageID ограничение
ALTER TABLE DielDiss DROP CONSTRAINT DF_DielDiss_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'DielDiss', 'DielDissLanguage';
GO

--- Таблица Elastic1
--- Переименовываем Elastic1
sp_rename 'Elastic1', 'Elastic1Invariant';
GO
--- Создаем таблицу Elastic1Language
CREATE TABLE dbo.Elastic1Language
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Elastic1ID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodE varchar(1999),
    ZnE varchar(20),
    __MethodE as (left([MethodE],50))
);
GO
--- Создаем FK для Elastic1Language
ALTER TABLE dbo.Elastic1Language
ADD CONSTRAINT FK_Elastic1Language_Elastic1Invariant FOREIGN KEY (Elastic1ID)
    REFERENCES dbo.Elastic1Invariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.Elastic1Language (Elastic1ID, MethodE, ZnE, LanguageID)
SELECT ID AS Elastic1Id, MethodE, ZnE, LanguageID
FROM Elastic1Invariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE Elastic1Invariant DROP CONSTRAINT DF_Elastic1_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.Elastic1Invariant DROP COLUMN __MethodE, MethodE, ZnE, LanguageID;
GO

--- Таблица - ElOpTabl
-- Удаляем LanguageID ограничение
ALTER TABLE ElOpTabl DROP CONSTRAINT DF_ElOpTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'ElOpTabl', 'ElOpTablLanguage';
GO

--- Таблица - EsOpTabl
-- Удаляем LanguageID ограничение
ALTER TABLE EsOpTabl DROP CONSTRAINT DF_EsOpTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'EsOpTabl', 'EsOpTablLanguage';
GO

--- Таблица - ElemTablNew
-- Удаляем LanguageID ограничение
ALTER TABLE ElemTablNew DROP CONSTRAINT DF_ElemTablNew_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'ElemTablNew', 'ElemTablNewLanguage';
GO

--- Таблица - MechTabl
-- Удаляем LanguageID ограничение
ALTER TABLE MechTabl DROP CONSTRAINT DF_MechTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'MechTabl', 'MechTablLanguage';
GO

--- Таблица MnOpTabl
--- Переименовываем MnOpTabl
sp_rename 'MnOpTabl', 'MnOpTablInvariant';
GO
--- Создаем таблицу MnOpTablLanguage
CREATE TABLE dbo.MnOpTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    MnOpTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodK varchar(1999),
    __MethodK as (left([MethodK],50))
);
GO
--- Создаем FK для MnOpTablLanguage
ALTER TABLE dbo.MnOpTablLanguage
ADD CONSTRAINT FK_MnOpTablLanguage_MnOpTablInvariant FOREIGN KEY (MnOpTablID)
    REFERENCES dbo.MnOpTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.MnOpTablLanguage (MnOpTablID, MethodK, LanguageID)
SELECT ID AS MnOpTablId, MethodK, LanguageID
FROM MnOpTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE MnOpTablInvariant DROP CONSTRAINT DF_MnOpTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.MnOpTablInvariant DROP COLUMN __MethodK, MethodK, LanguageID;
GO

--- Таблица ModfTabl
--- Переименовываем ModfTabl
sp_rename 'ModfTabl', 'ModfTablInvariant';
GO
--- Создаем таблицу ModfTablLanguage
CREATE TABLE dbo.ModfTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ModfTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    SpaceGrp varchar(55)
);
GO
--- Создаем FK для ModfTablLanguage
ALTER TABLE dbo.ModfTablLanguage
ADD CONSTRAINT FK_ModfTablLanguage_ModfTablInvariant FOREIGN KEY (ModfTablID)
    REFERENCES dbo.ModfTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.ModfTablLanguage (ModfTablID, SpaceGrp, LanguageID)
SELECT ID AS ModfTablId, SpaceGrp, LanguageID
FROM ModfTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE ModfTablInvariant DROP CONSTRAINT DF_ModfTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.ModfTablInvariant DROP COLUMN SpaceGrp, LanguageID;
GO

--- Таблица - NlOpTabl
-- Удаляем LanguageID ограничение
ALTER TABLE NlOpTabl DROP CONSTRAINT DF_NlOpTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'NlOpTabl', 'NlOpTablLanguage';
GO

--- Таблица PzElTabl
--- Переименовываем PzElTabl
sp_rename 'PzElTabl', 'PzElTablInvariant';
GO
--- Создаем таблицу PzElTablLanguage
CREATE TABLE dbo.PzElTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    PzElTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodPz varchar(1999),
    __MethodPz as (left([MethodPz],50))
);
GO
--- Создаем FK для PzElTablLanguage
ALTER TABLE dbo.PzElTablLanguage
ADD CONSTRAINT FK_PzElTablLanguage_PzElTablInvariant FOREIGN KEY (PzElTablID)
    REFERENCES dbo.PzElTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.PzElTablLanguage (PzElTablID, MethodPz, LanguageID)
SELECT ID AS PzElTablId, MethodPz, LanguageID
FROM PzElTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE PzElTablInvariant DROP CONSTRAINT DF_PzElTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.PzElTablInvariant DROP COLUMN __MethodPz, MethodPz, LanguageID;
GO

--- Таблица - RefrTabl
-- Удаляем LanguageID ограничение
ALTER TABLE RefrTabl DROP CONSTRAINT DF_RefrTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'RefrTabl', 'RefrTablLanguage';
GO

--- Таблица RefrcInd
--- Переименовываем RefrcInd
sp_rename 'RefrcInd', 'RefrcIndInvariant';
GO
--- Создаем таблицу RefrcIndLanguage
CREATE TABLE dbo.RefrcIndLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    RefrcIndID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodIn varchar(1999),
    __MethodIn as (left([MethodIn],50))
);
GO
--- Создаем FK для RefrcIndLanguage
ALTER TABLE dbo.RefrcIndLanguage
ADD CONSTRAINT FK_RefrcIndLanguage_RefrcIndInvariant FOREIGN KEY (RefrcIndID)
    REFERENCES dbo.RefrcIndInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.RefrcIndLanguage (RefrcIndID, MethodIn, LanguageID)
SELECT ID AS RefrcIndId, MethodIn, LanguageID
FROM RefrcIndInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE RefrcIndInvariant DROP CONSTRAINT DF_RefrcInd_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.RefrcIndInvariant DROP COLUMN __MethodIn, MethodIn, LanguageID;
GO

--- Таблица - LastModified
-- Удаляем LanguageID ограничение
ALTER TABLE LastModified DROP CONSTRAINT DF_LastModified_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'LastModified', 'LastModifiedLanguage';
GO

--- Таблица Dielectr
--- Переименовываем Dielectr
sp_rename 'Dielectr', 'DielectrInvariant';
GO
--- Создаем таблицу DielectrLanguage
CREATE TABLE dbo.DielectrLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    DielectrID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodY varchar(1999),
    Znak varchar(50),
    __MethodY as (left([MethodY],50))
);
GO
--- Создаем FK для DielectrLanguage
ALTER TABLE dbo.DielectrLanguage
ADD CONSTRAINT FK_DielectrLanguage_DielectrInvariant FOREIGN KEY (DielectrID)
    REFERENCES dbo.DielectrInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.DielectrLanguage (DielectrID, MethodY, Znak, LanguageID)
SELECT ID AS DielectrId, MethodY, Znak, LanguageID
FROM DielectrInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE DielectrInvariant DROP CONSTRAINT DF_Dielectr_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.DielectrInvariant DROP COLUMN __MethodY, MethodY, Znak, LanguageID;
GO

--- Таблица - GrafTabl
-- Удаляем LanguageID ограничение
ALTER TABLE GrafTabl DROP CONSTRAINT DF_GrafTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'GrafTabl', 'GrafTablLanguage';
GO

--- Таблица - PlavTabl
-- Удаляем LanguageID ограничение
ALTER TABLE PlavTabl DROP CONSTRAINT DF_PlavTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'PlavTabl', 'PlavTablLanguage';
GO

--- Таблица ElemTabl
--- Переименовываем ElemTabl
sp_rename 'ElemTabl', 'ElemTablInvariant';
GO
--- Создаем таблицу ElemTablLanguage
CREATE TABLE dbo.ElemTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ElemTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodP varchar(512),
    __MethodP as (left([MethodP],(50)))
);
GO
--- Создаем FK для ElemTablLanguage
ALTER TABLE dbo.ElemTablLanguage
ADD CONSTRAINT FK_ElemTablLanguage_ElemTablInvariant FOREIGN KEY (ElemTablID)
    REFERENCES dbo.ElemTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.ElemTablLanguage (ElemTablID, MethodP, LanguageID)
SELECT ID AS ElemTablId, MethodP, LanguageID
FROM ElemTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE ElemTablInvariant DROP CONSTRAINT DF_ElemTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.ElemTablInvariant DROP COLUMN __MethodP, MethodP, LanguageID;
GO

--- Таблица - CuryTabl
-- Удаляем LanguageID ограничение
ALTER TABLE CuryTabl DROP CONSTRAINT DF_CuryTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'CuryTabl', 'CuryTablLanguage';
GO

--- Таблица - HardTabl
-- Удаляем LanguageID ограничение
ALTER TABLE HardTabl DROP CONSTRAINT DF_HardTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'HardTabl', 'HardTablLanguage';
GO

--- Таблица - SuspTabl
-- Удаляем LanguageID ограничение
ALTER TABLE SuspTabl DROP CONSTRAINT DF_SuspTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'SuspTabl', 'SuspTablLanguage';
GO

--- Таблица - DecrTabl
-- Удаляем LanguageID ограничение
ALTER TABLE DecrTabl DROP CONSTRAINT DF_DecrTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'DecrTabl', 'DecrTablLanguage';
GO

--- Таблица Properties
--- Переименовываем Properties
sp_rename 'Properties', 'PropertiesInvariant';
GO
--- Создаем таблицу PropertiesLanguage
CREATE TABLE dbo.PropertiesLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    PropertiesID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    NAZVPROP varchar(300)
);
GO
--- Создаем FK для PropertiesLanguage
ALTER TABLE dbo.PropertiesLanguage
ADD CONSTRAINT FK_PropertiesLanguage_PropertiesInvariant FOREIGN KEY (PropertiesID)
    REFERENCES dbo.PropertiesInvariant (NOMPROP)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.PropertiesLanguage (PropertiesID, NAZVPROP, LanguageID)
SELECT NOMPROP AS PropertiesId, NAZVPROP, LanguageID
FROM PropertiesInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE PropertiesInvariant DROP CONSTRAINT DF_Properties_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.PropertiesInvariant DROP COLUMN NAZVPROP, LanguageID;
GO

--- Таблица - Properties_Complex
-- Удаляем LanguageID ограничение
ALTER TABLE Properties_Complex DROP CONSTRAINT DF_Properties_Complex_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'Properties_Complex', 'Properties_ComplexLanguage';
GO

--- Таблица - HeatExpn
-- Удаляем LanguageID ограничение
ALTER TABLE HeatExpn DROP CONSTRAINT DF_HeatExpn_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'HeatExpn', 'HeatExpnLanguage';
GO

--- Таблица HeatTabl
--- Переименовываем HeatTabl
sp_rename 'HeatTabl', 'HeatTablInvariant';
GO
--- Создаем таблицу HeatTablLanguage
CREATE TABLE dbo.HeatTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    HeatTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodC varchar(1999),
    __MethodC as (left([MethodC],(50)))
);
GO
--- Создаем FK для HeatTablLanguage
ALTER TABLE dbo.HeatTablLanguage
ADD CONSTRAINT FK_HeatTablLanguage_HeatTablInvariant FOREIGN KEY (HeatTablID)
    REFERENCES dbo.HeatTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.HeatTablLanguage (HeatTablID, MethodC, LanguageID)
SELECT ID AS HeatTablId, MethodC, LanguageID
FROM HeatTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE HeatTablInvariant DROP CONSTRAINT DF_HeatTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.HeatTablInvariant DROP COLUMN __MethodC, MethodC, LanguageID;
GO

--- Таблица - DensTabl
-- Удаляем LanguageID ограничение
ALTER TABLE DensTabl DROP CONSTRAINT DF_DensTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'DensTabl', 'DensTablLanguage';
GO

--- Таблица AcOpTabl
--- Переименовываем AcOpTabl
sp_rename 'AcOpTabl', 'AcOpTablInvariant';
GO
--- Создаем таблицу AcOpTablLanguage
CREATE TABLE dbo.AcOpTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    AcOpTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    E varchar(20),
    Nsv varchar(20),
    Uzv varchar(20)
);
GO
--- Создаем FK для AcOpTablLanguage
ALTER TABLE dbo.AcOpTablLanguage
ADD CONSTRAINT FK_AcOpTablLanguage_AcOpTablInvariant FOREIGN KEY (AcOpTablID)
    REFERENCES dbo.AcOpTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.AcOpTablLanguage (AcOpTablID, E, Nsv, Uzv, LanguageID)
SELECT ID AS AcOpTablId, E, Nsv, Uzv, LanguageID
FROM AcOpTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE AcOpTablInvariant DROP CONSTRAINT DF_AcOpTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.AcOpTablInvariant DROP COLUMN E, Nsv, Uzv, LanguageID;
GO

--- Таблица HeadTabl
--- Переименовываем HeadTabl
sp_rename 'HeadTabl', 'HeadTablInvariant';
GO
--- Создаем таблицу HeadTablLanguage
CREATE TABLE dbo.HeadTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    HeadTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    Expert varchar(32),
    System varchar(128)
);
GO
--- Создаем FK для HeadTablLanguage
ALTER TABLE dbo.HeadTablLanguage
ADD CONSTRAINT FK_HeadTablLanguage_HeadTablInvariant FOREIGN KEY (HeadTablID)
    REFERENCES dbo.HeadTablInvariant (HeadClue)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.HeadTablLanguage (HeadTablID, Expert, System, LanguageID)
SELECT HeadClue AS HeadTablId, Expert, System, LanguageID
FROM HeadTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE HeadTablInvariant DROP CONSTRAINT DF_HeadTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.HeadTablInvariant DROP COLUMN Expert, System, LanguageID;
GO

--- Таблица Bibliogr
--- Переименовываем Bibliogr
sp_rename 'Bibliogr', 'BibliogrInvariant';
GO
--- Создаем таблицу BibliogrLanguage
CREATE TABLE dbo.BibliogrLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    BibliogrID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    Authors varchar(500),
    Source varchar(500),
    Title varchar(1000)
);
GO
--- Создаем FK для BibliogrLanguage
ALTER TABLE dbo.BibliogrLanguage
ADD CONSTRAINT FK_BibliogrLanguage_BibliogrInvariant FOREIGN KEY (BibliogrID)
    REFERENCES dbo.BibliogrInvariant (Bknumber)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.BibliogrLanguage (BibliogrID, Authors, Source, Title, LanguageID)
SELECT Bknumber AS BibliogrId, Authors, Source, Title, LanguageID
FROM BibliogrInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE BibliogrInvariant DROP CONSTRAINT DF_Bibliogr_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.BibliogrInvariant DROP COLUMN Authors, Source, Title, LanguageID;
GO

--- Таблица ConstSel
--- Переименовываем ConstSel
sp_rename 'ConstSel', 'ConstSelInvariant';
GO
--- Создаем таблицу ConstSelLanguage
CREATE TABLE dbo.ConstSelLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ConstSelID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    Measure varchar(20)
);
GO
--- Создаем FK для ConstSelLanguage
ALTER TABLE dbo.ConstSelLanguage
ADD CONSTRAINT FK_ConstSelLanguage_ConstSelInvariant FOREIGN KEY (ConstSelID)
    REFERENCES dbo.ConstSelInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.ConstSelLanguage (ConstSelID, Measure, LanguageID)
SELECT ID AS ConstSelId, Measure, LanguageID
FROM ConstSelInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE ConstSelInvariant DROP CONSTRAINT DF_ConstSel_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.ConstSelInvariant DROP COLUMN Measure, LanguageID;
GO

