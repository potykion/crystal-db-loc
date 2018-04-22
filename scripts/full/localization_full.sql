use Crystal;
GO

-- Отключаем триггеры
sp_msforeachtable 'ALTER TABLE ? DISABLE TRIGGER all'
GO

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

use Crystal
GO
ALTER TABLE dbo.Properties DROP CONSTRAINT DF_Properties_TableName;
GO
ALTER TABLE dbo.HeadTabl DROP CONSTRAINT DF_HeadTabl_Expert;
GO
ALTER TABLE dbo.HeadTabl DROP CONSTRAINT DF_HeadTabl_Help;
GO
ALTER TABLE dbo.HeadTabl DROP CONSTRAINT DF_HeadTabl_System;
GO
ALTER TABLE dbo.WavePure DROP CONSTRAINT U_WavePure;
GO
DROP INDEX IX_ElemTabl ON ElemTabl;
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

use Crystal_en
GO
ALTER TABLE dbo.WavePure DROP CONSTRAINT U_WavePure;
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

use Crystal;
go
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

use Crystal;
ALTER TABLE dbo.ModfTabl ADD LanguageID int NOT NULL CONSTRAINT DF_ModfTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.GrafTabl ADD LanguageID int NOT NULL CONSTRAINT DF_GrafTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.PlavTabl ADD LanguageID int NOT NULL CONSTRAINT DF_PlavTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.ElemTabl ADD LanguageID int NOT NULL CONSTRAINT DF_ElemTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.MnOpTabl ADD LanguageID int NOT NULL CONSTRAINT DF_MnOpTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.SuspTabl ADD LanguageID int NOT NULL CONSTRAINT DF_SuspTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.RefrcInd ADD LanguageID int NOT NULL CONSTRAINT DF_RefrcInd_LanguageID DEFAULT(1);
ALTER TABLE dbo.CuryTabl ADD LanguageID int NOT NULL CONSTRAINT DF_CuryTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.Elastic1 ADD LanguageID int NOT NULL CONSTRAINT DF_Elastic1_LanguageID DEFAULT(1);
ALTER TABLE dbo.AcOpTabl ADD LanguageID int NOT NULL CONSTRAINT DF_AcOpTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.NlOpTabl ADD LanguageID int NOT NULL CONSTRAINT DF_NlOpTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.DecrTabl ADD LanguageID int NOT NULL CONSTRAINT DF_DecrTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.LastModified ADD LanguageID int NOT NULL CONSTRAINT DF_LastModified_LanguageID DEFAULT(1);
ALTER TABLE dbo.Dielectr ADD LanguageID int NOT NULL CONSTRAINT DF_Dielectr_LanguageID DEFAULT(1);
ALTER TABLE dbo.DielDiss ADD LanguageID int NOT NULL CONSTRAINT DF_DielDiss_LanguageID DEFAULT(1);
ALTER TABLE dbo.PzElTabl ADD LanguageID int NOT NULL CONSTRAINT DF_PzElTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.MechTabl ADD LanguageID int NOT NULL CONSTRAINT DF_MechTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.HeatTabl ADD LanguageID int NOT NULL CONSTRAINT DF_HeatTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.HeatExpn ADD LanguageID int NOT NULL CONSTRAINT DF_HeatExpn_LanguageID DEFAULT(1);
ALTER TABLE dbo.ElOpTabl ADD LanguageID int NOT NULL CONSTRAINT DF_ElOpTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.ConstSel ADD LanguageID int NOT NULL CONSTRAINT DF_ConstSel_LanguageID DEFAULT(1);
ALTER TABLE dbo.Properties ADD LanguageID int NOT NULL CONSTRAINT DF_Properties_LanguageID DEFAULT(1);
ALTER TABLE dbo.EsOpTabl ADD LanguageID int NOT NULL CONSTRAINT DF_EsOpTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.Bibliogr ADD LanguageID int NOT NULL CONSTRAINT DF_Bibliogr_LanguageID DEFAULT(1);
ALTER TABLE dbo.DensTabl ADD LanguageID int NOT NULL CONSTRAINT DF_DensTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.RefrTabl ADD LanguageID int NOT NULL CONSTRAINT DF_RefrTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.HeadTabl ADD LanguageID int NOT NULL CONSTRAINT DF_HeadTabl_LanguageID DEFAULT(1);
ALTER TABLE dbo.ElemTablNew ADD LanguageID int NOT NULL CONSTRAINT DF_ElemTablNew_LanguageID DEFAULT(1);
ALTER TABLE dbo.HardTabl ADD LanguageID int NOT NULL CONSTRAINT DF_HardTabl_LanguageID DEFAULT(1);
go

