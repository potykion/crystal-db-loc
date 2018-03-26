use Crystal_en;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.Properties DROP CONSTRAINT DF_Properties_TableName;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.EsOpTabl DROP CONSTRAINT U_EsOpTabl;

-- Удаляем ограничения и индексы
ALTER TABLE dbo.DensTabl DROP CONSTRAINT U_DensTabl;


-- Удаляем ограничения и индексы
ALTER TABLE dbo.HeadTabl DROP CONSTRAINT DF_HeadTabl_Expert;
ALTER TABLE dbo.HeadTabl DROP CONSTRAINT DF_HeadTabl_Help;
ALTER TABLE dbo.HeadTabl DROP CONSTRAINT DF_HeadTabl_System;

-- Удаляем ограничения и индексы
ALTER TABLE dbo.HardTabl DROP CONSTRAINT U_HardTabl;
