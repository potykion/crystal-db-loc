use Crystal;
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

--- Таблица CuryTabl
--- Переименовываем CuryTabl
sp_rename 'CuryTabl', 'CuryTablInvariant';
GO
--- Создаем таблицу CuryTablLanguage
CREATE TABLE dbo.CuryTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    CuryTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    Oboztran varchar(50)
);
GO
--- Создаем FK для CuryTablLanguage
ALTER TABLE dbo.CuryTablLanguage
ADD CONSTRAINT FK_CuryTablLanguage_CuryTablInvariant FOREIGN KEY (CuryTablID)
    REFERENCES dbo.CuryTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.CuryTablLanguage (CuryTablID, Oboztran, LanguageID)
SELECT ID AS CuryTablId, Oboztran, LanguageID
FROM CuryTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE CuryTablInvariant DROP CONSTRAINT DF_CuryTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.CuryTablInvariant DROP COLUMN Oboztran, LanguageID;
GO

--- Таблица DecrTabl
--- Переименовываем DecrTabl
sp_rename 'DecrTabl', 'DecrTablInvariant';
GO
--- Создаем таблицу DecrTablLanguage
CREATE TABLE dbo.DecrTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    DecrTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    Nzv varchar(20),
    Uzv varchar(20),
    WaveType varchar(4)
);
GO
--- Создаем FK для DecrTablLanguage
ALTER TABLE dbo.DecrTablLanguage
ADD CONSTRAINT FK_DecrTablLanguage_DecrTablInvariant FOREIGN KEY (DecrTablID)
    REFERENCES dbo.DecrTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.DecrTablLanguage (DecrTablID, Nzv, Uzv, WaveType, LanguageID)
SELECT ID AS DecrTablId, Nzv, Uzv, WaveType, LanguageID
FROM DecrTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE DecrTablInvariant DROP CONSTRAINT DF_DecrTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.DecrTablInvariant DROP COLUMN Nzv, Uzv, WaveType, LanguageID;
GO

--- Таблица DensTabl
--- Переименовываем DensTabl
sp_rename 'DensTabl', 'DensTablInvariant';
GO
--- Создаем таблицу DensTablLanguage
CREATE TABLE dbo.DensTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    DensTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodD varchar(1999),
    __MethodD as (left([MethodD],(50)))
);
GO
--- Создаем FK для DensTablLanguage
ALTER TABLE dbo.DensTablLanguage
ADD CONSTRAINT FK_DensTablLanguage_DensTablInvariant FOREIGN KEY (DensTablID)
    REFERENCES dbo.DensTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.DensTablLanguage (DensTablID, MethodD, LanguageID)
SELECT ID AS DensTablId, MethodD, LanguageID
FROM DensTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE DensTablInvariant DROP CONSTRAINT DF_DensTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.DensTablInvariant DROP COLUMN __MethodD, MethodD, LanguageID;
GO

--- Таблица DielDiss
--- Переименовываем DielDiss
sp_rename 'DielDiss', 'DielDissInvariant';
GO
--- Создаем таблицу DielDissLanguage
CREATE TABLE dbo.DielDissLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    DielDissID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodY varchar(1999),
    TangName varchar(25),
    __MethodY as (left([MethodY],50))
);
GO
--- Создаем FK для DielDissLanguage
ALTER TABLE dbo.DielDissLanguage
ADD CONSTRAINT FK_DielDissLanguage_DielDissInvariant FOREIGN KEY (DielDissID)
    REFERENCES dbo.DielDissInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.DielDissLanguage (DielDissID, MethodY, TangName, LanguageID)
SELECT ID AS DielDissId, MethodY, TangName, LanguageID
FROM DielDissInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE DielDissInvariant DROP CONSTRAINT DF_DielDiss_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.DielDissInvariant DROP COLUMN __MethodY, MethodY, TangName, LanguageID;
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
    Nazbparam varchar(2),
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
INSERT INTO dbo.ElemTablLanguage (ElemTablID, MethodP, Nazbparam, LanguageID)
SELECT ID AS ElemTablId, MethodP, Nazbparam, LanguageID
FROM ElemTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE ElemTablInvariant DROP CONSTRAINT DF_ElemTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.ElemTablInvariant DROP COLUMN __MethodP, MethodP, Nazbparam, LanguageID;
GO

