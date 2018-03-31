use Crystal;
ALTER TABLE dbo.SistTabl DROP CONSTRAINT U_SistTabl;
ALTER TABLE dbo.Wavepure DROP CONSTRAINT U_WavePure;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.ModfTabl DROP CONSTRAINT U_ModfTabl;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.GrafTabl DROP CONSTRAINT U_GrafTabl;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.PlavTabl DROP CONSTRAINT U_PlavTabl;
-- Удаляем ограничения и индексы
DROP INDEX IX_ElemTabl ON ElemTabl;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.MnOpTabl DROP CONSTRAINT U_MnOpTabl;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.SuspTabl DROP CONSTRAINT U_SuspTabl;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.RefrcInd DROP CONSTRAINT U_RefrcInd;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.CuryTabl DROP CONSTRAINT U_CuryTabl;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.Elastic1 DROP CONSTRAINT U_Elastic1;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.AcOpTabl DROP CONSTRAINT U_AcOpTabl;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.NlOpTabl DROP CONSTRAINT U_NlOpTabl;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.DecrTabl DROP CONSTRAINT U_DecrTabl;

-- Удаляем ограничения и индексы
ALTER TABLE dbo.Dielectr DROP CONSTRAINT U_Dielectr;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.DielDiss DROP CONSTRAINT U_DielDiss;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.PzElTabl DROP CONSTRAINT U_PzElTabl;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.MechTabl DROP CONSTRAINT U_MechTabl;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.HeatTabl DROP CONSTRAINT U_HeatTabl;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.HeatExpn DROP CONSTRAINT U_HeatExpn;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.ElOpTabl DROP CONSTRAINT U_ElOpTabl;
-- Удаляем ограничения и индексы
ALTER TABLE dbo.ConstSel DROP CONSTRAINT U_ConstSel;
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
