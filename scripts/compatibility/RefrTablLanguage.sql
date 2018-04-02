CREATE VIEW dbo.RefrTabl
WITH SCHEMABINDING
AS select HeadClue, Referat
from dbo.RefrTablLanguage
where LanguageId = 1