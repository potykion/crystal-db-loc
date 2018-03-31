--- Таблица - RefrTabl
-- Удаляем LanguageID ограничение
ALTER TABLE RefrTabl DROP CONSTRAINT DF_RefrTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'RefrTabl', 'RefrTablLanguage';
GO
