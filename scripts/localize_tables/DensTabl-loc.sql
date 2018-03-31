--- Таблица - DensTabl
-- Удаляем LanguageID ограничение
ALTER TABLE DensTabl DROP CONSTRAINT DF_DensTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'DensTabl', 'DensTablLanguage';
GO
