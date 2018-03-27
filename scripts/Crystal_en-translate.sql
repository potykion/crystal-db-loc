use Crystal_en;
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
    LanguageID INT NOT NULL DEFAULT 2,
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

--- Таблица - EsOpTabl
-- Удаляем LanguageID ограничение
ALTER TABLE EsOpTabl DROP CONSTRAINT DF_EsOpTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'EsOpTabl', 'EsOpTablLanguage';
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
    LanguageID INT NOT NULL DEFAULT 2,
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

--- Таблица - DensTabl
-- Удаляем LanguageID ограничение
ALTER TABLE DensTabl DROP CONSTRAINT DF_DensTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'DensTabl', 'DensTablLanguage';
GO

--- Таблица - RefrTabl
-- Удаляем LanguageID ограничение
ALTER TABLE RefrTabl DROP CONSTRAINT DF_RefrTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'RefrTabl', 'RefrTablLanguage';
GO

--- Таблица - Properties_Complex
-- Удаляем LanguageID ограничение
ALTER TABLE Properties_Complex DROP CONSTRAINT DF_Properties_Complex_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'Properties_Complex', 'Properties_ComplexLanguage';
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
    LanguageID INT NOT NULL DEFAULT 2,
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

--- Таблица - ElemTablNew
-- Удаляем LanguageID ограничение
ALTER TABLE ElemTablNew DROP CONSTRAINT DF_ElemTablNew_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'ElemTablNew', 'ElemTablNewLanguage';
GO

--- Таблица - HardTabl
-- Удаляем LanguageID ограничение
ALTER TABLE HardTabl DROP CONSTRAINT DF_HardTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'HardTabl', 'HardTablLanguage';
GO