use Crystal_en;
ALTER TABLE dbo.ModfTabl ADD LanguageID int NOT NULL CONSTRAINT DF_ModfTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.GrafTabl ADD LanguageID int NOT NULL CONSTRAINT DF_GrafTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.PlavTabl ADD LanguageID int NOT NULL CONSTRAINT DF_PlavTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.ElemTabl ADD LanguageID int NOT NULL CONSTRAINT DF_ElemTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.MnOpTabl ADD LanguageID int NOT NULL CONSTRAINT DF_MnOpTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.SuspTabl ADD LanguageID int NOT NULL CONSTRAINT DF_SuspTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.RefrcInd ADD LanguageID int NOT NULL CONSTRAINT DF_RefrcInd_LanguageID DEFAULT(2);
ALTER TABLE dbo.CuryTabl ADD LanguageID int NOT NULL CONSTRAINT DF_CuryTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.Elastic1 ADD LanguageID int NOT NULL CONSTRAINT DF_Elastic1_LanguageID DEFAULT(2);
ALTER TABLE dbo.AcOpTabl ADD LanguageID int NOT NULL CONSTRAINT DF_AcOpTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.NlOpTabl ADD LanguageID int NOT NULL CONSTRAINT DF_NlOpTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.DecrTabl ADD LanguageID int NOT NULL CONSTRAINT DF_DecrTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.LastModified ADD LanguageID int NOT NULL CONSTRAINT DF_LastModified_LanguageID DEFAULT(2);
ALTER TABLE dbo.Dielectr ADD LanguageID int NOT NULL CONSTRAINT DF_Dielectr_LanguageID DEFAULT(2);
ALTER TABLE dbo.DielDiss ADD LanguageID int NOT NULL CONSTRAINT DF_DielDiss_LanguageID DEFAULT(2);
ALTER TABLE dbo.PzElTabl ADD LanguageID int NOT NULL CONSTRAINT DF_PzElTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.MechTabl ADD LanguageID int NOT NULL CONSTRAINT DF_MechTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.HeatTabl ADD LanguageID int NOT NULL CONSTRAINT DF_HeatTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.HeatExpn ADD LanguageID int NOT NULL CONSTRAINT DF_HeatExpn_LanguageID DEFAULT(2);
ALTER TABLE dbo.ElOpTabl ADD LanguageID int NOT NULL CONSTRAINT DF_ElOpTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.ConstSel ADD LanguageID int NOT NULL CONSTRAINT DF_ConstSel_LanguageID DEFAULT(2);
ALTER TABLE dbo.Properties ADD LanguageID int NOT NULL CONSTRAINT DF_Properties_LanguageID DEFAULT(2);
ALTER TABLE dbo.EsOpTabl ADD LanguageID int NOT NULL CONSTRAINT DF_EsOpTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.Bibliogr ADD LanguageID int NOT NULL CONSTRAINT DF_Bibliogr_LanguageID DEFAULT(2);
ALTER TABLE dbo.DensTabl ADD LanguageID int NOT NULL CONSTRAINT DF_DensTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.RefrTabl ADD LanguageID int NOT NULL CONSTRAINT DF_RefrTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.HeadTabl ADD LanguageID int NOT NULL CONSTRAINT DF_HeadTabl_LanguageID DEFAULT(2);
ALTER TABLE dbo.ElemTablNew ADD LanguageID int NOT NULL CONSTRAINT DF_ElemTablNew_LanguageID DEFAULT(2);
ALTER TABLE dbo.HardTabl ADD LanguageID int NOT NULL CONSTRAINT DF_HardTabl_LanguageID DEFAULT(2);
go

