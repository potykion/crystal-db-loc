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
INSERT INTO dbo.ElemTablLanguage (ElemTablID, MethodP)
SELECT ID AS ElemTablId, MethodP
FROM ElemTablInvariant;
GO
-- Удаляем ограничения и индексы
DROP INDEX IX_ElemTabl ON ElemTablInvariant;
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.ElemTablInvariant DROP COLUMN __MethodP, MethodP;
GO
