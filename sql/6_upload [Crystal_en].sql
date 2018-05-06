use Crystal_en;
GO

insert into Crystal.dbo.BibliogrLanguage
(BibliogrID, LanguageID, Authors, Source, Title)
select 
BibliogrID, LanguageID, Authors, Source, Title
from Crystal_en.dbo.BibliogrLanguage
where BibliogrID in (SELECT BibliogrID 
FROM Crystal.dbo.BibliogrLanguage)
;
insert into Crystal.dbo.ElemTablNewLanguage
(ElemTablNewID, LanguageID, MethodP)
select 
ElemTablNewID, LanguageID, MethodP
from Crystal_en.dbo.ElemTablNewLanguage
;
insert into Crystal.dbo.HeadTablLanguage
(HeadTablID, LanguageID, Expert)
select 
HeadTablID, LanguageID, Expert
from Crystal_en.dbo.HeadTablLanguage
;
insert into Crystal.dbo.PropertiesLanguage
(PropertiesID, LanguageID, NAZVPROP)
select 
PropertiesID, LanguageID, NAZVPROP
from Crystal_en.dbo.PropertiesLanguage
;