insert into Crystal.dbo.ModfTabl
(HeadClue, SingCode, SuprTemp, SP2, ErrSupr, PointGrp, SpaceGrp, Z, Bknumber, LanguageID)
select
HeadClue, SingCode = (case SingCode
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), SuprTemp, SP2, ErrSupr, PointGrp, SpaceGrp, Z, Bknumber, LanguageID
from Crystal_en.dbo.ModfTabl;
insert into Crystal.dbo.GrafTabl
(HeadClue, NompClue, NameGraf, Signatur, LanguageID)
select
HeadClue, NompClue, NameGraf, Signatur, LanguageID
from Crystal_en.dbo.GrafTabl;
insert into Crystal.dbo.PlavTabl
(HeadClue, PlavType, PlavTemp, ErrPlav, Bknumber, LanguageID)
select
HeadClue, PlavType, PlavTemp, ErrPlav, Bknumber, LanguageID
from Crystal_en.dbo.PlavTabl;
insert into Crystal.dbo.ElemTabl
(HeadClue, SingCode, Nazbparam, Znparam, Errparam, NazvAngl, ZnAngle, ErrAngl, MethodP, Bknumber, LanguageID)
select
HeadClue, SingCode = (case SingCode
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), Nazbparam, Znparam, Errparam, NazvAngl, ZnAngle, ErrAngl, MethodP, Bknumber, LanguageID
from Crystal_en.dbo.ElemTabl;
insert into Crystal.dbo.MnOpTabl
(HeadClue, SingCode, Lyambda, Nw, N2w, Znakcon, K, ErrKj, MethodK, Bknumber, LanguageID)
select
HeadClue, SingCode = (case SingCode
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), Lyambda, Nw, N2w, Znakcon, K, ErrKj, MethodK, Bknumber, LanguageID
from Crystal_en.dbo.MnOpTabl;
insert into Crystal.dbo.SuspTabl
(HeadClue, Temper, SuspName, Suspense, ErrSusp, MethodS, Bknumber, LanguageID)
select
HeadClue, Temper, SuspName, Suspense, ErrSusp, MethodS, Bknumber, LanguageID
from Crystal_en.dbo.SuspTabl;
insert into Crystal.dbo.RefrcInd
(HeadClue, SingCode, Temper, WaveLeng, NazbIndx, ZnachInd, ErrIndex, MethodIn, Bknumber, LanguageID)
select
HeadClue, SingCode = (case SingCode
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), Temper, WaveLeng, NazbIndx, ZnachInd, ErrIndex, MethodIn, Bknumber, LanguageID
from Crystal_en.dbo.RefrcInd;
insert into Crystal.dbo.CuryTabl
(HeadClue, CuryTemp, ErrCury, Oboztran, Bknumber, LanguageID)
select
HeadClue, CuryTemp, ErrCury, Oboztran, Bknumber, LanguageID
from Crystal_en.dbo.CuryTabl;
insert into Crystal.dbo.Elastic1
(HeadClue, SingCode, TemperEl, CondClu1, ZnE, E1, ErrE, MethodE, Bknumber, LanguageID)
select
HeadClue, SingCode = (case SingCode
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), TemperEl, CondClu1, ZnE, E1, ErrE, MethodE, Bknumber, LanguageID
from Crystal_en.dbo.Elastic1;
insert into Crystal.dbo.AcOpTabl
(HeadClue, SingCode, WaveLeng, Nzv, Uzv, Nsv, E, M1, M2, M3, Bknumber, LanguageID)
select
HeadClue, SingCode = (case SingCode
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), WaveLeng, Nzv, Uzv, Nsv, E, M1, M2, M3, Bknumber, LanguageID
from Crystal_en.dbo.AcOpTabl;
insert into Crystal.dbo.NlOpTabl
(HeadClue, SingCode, Lyambda, ZnR, Rij, ErrRij, MethodR, Bknumber, LanguageID)
select
HeadClue, SingCode = (case SingCode
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), Lyambda, ZnR, Rij, ErrRij, MethodR, Bknumber, LanguageID
from Crystal_en.dbo.NlOpTabl;
insert into Crystal.dbo.DecrTabl
(HeadClue, SingCode, Nzv, Uzv, WaveType, WaveSpeed, Decrement, DecrFreq, Bknumber, LanguageID)
select
HeadClue, SingCode = (case SingCode
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), Nzv, Uzv, WaveType, WaveSpeed, Decrement, DecrFreq, Bknumber, LanguageID
from Crystal_en.dbo.DecrTabl;
insert into Crystal.dbo.LastModified
(Text, LastModified, LanguageID)
select
Text, LastModified, LanguageID
from Crystal_en.dbo.LastModified;
insert into Crystal.dbo.Dielectr
(HeadClue, SingCode, FreqDiel, Temper_2, Constant, Znak, Diel, ErrY, MethodY, Bknumber, LanguageID)
select
HeadClue, SingCode = (case SingCode
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), FreqDiel, Temper_2, Constant, Znak, Diel, ErrY, MethodY, Bknumber, LanguageID
from Crystal_en.dbo.Dielectr;
insert into Crystal.dbo.DielDiss
(HeadClue, SingCode, FreqDiss, Temper_3, TangName, TangentD, ErrDiss, MethodY, Bknumber, LanguageID)
select
HeadClue, SingCode = (case SingCode
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), FreqDiss, Temper_3, TangName, TangentD, ErrDiss, MethodY, Bknumber, LanguageID
from Crystal_en.dbo.DielDiss;
insert into Crystal.dbo.PzElTabl
(HeadClue, SingCode, FreqPzEl, ConstD, D, ErrD, MethodPz, Bknumber, LanguageID)
select
HeadClue, SingCode = (case SingCode
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), FreqPzEl, ConstD, D, ErrD, MethodPz, Bknumber, LanguageID
from Crystal_en.dbo.PzElTabl;
insert into Crystal.dbo.MechTabl
(HeadClue, SingCode, Bknumber, FreqCons, Temper, ZnK, K, ErrK, MethodK, LanguageID)
select
HeadClue, SingCode = (case SingCode
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), Bknumber, FreqCons, Temper, ZnK, K, ErrK, MethodK, LanguageID
from Crystal_en.dbo.MechTabl;
insert into Crystal.dbo.HeatTabl
(HeadClue, Temperat, ZnC, C, ErrC, MethodC, Bknumber, LanguageID)
select
HeadClue, Temperat, ZnC, C, ErrC, MethodC, Bknumber, LanguageID
from Crystal_en.dbo.HeatTabl;
insert into Crystal.dbo.HeatExpn
(HeadClue, SingCode, DataType, Temper_1, Temper_2, Znak1, S11, ErrHExp, MethodEx, Bknumber, LanguageID)
select
HeadClue, SingCode = (case SingCode
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), DataType, Temper_1, Temper_2, Znak1, S11, ErrHExp, MethodEx, Bknumber, LanguageID
from Crystal_en.dbo.HeatExpn;
insert into Crystal.dbo.ElOpTabl
(HeadClue, SingCode, WvLeng, ZnN1, R, ErrR, MethodR, Bknumber, LanguageID)
select
HeadClue, SingCode = (case SingCode
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), WvLeng, ZnN1, R, ErrR, MethodR, Bknumber, LanguageID
from Crystal_en.dbo.ElOpTabl;
insert into Crystal.dbo.ConstSel
(HeadClue, SingCode, Equation, NazvSel, ZnachSel, Measure, Bknumber, LanguageID)
select
HeadClue, SingCode = (case SingCode
when 'c' then 'к'
when 'h' then 'г'
when 'm' then 'м'
when 'r' then 'р'
when 're' then 'рэ'
when 't' then 'т'
when 'tg' then 'тг'
when 'tr' then 'тр'
end), Equation, NazvSel, ZnachSel, Measure, Bknumber, LanguageID
from Crystal_en.dbo.ConstSel;

