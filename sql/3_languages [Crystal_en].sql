use Crystal_en;
GO
CREATE TABLE dbo.Languages (
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(2)
);
INSERT INTO dbo.Languages
(Name)
VALUES
('ru'),  ('en');
GO
ALTER TABLE dbo.AcOpTabl ADD LanguageID int NOT NULL CONSTRAINT DF_AcOpTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.Bibliogr ADD LanguageID int NOT NULL CONSTRAINT DF_Bibliogr_LanguageID DEFAULT(2);
ALTER TABLE dbo.ConstSel ADD LanguageID int NOT NULL CONSTRAINT DF_ConstSel_LanguageID DEFAULT(2);
ALTER TABLE dbo.CuryTabl ADD LanguageID int NOT NULL CONSTRAINT DF_CuryTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.DecrTabl ADD LanguageID int NOT NULL CONSTRAINT DF_DecrTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.DensTabl ADD LanguageID int NOT NULL CONSTRAINT DF_DensTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.DielDiss ADD LanguageID int NOT NULL CONSTRAINT DF_DielDiss_LanguageID DEFAULT(2);
ALTER TABLE dbo.Dielectr ADD LanguageID int NOT NULL CONSTRAINT DF_Dielectr_LanguageID DEFAULT(2);
ALTER TABLE dbo.Elastic1 ADD LanguageID int NOT NULL CONSTRAINT DF_Elastic1_LanguageID DEFAULT(2);
ALTER TABLE dbo.ElemTabl ADD LanguageID int NOT NULL CONSTRAINT DF_ElemTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.ElemTablNew ADD LanguageID int NOT NULL CONSTRAINT DF_ElemTablNew_LanguageID DEFAULT(2);
ALTER TABLE dbo.ElOpTabl ADD LanguageID int NOT NULL CONSTRAINT DF_ElOpTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.EsOpTabl ADD LanguageID int NOT NULL CONSTRAINT DF_EsOpTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.GrafTabl ADD LanguageID int NOT NULL CONSTRAINT DF_GrafTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.HardTabl ADD LanguageID int NOT NULL CONSTRAINT DF_HardTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.HeadTabl ADD LanguageID int NOT NULL CONSTRAINT DF_HeadTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.HeatExpn ADD LanguageID int NOT NULL CONSTRAINT DF_HeatExpn_LanguageID DEFAULT(2);
ALTER TABLE dbo.HeatTabl ADD LanguageID int NOT NULL CONSTRAINT DF_HeatTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.LastModified ADD LanguageID int NOT NULL CONSTRAINT DF_LastModified_LanguageID DEFAULT(2);
ALTER TABLE dbo.MechTabl ADD LanguageID int NOT NULL CONSTRAINT DF_MechTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.MnOpTabl ADD LanguageID int NOT NULL CONSTRAINT DF_MnOpTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.ModfTabl ADD LanguageID int NOT NULL CONSTRAINT DF_ModfTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.NlOpTabl ADD LanguageID int NOT NULL CONSTRAINT DF_NlOpTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.PlavTabl ADD LanguageID int NOT NULL CONSTRAINT DF_PlavTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.Properties ADD LanguageID int NOT NULL CONSTRAINT DF_Properties_LanguageID DEFAULT(2);
ALTER TABLE dbo.PzElTabl ADD LanguageID int NOT NULL CONSTRAINT DF_PzElTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.RefrcInd ADD LanguageID int NOT NULL CONSTRAINT DF_RefrcInd_LanguageID DEFAULT(2);
ALTER TABLE dbo.SuspTabl ADD LanguageID int NOT NULL CONSTRAINT DF_SuspTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.Wavepure ADD LanguageID int NOT NULL CONSTRAINT DF_Wavepure_LanguageID DEFAULT(2);
ALTER TABLE dbo.RefrTabl ADD LanguageID int NOT NULL CONSTRAINT DF_RefrTabl_LanguageID DEFAULT(2);
