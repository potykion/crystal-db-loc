sp_msforeachtable 'ALTER TABLE ? DISABLE TRIGGER all'
GO
ALTER TABLE dbo.Properties DROP CONSTRAINT DF_Properties_TableName;
GO
ALTER TABLE dbo.HeadTabl DROP CONSTRAINT DF_HeadTabl_Expert;
GO
ALTER TABLE dbo.HeadTabl DROP CONSTRAINT DF_HeadTabl_Help;
GO
ALTER TABLE dbo.HeadTabl DROP CONSTRAINT DF_HeadTabl_System;
GO
ALTER TABLE dbo.AcOpTabl DROP CONSTRAINT U_AcOpTabl;
GO
ALTER TABLE dbo.ConstSel DROP CONSTRAINT U_ConstSel;
GO
ALTER TABLE dbo.CuryTabl DROP CONSTRAINT U_CuryTabl;
GO
ALTER TABLE dbo.DecrTabl DROP CONSTRAINT U_DecrTabl;
GO
ALTER TABLE dbo.DensTabl DROP CONSTRAINT U_DensTabl;
GO
ALTER TABLE dbo.DielDiss DROP CONSTRAINT U_DielDiss;
GO
ALTER TABLE dbo.Dielectr DROP CONSTRAINT U_Dielectr;
GO
ALTER TABLE dbo.Elastic1 DROP CONSTRAINT U_Elastic1;
GO
ALTER TABLE dbo.ElemTabl DROP CONSTRAINT U_ElemTabl;
GO
ALTER TABLE dbo.ElOpTabl DROP CONSTRAINT U_ElOpTabl;
GO
ALTER TABLE dbo.EsOpTabl DROP CONSTRAINT U_EsOpTabl;
GO
ALTER TABLE dbo.GrafTabl DROP CONSTRAINT U_GrafTabl;
GO
ALTER TABLE dbo.HardTabl DROP CONSTRAINT U_HardTabl;
GO
ALTER TABLE dbo.HeatExpn DROP CONSTRAINT U_HeatExpn;
GO
ALTER TABLE dbo.HeatTabl DROP CONSTRAINT U_HeatTabl;
GO
ALTER TABLE dbo.LitrTabl DROP CONSTRAINT U_LitrTabl;
GO
ALTER TABLE dbo.MechTabl DROP CONSTRAINT U_MechTabl;
GO
ALTER TABLE dbo.MnOpTabl DROP CONSTRAINT U_MnOpTabl;
GO
ALTER TABLE dbo.ModfTabl DROP CONSTRAINT U_ModfTabl;
GO
ALTER TABLE dbo.NlOpTabl DROP CONSTRAINT U_NlOpTabl;
GO
ALTER TABLE dbo.PlavTabl DROP CONSTRAINT U_PlavTabl;
GO
ALTER TABLE dbo.PzElTabl DROP CONSTRAINT U_PzElTabl;
GO
ALTER TABLE dbo.RefrcInd DROP CONSTRAINT U_RefrcInd;
GO
ALTER TABLE dbo.SistTabl DROP CONSTRAINT U_SistTabl;
GO
ALTER TABLE dbo.SuspTabl DROP CONSTRAINT U_SuspTabl;
GO
ALTER TABLE dbo.WavePure DROP CONSTRAINT U_WavePure;