use Crystal;


--- Таблица - DielDiss
-- Удаляем LanguageID ограничение
ALTER TABLE DielDiss DROP CONSTRAINT DF_DielDiss_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'DielDiss', 'DielDissLanguage';
GO

--- Таблица Elastic1
--- Переименовываем Elastic1
sp_rename 'Elastic1', 'Elastic1Invariant';
GO
--- Создаем таблицу Elastic1Language
CREATE TABLE dbo.Elastic1Language
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Elastic1ID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodE varchar(1999),
    ZnE varchar(20),
    __MethodE as (left([MethodE],50))
);
GO
--- Создаем FK для Elastic1Language
ALTER TABLE dbo.Elastic1Language
ADD CONSTRAINT FK_Elastic1Language_Elastic1Invariant FOREIGN KEY (Elastic1ID)
    REFERENCES dbo.Elastic1Invariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.Elastic1Language (Elastic1ID, MethodE, ZnE, LanguageID)
SELECT ID AS Elastic1Id, MethodE, ZnE, LanguageID
FROM Elastic1Invariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE Elastic1Invariant DROP CONSTRAINT DF_Elastic1_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.Elastic1Invariant DROP COLUMN __MethodE, MethodE, ZnE, LanguageID;
GO

--- Таблица - ElOpTabl
-- Удаляем LanguageID ограничение
ALTER TABLE ElOpTabl DROP CONSTRAINT DF_ElOpTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'ElOpTabl', 'ElOpTablLanguage';
GO

--- Таблица - EsOpTabl
-- Удаляем LanguageID ограничение
ALTER TABLE EsOpTabl DROP CONSTRAINT DF_EsOpTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'EsOpTabl', 'EsOpTablLanguage';
GO

--- Таблица - ElemTablNew
-- Удаляем LanguageID ограничение
ALTER TABLE ElemTablNew DROP CONSTRAINT DF_ElemTablNew_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'ElemTablNew', 'ElemTablNewLanguage';
GO

--- Таблица - MechTabl
-- Удаляем LanguageID ограничение
ALTER TABLE MechTabl DROP CONSTRAINT DF_MechTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'MechTabl', 'MechTablLanguage';
GO

--- Таблица MnOpTabl
--- Переименовываем MnOpTabl
sp_rename 'MnOpTabl', 'MnOpTablInvariant';
GO
--- Создаем таблицу MnOpTablLanguage
CREATE TABLE dbo.MnOpTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    MnOpTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodK varchar(1999),
    __MethodK as (left([MethodK],50))
);
GO
--- Создаем FK для MnOpTablLanguage
ALTER TABLE dbo.MnOpTablLanguage
ADD CONSTRAINT FK_MnOpTablLanguage_MnOpTablInvariant FOREIGN KEY (MnOpTablID)
    REFERENCES dbo.MnOpTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.MnOpTablLanguage (MnOpTablID, MethodK, LanguageID)
