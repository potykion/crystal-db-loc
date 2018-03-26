--- Таблица - DensTabl
-- Удаляем ограничения и индексы
ALTER TABLE dbo.DensTabl DROP CONSTRAINT U_DensTabl;
GO
--- Добавляем Language к названию
sp_rename 'DensTabl', 'DensTablLanguage';
GO