--- Таблица ElemTablNew
--- Переименовываем ElemTablNew
sp_rename 'ElemTablNew', 'ElemTablNewInvariant';
GO
--- Создаем таблицу ElemTablNewLanguage
CREATE TABLE dbo.ElemTablNewLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ElemTablNewID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodP varchar(512),
    __MethodP as (left([MethodP],(50)))
);
GO
--- Создаем FK для ElemTablNewLanguage
ALTER TABLE dbo.ElemTablNewLanguage
ADD CONSTRAINT FK_ElemTablNewLanguage_ElemTablNewInvariant FOREIGN KEY (ElemTablNewID)
    REFERENCES dbo.ElemTablNewInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.ElemTablNewLanguage (ElemTablNewID, MethodP, LanguageID)
SELECT ID AS ElemTablNewId, MethodP, LanguageID
FROM ElemTablNewInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE ElemTablNewInvariant DROP CONSTRAINT DF_ElemTablNew_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.ElemTablNewInvariant DROP COLUMN __MethodP, MethodP, LanguageID;
GO

--- Таблица ElOpTabl
--- Переименовываем ElOpTabl
sp_rename 'ElOpTabl', 'ElOpTablInvariant';
GO
--- Создаем таблицу ElOpTablLanguage
CREATE TABLE dbo.ElOpTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ElOpTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodR varchar(1999),
    ZnN1 varchar(50),
    __MethodR as (left([MethodR],50))
);
GO
--- Создаем FK для ElOpTablLanguage
ALTER TABLE dbo.ElOpTablLanguage
ADD CONSTRAINT FK_ElOpTablLanguage_ElOpTablInvariant FOREIGN KEY (ElOpTablID)
    REFERENCES dbo.ElOpTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.ElOpTablLanguage (ElOpTablID, MethodR, ZnN1, LanguageID)
SELECT ID AS ElOpTablId, MethodR, ZnN1, LanguageID
FROM ElOpTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE ElOpTablInvariant DROP CONSTRAINT DF_ElOpTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.ElOpTablInvariant DROP COLUMN __MethodR, MethodR, ZnN1, LanguageID;
GO

--- Таблица EsOpTabl
--- Переименовываем EsOpTabl
sp_rename 'EsOpTabl', 'EsOpTablInvariant';
GO
--- Создаем таблицу EsOpTablLanguage
CREATE TABLE dbo.EsOpTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    EsOpTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodP varchar(1999),
    ZnP varchar(50),
    __MethodP as (left([MethodP],50))
);
GO
--- Создаем FK для EsOpTablLanguage
ALTER TABLE dbo.EsOpTablLanguage
ADD CONSTRAINT FK_EsOpTablLanguage_EsOpTablInvariant FOREIGN KEY (EsOpTablID)
    REFERENCES dbo.EsOpTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.EsOpTablLanguage (EsOpTablID, MethodP, ZnP, LanguageID)
SELECT ID AS EsOpTablId, MethodP, ZnP, LanguageID
FROM EsOpTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE EsOpTablInvariant DROP CONSTRAINT DF_EsOpTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.EsOpTablInvariant DROP COLUMN __MethodP, MethodP, ZnP, LanguageID;
GO

--- Таблица GrafTabl
--- Переименовываем GrafTabl
sp_rename 'GrafTabl', 'GrafTablInvariant';
GO
--- Создаем таблицу GrafTablLanguage
CREATE TABLE dbo.GrafTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    GrafTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    NameGraf varchar(30),
    Signatur varchar(2048)
);
GO
--- Создаем FK для GrafTablLanguage
ALTER TABLE dbo.GrafTablLanguage
ADD CONSTRAINT FK_GrafTablLanguage_GrafTablInvariant FOREIGN KEY (GrafTablID)
    REFERENCES dbo.GrafTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.GrafTablLanguage (GrafTablID, NameGraf, Signatur, LanguageID)
