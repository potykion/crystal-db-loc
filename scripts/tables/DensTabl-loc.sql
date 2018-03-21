--- Таблица - DensTabl
--- Добавляем столбец LanguageID
ALTER TABLE dbo.DensTabl ADD LanguageID int NOT NULL DEFAULT(1);
GO
-- Удаляем ограничения и индексы
ALTER TABLE dbo.DensTabl DROP CONSTRAINT U_DensTabl;
GO
--- Добавляем Language к названию
sp_rename 'DensTabl', 'DensTablLanguage';
GO
