--- Таблица - RefrTabl
--- Добавляем столбец LanguageID
ALTER TABLE dbo.RefrTabl ADD LanguageID int NOT NULL DEFAULT(1);
GO
--- Добавляем Language к названию
sp_rename 'RefrTabl', 'RefrTablLanguage';
GO