SELECT ID AS GrafTablId, NameGraf, Signatur, LanguageID
FROM GrafTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE GrafTablInvariant DROP CONSTRAINT DF_GrafTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.GrafTablInvariant DROP COLUMN NameGraf, Signatur, LanguageID;
GO

--- Таблица HardTabl
--- Переименовываем HardTabl
sp_rename 'HardTabl', 'HardTablInvariant';
GO
--- Создаем таблицу HardTablLanguage
CREATE TABLE dbo.HardTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    HardTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodH varchar(1999),
    __MethodH as (left([MethodH],(50)))
);
GO
--- Создаем FK для HardTablLanguage
ALTER TABLE dbo.HardTablLanguage
ADD CONSTRAINT FK_HardTablLanguage_HardTablInvariant FOREIGN KEY (HardTablID)
    REFERENCES dbo.HardTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.HardTablLanguage (HardTablID, MethodH, LanguageID)
SELECT ID AS HardTablId, MethodH, LanguageID
FROM HardTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE HardTablInvariant DROP CONSTRAINT DF_HardTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.HardTablInvariant DROP COLUMN __MethodH, MethodH, LanguageID;
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
    Expert varchar(32)
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
INSERT INTO dbo.HeadTablLanguage (HeadTablID, Expert, LanguageID)
SELECT HeadClue AS HeadTablId, Expert, LanguageID
FROM HeadTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE HeadTablInvariant DROP CONSTRAINT DF_HeadTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.HeadTablInvariant DROP COLUMN Expert, LanguageID;
GO

--- Таблица HeatExpn
--- Переименовываем HeatExpn
sp_rename 'HeatExpn', 'HeatExpnInvariant';
GO
--- Создаем таблицу HeatExpnLanguage
CREATE TABLE dbo.HeatExpnLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    HeatExpnID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodEx varchar(1999),
    Znak1 varchar(30),
    __MethodEx as (left([MethodEx],50))
);
GO
--- Создаем FK для HeatExpnLanguage
ALTER TABLE dbo.HeatExpnLanguage
ADD CONSTRAINT FK_HeatExpnLanguage_HeatExpnInvariant FOREIGN KEY (HeatExpnID)
    REFERENCES dbo.HeatExpnInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.HeatExpnLanguage (HeatExpnID, MethodEx, Znak1, LanguageID)
SELECT ID AS HeatExpnId, MethodEx, Znak1, LanguageID
FROM HeatExpnInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE HeatExpnInvariant DROP CONSTRAINT DF_HeatExpn_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.HeatExpnInvariant DROP COLUMN __MethodEx, MethodEx, Znak1, LanguageID;
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

--- Таблица LastModified
--- Переименовываем LastModified
sp_rename 'LastModified', 'LastModifiedInvariant';
GO
--- Создаем таблицу LastModifiedLanguage
CREATE TABLE dbo.LastModifiedLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    LastModifiedID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    Text varchar(200)
);
GO
--- Создаем FK для LastModifiedLanguage
ALTER TABLE dbo.LastModifiedLanguage
ADD CONSTRAINT FK_LastModifiedLanguage_LastModifiedInvariant FOREIGN KEY (LastModifiedID)
    REFERENCES dbo.LastModifiedInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.LastModifiedLanguage (LastModifiedID, Text, LanguageID)
SELECT ID AS LastModifiedId, Text, LanguageID
FROM LastModifiedInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE LastModifiedInvariant DROP CONSTRAINT DF_LastModified_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.LastModifiedInvariant DROP COLUMN Text, LanguageID;
GO

