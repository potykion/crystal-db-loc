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
