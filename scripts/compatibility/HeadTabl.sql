CREATE VIEW dbo.HeadTabl
WITH SCHEMABINDING
AS select Expert, System, Help, Class, HeadTablInvariant.HeadClue
from dbo.HeadTablLanguage
join dbo.HeadTablInvariant on
HeadTablLanguage.HeadTablID = HeadTablInvariant.HeadClue
where LanguageID = 1