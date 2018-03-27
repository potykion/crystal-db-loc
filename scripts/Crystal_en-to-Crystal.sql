insert into Crystal.dbo.EsOpTablLanguage 
(HeadClue, SingCode, LengWave, ZnP, P, ErrP, MethodP, Bknumber, LanguageID)
select HeadClue, SingCode = (case SingCode 
            when 'c' then 'к'
            when 'h' then 'г'
            when 'm' then 'м'
            when 'r' then 'р'
            when 're' then 'рэ'
            when 't' then 'т'
            when 'tg' then 'тг'
            when 'tr' then 'тр'
            end), LengWave, ZnP, P, ErrP, MethodP, Bknumber, LanguageID
from Crystal_en.dbo.EsOpTablLanguage

insert into Crystal.dbo.ElemTablNewLanguage 
(HeadClue, SingCode, A, AErr, B, BErr, C, CErr, Alpha, AlphaErr, Beta, BetaErr, Gamma, GammaErr, MethodP, Bknumber, LanguageID)
select HeadClue, SingCode = (case SingCode 
            when 'c' then 'к'
            when 'h' then 'г'
            when 'm' then 'м'
            when 'r' then 'р'
            when 're' then 'рэ'
            when 't' then 'т'
            when 'tg' then 'тг'
            when 'tr' then 'тр'
            end), A, AErr, B, BErr, C, CErr, Alpha, AlphaErr, Beta, BetaErr, Gamma, GammaErr, MethodP, Bknumber, LanguageID
from Crystal_en.dbo.ElemTablNewLanguage

insert into Crystal.dbo.RefrTablLanguage 
(HeadClue, Referat, LanguageID)
select HeadClue, Referat, LanguageID
from Crystal_en.dbo.RefrTablLanguage

insert into Crystal.dbo.HardTablLanguage 
(HeadClue, SingCode, Hard1, Hard2, ErrHard, Mohs, ErrMohs, MethodH, Bknumber, LanguageID)
select HeadClue, SingCode = (case SingCode 
            when 'c' then 'к'
            when 'h' then 'г'
            when 'm' then 'м'
            when 'r' then 'р'
            when 're' then 'рэ'
            when 't' then 'т'
            when 'tg' then 'тг'
            when 'tr' then 'тр'
            end), Hard1, Hard2, ErrHard, Mohs, ErrMohs, MethodH, Bknumber, LanguageID
from Crystal_en.dbo.HardTablLanguage

insert into Crystal.dbo.Properties_ComplexLanguage 
(NOMPROP, NAZVPROP, LanguageID)
select NOMPROP, NAZVPROP, LanguageID
from Crystal_en.dbo.Properties_ComplexLanguage

insert into Crystal.dbo.PropertiesLanguage 
(PropertiesID, LanguageID, NAZVPROP)
select PropertiesID, LanguageID, NAZVPROP
from Crystal_en.dbo.PropertiesLanguage

insert into Crystal.dbo.DensTablLanguage 
(HeadClue, SingCode, Density, ErrDens, MethodD, Bknumber, LanguageID)
select HeadClue, SingCode = (case SingCode 
            when 'c' then 'к'
            when 'h' then 'г'
            when 'm' then 'м'
            when 'r' then 'р'
            when 're' then 'рэ'
            when 't' then 'т'
            when 'tg' then 'тг'
            when 'tr' then 'тр'
            end), Density, ErrDens, MethodD, Bknumber, LanguageID
from Crystal_en.dbo.DensTablLanguage

insert into Crystal.dbo.HeadTablLanguage 
(HeadTablID, LanguageID, Expert, System)
select HeadTablID, LanguageID, Expert, System
from Crystal_en.dbo.HeadTablLanguage

insert into Crystal.dbo.BibliogrLanguage 
(BibliogrID, LanguageID, Authors, Source, Title)
select BibliogrID, LanguageID, Authors, Source, Title
from Crystal_en.dbo.BibliogrLanguage
where BibliogrID in (SELECT BibliogrID
FROM Crystal.dbo.BibliogrLanguage)