SELECT ID AS MnOpTablId, MethodK, LanguageID
FROM MnOpTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE MnOpTablInvariant DROP CONSTRAINT DF_MnOpTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.MnOpTablInvariant DROP COLUMN __MethodK, MethodK, LanguageID;
GO

--- Таблица ModfTabl
--- Переименовываем ModfTabl
sp_rename 'ModfTabl', 'ModfTablInvariant';
GO
--- Создаем таблицу ModfTablLanguage
CREATE TABLE dbo.ModfTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ModfTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    SpaceGrp varchar(55)
);
GO
--- Создаем FK для ModfTablLanguage
ALTER TABLE dbo.ModfTablLanguage
ADD CONSTRAINT FK_ModfTablLanguage_ModfTablInvariant FOREIGN KEY (ModfTablID)
    REFERENCES dbo.ModfTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.ModfTablLanguage (ModfTablID, SpaceGrp, LanguageID)
SELECT ID AS ModfTablId, SpaceGrp, LanguageID
FROM ModfTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE ModfTablInvariant DROP CONSTRAINT DF_ModfTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.ModfTablInvariant DROP COLUMN SpaceGrp, LanguageID;
GO

--- Таблица - NlOpTabl
-- Удаляем LanguageID ограничение
ALTER TABLE NlOpTabl DROP CONSTRAINT DF_NlOpTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'NlOpTabl', 'NlOpTablLanguage';
GO

--- Таблица PzElTabl
--- Переименовываем PzElTabl
sp_rename 'PzElTabl', 'PzElTablInvariant';
GO
--- Создаем таблицу PzElTablLanguage
CREATE TABLE dbo.PzElTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    PzElTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodPz varchar(1999),
    __MethodPz as (left([MethodPz],50))
);
GO
--- Создаем FK для PzElTablLanguage
ALTER TABLE dbo.PzElTablLanguage
ADD CONSTRAINT FK_PzElTablLanguage_PzElTablInvariant FOREIGN KEY (PzElTablID)
    REFERENCES dbo.PzElTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.PzElTablLanguage (PzElTablID, MethodPz, LanguageID)
SELECT ID AS PzElTablId, MethodPz, LanguageID
FROM PzElTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE PzElTablInvariant DROP CONSTRAINT DF_PzElTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.PzElTablInvariant DROP COLUMN __MethodPz, MethodPz, LanguageID;
GO

--- Таблица - RefrTabl
-- Удаляем LanguageID ограничение
ALTER TABLE RefrTabl DROP CONSTRAINT DF_RefrTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'RefrTabl', 'RefrTablLanguage';
GO

--- Таблица RefrcInd
--- Переименовываем RefrcInd
sp_rename 'RefrcInd', 'RefrcIndInvariant';
GO
--- Создаем таблицу RefrcIndLanguage
CREATE TABLE dbo.RefrcIndLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    RefrcIndID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodIn varchar(1999),
    __MethodIn as (left([MethodIn],50))
);
GO
--- Создаем FK для RefrcIndLanguage
ALTER TABLE dbo.RefrcIndLanguage
ADD CONSTRAINT FK_RefrcIndLanguage_RefrcIndInvariant FOREIGN KEY (RefrcIndID)
    REFERENCES dbo.RefrcIndInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.RefrcIndLanguage (RefrcIndID, MethodIn, LanguageID)
SELECT ID AS RefrcIndId, MethodIn, LanguageID
FROM RefrcIndInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE RefrcIndInvariant DROP CONSTRAINT DF_RefrcInd_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.RefrcIndInvariant DROP COLUMN __MethodIn, MethodIn, LanguageID;
GO

--- Таблица - LastModified
-- Удаляем LanguageID ограничение
ALTER TABLE LastModified DROP CONSTRAINT DF_LastModified_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'LastModified', 'LastModifiedLanguage';
GO

--- Таблица Dielectr
--- Переименовываем Dielectr
sp_rename 'Dielectr', 'DielectrInvariant';
GO
--- Создаем таблицу DielectrLanguage
CREATE TABLE dbo.DielectrLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    DielectrID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodY varchar(1999),
    Znak varchar(50),
    __MethodY as (left([MethodY],50))
);
GO
--- Создаем FK для DielectrLanguage
ALTER TABLE dbo.DielectrLanguage
ADD CONSTRAINT FK_DielectrLanguage_DielectrInvariant FOREIGN KEY (DielectrID)
    REFERENCES dbo.DielectrInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.DielectrLanguage (DielectrID, MethodY, Znak, LanguageID)
