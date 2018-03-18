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
INSERT INTO dbo.HeadTablLanguage (HeadTablID, Expert, System)
SELECT HeadClue AS HeadTablId, Expert, System
FROM HeadTablInvariant;
GO
-- Удаляем "русские" столбцы, а так же зависимости
ALTER TABLE dbo.HeadTablInvariant DROP CONSTRAINT DF_HeadTabl_Expert;
ALTER TABLE dbo.HeadTablInvariant DROP CONSTRAINT DF_HeadTabl_System;
ALTER TABLE dbo.HeadTablInvariant DROP COLUMN Expert, System;
GO
