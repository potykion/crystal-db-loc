-- Создаем таблицу для возможных языков
CREATE TABLE dbo.Languages (
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(2)
);
-- Создаем языки
INSERT INTO dbo.Languages
(Name)
VALUES
('ru'),  ('en');
GO