SELECT ID AS DielectrId, MethodY, Znak, LanguageID
FROM DielectrInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE DielectrInvariant DROP CONSTRAINT DF_Dielectr_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.DielectrInvariant DROP COLUMN __MethodY, MethodY, Znak, LanguageID;
GO

--- Таблица - GrafTabl
-- Удаляем LanguageID ограничение
ALTER TABLE GrafTabl DROP CONSTRAINT DF_GrafTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'GrafTabl', 'GrafTablLanguage';
GO

--- Таблица - PlavTabl
-- Удаляем LanguageID ограничение
ALTER TABLE PlavTabl DROP CONSTRAINT DF_PlavTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'PlavTabl', 'PlavTablLanguage';
GO

--- Таблица ElemTabl
--- Переименовываем ElemTabl
sp_rename 'ElemTabl', 'ElemTablInvariant';
GO
--- Создаем таблицу ElemTablLanguage
CREATE TABLE dbo.ElemTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ElemTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodP varchar(512),
    __MethodP as (left([MethodP],(50)))
);
GO
--- Создаем FK для ElemTablLanguage
ALTER TABLE dbo.ElemTablLanguage
ADD CONSTRAINT FK_ElemTablLanguage_ElemTablInvariant FOREIGN KEY (ElemTablID)
    REFERENCES dbo.ElemTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.ElemTablLanguage (ElemTablID, MethodP, LanguageID)
SELECT ID AS ElemTablId, MethodP, LanguageID
FROM ElemTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE ElemTablInvariant DROP CONSTRAINT DF_ElemTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.ElemTablInvariant DROP COLUMN __MethodP, MethodP, LanguageID;
GO

--- Таблица - CuryTabl
-- Удаляем LanguageID ограничение
ALTER TABLE CuryTabl DROP CONSTRAINT DF_CuryTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'CuryTabl', 'CuryTablLanguage';
GO

--- Таблица - HardTabl
-- Удаляем LanguageID ограничение
ALTER TABLE HardTabl DROP CONSTRAINT DF_HardTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'HardTabl', 'HardTablLanguage';
GO

--- Таблица - SuspTabl
-- Удаляем LanguageID ограничение
ALTER TABLE SuspTabl DROP CONSTRAINT DF_SuspTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'SuspTabl', 'SuspTablLanguage';
GO

--- Таблица - DecrTabl
-- Удаляем LanguageID ограничение
ALTER TABLE DecrTabl DROP CONSTRAINT DF_DecrTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'DecrTabl', 'DecrTablLanguage';
GO

--- Таблица Properties
--- Переименовываем Properties
sp_rename 'Properties', 'PropertiesInvariant';
GO
--- Создаем таблицу PropertiesLanguage
CREATE TABLE dbo.PropertiesLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    PropertiesID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    NAZVPROP varchar(300)
);
GO
--- Создаем FK для PropertiesLanguage
ALTER TABLE dbo.PropertiesLanguage
ADD CONSTRAINT FK_PropertiesLanguage_PropertiesInvariant FOREIGN KEY (PropertiesID)
    REFERENCES dbo.PropertiesInvariant (NOMPROP)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.PropertiesLanguage (PropertiesID, NAZVPROP, LanguageID)
SELECT NOMPROP AS PropertiesId, NAZVPROP, LanguageID
FROM PropertiesInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE PropertiesInvariant DROP CONSTRAINT DF_Properties_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.PropertiesInvariant DROP COLUMN NAZVPROP, LanguageID;
GO

--- Таблица - HeatExpn
-- Удаляем LanguageID ограничение
ALTER TABLE HeatExpn DROP CONSTRAINT DF_HeatExpn_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'HeatExpn', 'HeatExpnLanguage';
GO

--- Таблица HeatTabl
--- Переименовываем HeatTabl
sp_rename 'HeatTabl', 'HeatTablInvariant';
GO
--- Создаем таблицу HeatTablLanguage
CREATE TABLE dbo.HeatTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    HeatTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    MethodC varchar(1999),
    __MethodC as (left([MethodC],(50)))
);
GO
--- Создаем FK для HeatTablLanguage
ALTER TABLE dbo.HeatTablLanguage
ADD CONSTRAINT FK_HeatTablLanguage_HeatTablInvariant FOREIGN KEY (HeatTablID)
    REFERENCES dbo.HeatTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.HeatTablLanguage (HeatTablID, MethodC, LanguageID)