--- Таблица MechTabl
--- Переименовываем MechTabl
sp_rename 'MechTabl', 'MechTablInvariant';
GO
--- Создаем таблицу MechTablLanguage
CREATE TABLE dbo.MechTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    MechTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodK varchar(1999),
    ZnK varchar(20),
    __MethodK as (left([MethodK],50))
);
GO
--- Создаем FK для MechTablLanguage
ALTER TABLE dbo.MechTablLanguage
ADD CONSTRAINT FK_MechTablLanguage_MechTablInvariant FOREIGN KEY (MechTablID)
    REFERENCES dbo.MechTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.MechTablLanguage (MechTablID, MethodK, ZnK, LanguageID)
SELECT ID AS MechTablId, MethodK, ZnK, LanguageID
FROM MechTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE MechTablInvariant DROP CONSTRAINT DF_MechTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.MechTablInvariant DROP COLUMN __MethodK, MethodK, ZnK, LanguageID;
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

--- Таблица NlOpTabl
--- Переименовываем NlOpTabl
sp_rename 'NlOpTabl', 'NlOpTablInvariant';
GO
--- Создаем таблицу NlOpTablLanguage
CREATE TABLE dbo.NlOpTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    NlOpTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodR varchar(1999),
    ZnR varchar(20),
    __MethodR as (left([MethodR],50))
);
GO
--- Создаем FK для NlOpTablLanguage
ALTER TABLE dbo.NlOpTablLanguage
ADD CONSTRAINT FK_NlOpTablLanguage_NlOpTablInvariant FOREIGN KEY (NlOpTablID)
    REFERENCES dbo.NlOpTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.NlOpTablLanguage (NlOpTablID, MethodR, ZnR, LanguageID)
SELECT ID AS NlOpTablId, MethodR, ZnR, LanguageID
FROM NlOpTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE NlOpTablInvariant DROP CONSTRAINT DF_NlOpTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.NlOpTablInvariant DROP COLUMN __MethodR, MethodR, ZnR, LanguageID;
GO

--- Таблица PlavTabl
--- Переименовываем PlavTabl
sp_rename 'PlavTabl', 'PlavTablInvariant';
GO
--- Создаем таблицу PlavTablLanguage
CREATE TABLE dbo.PlavTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    PlavTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    PlavType varchar(1)
);
GO
--- Создаем FK для PlavTablLanguage
ALTER TABLE dbo.PlavTablLanguage
ADD CONSTRAINT FK_PlavTablLanguage_PlavTablInvariant FOREIGN KEY (PlavTablID)
    REFERENCES dbo.PlavTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.PlavTablLanguage (PlavTablID, PlavType, LanguageID)
SELECT ID AS PlavTablId, PlavType, LanguageID
FROM PlavTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE PlavTablInvariant DROP CONSTRAINT DF_PlavTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.PlavTablInvariant DROP COLUMN PlavType, LanguageID;
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

--- Таблица SuspTabl
--- Переименовываем SuspTabl
sp_rename 'SuspTabl', 'SuspTablInvariant';
GO
--- Создаем таблицу SuspTablLanguage
CREATE TABLE dbo.SuspTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    SuspTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodS varchar(1999),
    SuspName varchar(50),
    __MethodS as (left([MethodS],50))
);
GO
--- Создаем FK для SuspTablLanguage
ALTER TABLE dbo.SuspTablLanguage
ADD CONSTRAINT FK_SuspTablLanguage_SuspTablInvariant FOREIGN KEY (SuspTablID)
    REFERENCES dbo.SuspTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.SuspTablLanguage (SuspTablID, MethodS, SuspName, LanguageID)
SELECT ID AS SuspTablId, MethodS, SuspName, LanguageID
FROM SuspTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE SuspTablInvariant DROP CONSTRAINT DF_SuspTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.SuspTablInvariant DROP COLUMN __MethodS, MethodS, SuspName, LanguageID;
GO

--- Таблица - RefrTabl
-- Удаляем LanguageID ограничение
ALTER TABLE RefrTabl DROP CONSTRAINT DF_RefrTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'RefrTabl', 'RefrTablLanguage';
GO

