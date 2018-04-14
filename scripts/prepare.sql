use Crystal;
GO

-- Отключаем триггеры
sp_msforeachtable 'ALTER TABLE ? DISABLE TRIGGER all'
GO

---Создаем PK для DensTabl
ALTER TABLE dbo.DensTabl ADD PRIMARY KEY (ID);
GO