SELECT ID AS HeatTablId, MethodC, LanguageID
FROM HeatTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE HeatTablInvariant DROP CONSTRAINT DF_HeatTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.HeatTablInvariant DROP COLUMN __MethodC, MethodC, LanguageID;
GO

--- Таблица - DensTabl
-- Удаляем LanguageID ограничение
ALTER TABLE DensTabl DROP CONSTRAINT DF_DensTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'DensTabl', 'DensTablLanguage';
GO

--- Таблица AcOpTabl
--- Переименовываем AcOpTabl
sp_rename 'AcOpTabl', 'AcOpTablInvariant';
GO
--- Создаем таблицу AcOpTablLanguage
CREATE TABLE dbo.AcOpTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    AcOpTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    E varchar(20),
    Nsv varchar(20),
    Uzv varchar(20)
);
GO
--- Создаем FK для AcOpTablLanguage
ALTER TABLE dbo.AcOpTablLanguage
ADD CONSTRAINT FK_AcOpTablLanguage_AcOpTablInvariant FOREIGN KEY (AcOpTablID)
    REFERENCES dbo.AcOpTablInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.AcOpTablLanguage (AcOpTablID, E, Nsv, Uzv, LanguageID)
SELECT ID AS AcOpTablId, E, Nsv, Uzv, LanguageID
FROM AcOpTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE AcOpTablInvariant DROP CONSTRAINT DF_AcOpTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.AcOpTablInvariant DROP COLUMN E, Nsv, Uzv, LanguageID;
GO

--- Таблица HeadTabl
--- Переименовываем HeadTabl
sp_rename 'HeadTabl', 'HeadTablInvariant';
GO
--- Создаем таблицу HeadTablLanguage
CREATE TABLE dbo.HeadTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    HeadTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    Expert varchar(32)
);
GO
--- Создаем FK для HeadTablLanguage
ALTER TABLE dbo.HeadTablLanguage
ADD CONSTRAINT FK_HeadTablLanguage_HeadTablInvariant FOREIGN KEY (HeadTablID)
    REFERENCES dbo.HeadTablInvariant (HeadClue)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.HeadTablLanguage (HeadTablID, Expert, LanguageID)
SELECT HeadClue AS HeadTablId, Expert, LanguageID
FROM HeadTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE HeadTablInvariant DROP CONSTRAINT DF_HeadTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.HeadTablInvariant DROP COLUMN Expert, LanguageID;
GO

--- Таблица Bibliogr
--- Переименовываем Bibliogr
sp_rename 'Bibliogr', 'BibliogrInvariant';
GO
--- Создаем таблицу BibliogrLanguage
CREATE TABLE dbo.BibliogrLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    BibliogrID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    Authors varchar(500),
    Source varchar(500),
    Title varchar(1000)
);
GO
--- Создаем FK для BibliogrLanguage
ALTER TABLE dbo.BibliogrLanguage
ADD CONSTRAINT FK_BibliogrLanguage_BibliogrInvariant FOREIGN KEY (BibliogrID)
    REFERENCES dbo.BibliogrInvariant (Bknumber)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.BibliogrLanguage (BibliogrID, Authors, Source, Title, LanguageID)
SELECT Bknumber AS BibliogrId, Authors, Source, Title, LanguageID
FROM BibliogrInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE BibliogrInvariant DROP CONSTRAINT DF_Bibliogr_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.BibliogrInvariant DROP COLUMN Authors, Source, Title, LanguageID;
GO

--- Таблица ConstSel
--- Переименовываем ConstSel
sp_rename 'ConstSel', 'ConstSelInvariant';
GO
--- Создаем таблицу ConstSelLanguage
CREATE TABLE dbo.ConstSelLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    ConstSelID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 1,
    Measure varchar(20)
);
GO
--- Создаем FK для ConstSelLanguage
ALTER TABLE dbo.ConstSelLanguage
ADD CONSTRAINT FK_ConstSelLanguage_ConstSelInvariant FOREIGN KEY (ConstSelID)
    REFERENCES dbo.ConstSelInvariant (ID)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.ConstSelLanguage (ConstSelID, Measure, LanguageID)
SELECT ID AS ConstSelId, Measure, LanguageID
FROM ConstSelInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE ConstSelInvariant DROP CONSTRAINT DF_ConstSel_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.ConstSelInvariant DROP COLUMN Measure, LanguageID;
GO

use Crystal_en;
GO

--- Таблица Properties
--- Переименовываем Properties
sp_rename 'Properties', 'PropertiesInvariant';
GO
--- Создаем таблицу PropertiesLanguage
CREATE TABLE dbo.PropertiesLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    PropertiesID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 2,
    NAZVPROP varchar(300)
);
GO
--- Создаем FK для PropertiesLanguage
ALTER TABLE dbo.PropertiesLanguage
ADD CONSTRAINT FK_PropertiesLanguage_PropertiesInvariant FOREIGN KEY (PropertiesID)
    REFERENCES dbo.PropertiesInvariant (NOMPROP)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.PropertiesLanguage (PropertiesID, NAZVPROP, LanguageID)
