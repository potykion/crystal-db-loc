use Crystal;

--- Таблица - DielDiss
--- Добавляем столбец LanguageID
ALTER TABLE dbo.DielDiss ADD LanguageID int NOT NULL DEFAULT(1);
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
INSERT INTO dbo.Elastic1Language (Elastic1ID, MethodE, ZnE)
SELECT ID AS Elastic1Id, MethodE, ZnE
FROM Elastic1Invariant;
GO
-- Удаляем ограничения и индексы
ALTER TABLE dbo.Elastic1Invariant DROP CONSTRAINT U_Elastic1;
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.Elastic1Invariant DROP COLUMN __MethodE, MethodE, ZnE;
GO

--- Таблица - ElOpTabl
--- Добавляем столбец LanguageID
ALTER TABLE dbo.ElOpTabl ADD LanguageID int NOT NULL DEFAULT(1);
GO
--- Добавляем Language к названию
sp_rename 'ElOpTabl', 'ElOpTablLanguage';
GO

--- Таблица - EsOpTabl
--- Добавляем столбец LanguageID
ALTER TABLE dbo.EsOpTabl ADD LanguageID int NOT NULL DEFAULT(1);
GO
--- Добавляем Language к названию
sp_rename 'EsOpTabl', 'EsOpTablLanguage';
GO

--- Таблица - ElemTablNew
--- Добавляем столбец LanguageID
ALTER TABLE dbo.ElemTablNew ADD LanguageID int NOT NULL DEFAULT(1);
GO
--- Добавляем Language к названию
sp_rename 'ElemTablNew', 'ElemTablNewLanguage';
GO

--- Таблица - MechTabl
--- Добавляем столбец LanguageID
ALTER TABLE dbo.MechTabl ADD LanguageID int NOT NULL DEFAULT(1);
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
INSERT INTO dbo.MnOpTablLanguage (MnOpTablID, MethodK)
SELECT ID AS MnOpTablId, MethodK
FROM MnOpTablInvariant;
GO
-- Удаляем ограничения и индексы
ALTER TABLE dbo.MnOpTablInvariant DROP CONSTRAINT U_MnOpTabl;
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.MnOpTablInvariant DROP COLUMN __MethodK, MethodK;
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
INSERT INTO dbo.ModfTablLanguage (ModfTablID, SpaceGrp)
SELECT ID AS ModfTablId, SpaceGrp
FROM ModfTablInvariant;
GO
-- Удаляем ограничения и индексы
ALTER TABLE dbo.ModfTablInvariant DROP CONSTRAINT U_ModfTabl;
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.ModfTablInvariant DROP COLUMN SpaceGrp;
GO

--- Таблица - NlOpTabl
--- Добавляем столбец LanguageID
ALTER TABLE dbo.NlOpTabl ADD LanguageID int NOT NULL DEFAULT(1);
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
INSERT INTO dbo.PzElTablLanguage (PzElTablID, MethodPz)
SELECT ID AS PzElTablId, MethodPz
FROM PzElTablInvariant;
GO
-- Удаляем ограничения и индексы
ALTER TABLE dbo.PzElTablInvariant DROP CONSTRAINT U_PzElTabl;
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.PzElTablInvariant DROP COLUMN __MethodPz, MethodPz;
GO

--- Таблица - RefrTabl
--- Добавляем столбец LanguageID
ALTER TABLE dbo.RefrTabl ADD LanguageID int NOT NULL DEFAULT(1);
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
INSERT INTO dbo.RefrcIndLanguage (RefrcIndID, MethodIn)
SELECT ID AS RefrcIndId, MethodIn
FROM RefrcIndInvariant;
GO
-- Удаляем ограничения и индексы
ALTER TABLE dbo.RefrcIndInvariant DROP CONSTRAINT U_RefrcInd;
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.RefrcIndInvariant DROP COLUMN __MethodIn, MethodIn;
GO

--- Таблица - LastModified
--- Добавляем столбец LanguageID
ALTER TABLE dbo.LastModified ADD LanguageID int NOT NULL DEFAULT(1);
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
INSERT INTO dbo.DielectrLanguage (DielectrID, MethodY, Znak)
SELECT ID AS DielectrId, MethodY, Znak
FROM DielectrInvariant;
GO
-- Удаляем ограничения и индексы
ALTER TABLE dbo.DielectrInvariant DROP CONSTRAINT U_Dielectr;
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.DielectrInvariant DROP COLUMN __MethodY, MethodY, Znak;
GO
