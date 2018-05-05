---Создаем PK для DensTabl
ALTER TABLE dbo.DensTabl ADD PRIMARY KEY (ID);
GO

---Создаем PK для RefrTabl
alter table [dbo].[RefrTabl]
drop constraint [PK_RefrTabl]
GO

ALTER TABLE [dbo].[RefrTabl]
ADD ID INT IDENTITY(1,1)
GO

ALTER TABLE [dbo].[RefrTabl]
ADD CONSTRAINT [PK_RefrTabl]
PRIMARY KEY CLUSTERED (ID)
GO