SELECT NOMPROP AS PropertiesId, NAZVPROP, LanguageID
FROM PropertiesInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE PropertiesInvariant DROP CONSTRAINT DF_Properties_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.PropertiesInvariant DROP COLUMN NAZVPROP, LanguageID;
GO

--- Таблица - EsOpTabl
-- Удаляем LanguageID ограничение
ALTER TABLE EsOpTabl DROP CONSTRAINT DF_EsOpTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'EsOpTabl', 'EsOpTablLanguage';
GO

--- Таблица Bibliogr
--- Переименовываем Bibliogr
sp_rename 'Bibliogr', 'BibliogrInvariant';
GO
--- Создаем таблицу BibliogrLanguage
CREATE TABLE dbo.BibliogrLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    BibliogrID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 2,
    Authors varchar(500),
    Source varchar(500),
    Title varchar(1000)
);
GO
--- Создаем FK для BibliogrLanguage
ALTER TABLE dbo.BibliogrLanguage
ADD CONSTRAINT FK_BibliogrLanguage_BibliogrInvariant FOREIGN KEY (BibliogrID)
    REFERENCES dbo.BibliogrInvariant (Bknumber)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.BibliogrLanguage (BibliogrID, Authors, Source, Title, LanguageID)
SELECT Bknumber AS BibliogrId, Authors, Source, Title, LanguageID
FROM BibliogrInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE BibliogrInvariant DROP CONSTRAINT DF_Bibliogr_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.BibliogrInvariant DROP COLUMN Authors, Source, Title, LanguageID;
GO

--- Таблица - DensTabl
-- Удаляем LanguageID ограничение
ALTER TABLE DensTabl DROP CONSTRAINT DF_DensTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'DensTabl', 'DensTablLanguage';
GO

--- Таблица - RefrTabl
-- Удаляем LanguageID ограничение
ALTER TABLE RefrTabl DROP CONSTRAINT DF_RefrTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'RefrTabl', 'RefrTablLanguage';
GO

--- Таблица HeadTabl
--- Переименовываем HeadTabl
sp_rename 'HeadTabl', 'HeadTablInvariant';
GO
--- Создаем таблицу HeadTablLanguage
CREATE TABLE dbo.HeadTablLanguage
(
    ID INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    HeadTablID INT NOT NULL,
    LanguageID INT NOT NULL DEFAULT 2,
    Expert varchar(32)
);
GO
--- Создаем FK для HeadTablLanguage
ALTER TABLE dbo.HeadTablLanguage
ADD CONSTRAINT FK_HeadTablLanguage_HeadTablInvariant FOREIGN KEY (HeadTablID)
    REFERENCES dbo.HeadTablInvariant (HeadClue)
    ON DELETE CASCADE
    ON UPDATE CASCADE
;
GO
-- Вставляем столбцы
INSERT INTO dbo.HeadTablLanguage (HeadTablID, Expert, LanguageID)
SELECT HeadClue AS HeadTablId, Expert, LanguageID
FROM HeadTablInvariant;
GO
-- Удаляем LanguageID ограничение
ALTER TABLE HeadTablInvariant DROP CONSTRAINT DF_HeadTabl_LanguageID
GO
-- Удаляем языкозависимые столбцы
ALTER TABLE dbo.HeadTablInvariant DROP COLUMN Expert, LanguageID;
GO

--- Таблица - ElemTablNew
-- Удаляем LanguageID ограничение
ALTER TABLE ElemTablNew DROP CONSTRAINT DF_ElemTablNew_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'ElemTablNew', 'ElemTablNewLanguage';
GO

--- Таблица - HardTabl
-- Удаляем LanguageID ограничение
ALTER TABLE HardTabl DROP CONSTRAINT DF_HardTabl_LanguageID
GO
--- Добавляем Language к названию
sp_rename 'HardTabl', 'HardTablLanguage';
GO

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
(HeadTablID, LanguageID, Expert)
select HeadTablID, LanguageID, Expert
from Crystal_en.dbo.HeadTablLanguage

insert into Crystal.dbo.BibliogrLanguage
(BibliogrID, LanguageID, Authors, Source, Title)
select BibliogrID, LanguageID, Authors, Source, Title
from Crystal_en.dbo.BibliogrLanguage
where BibliogrID in (SELECT BibliogrID
FROM Crystal.dbo.BibliogrLanguage)

