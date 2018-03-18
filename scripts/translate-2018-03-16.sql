use Crystal;

    --- Таблица - DielDiss
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.DielDiss ADD LanguageID int NOT NULL DEFAULT(1);
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
    INSERT INTO dbo.Elastic1Language (Elastic1ID, MethodE, ZnE)
    SELECT ID AS Elastic1Id, MethodE, ZnE
    FROM Elastic1Invariant;
    GO
    -- Удаляем "русские" столбцы, а так же зависимости
    ALTER TABLE dbo.Elastic1Invariant DROP CONSTRAINT U_Elastic1;
    ALTER TABLE dbo.Elastic1Invariant DROP COLUMN __MethodE, MethodE, ZnE;
    GO
    -- Создаем уникальный индекс для Elastic1Language
    CREATE UNIQUE INDEX U_Elastic1Language ON Elastic1Language (Elastic1ID, LanguageID, __MethodE, ZnE);   
    GO
    -- Создаем уникальный индекс для Elastic1Invariant
    CREATE UNIQUE INDEX U_Elastic1Invariant ON Elastic1Invariant (HeadClue, SingCode, TemperEl, CondClu1, E1, ErrE, Bknumber);   
    GO
    

    --- Таблица - ElOpTabl
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.ElOpTabl ADD LanguageID int NOT NULL DEFAULT(1);
    GO    
    --- Добавляем Language к названию
    sp_rename 'ElOpTabl', 'ElOpTablLanguage';
    GO
    

    --- Таблица - EsOpTabl
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.EsOpTabl ADD LanguageID int NOT NULL DEFAULT(1);
    GO    
    --- Добавляем Language к названию
    sp_rename 'EsOpTabl', 'EsOpTablLanguage';
    GO
    

    --- Таблица - ElemTablNew
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.ElemTablNew ADD LanguageID int NOT NULL DEFAULT(1);
    GO    
    --- Добавляем Language к названию
    sp_rename 'ElemTablNew', 'ElemTablNewLanguage';
    GO
    

    --- Таблица - MechTabl
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.MechTabl ADD LanguageID int NOT NULL DEFAULT(1);
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
    INSERT INTO dbo.MnOpTablLanguage (MnOpTablID, MethodK)
    SELECT ID AS MnOpTablId, MethodK
    FROM MnOpTablInvariant;
    GO
    -- Удаляем "русские" столбцы, а так же зависимости
    ALTER TABLE dbo.MnOpTablInvariant DROP CONSTRAINT U_MnOpTabl;
    ALTER TABLE dbo.MnOpTablInvariant DROP COLUMN __MethodK, MethodK;
    GO
    -- Создаем уникальный индекс для MnOpTablLanguage
    CREATE UNIQUE INDEX U_MnOpTablLanguage ON MnOpTablLanguage (MnOpTablID, LanguageID, __MethodK);   
    GO
    -- Создаем уникальный индекс для MnOpTablInvariant
    CREATE UNIQUE INDEX U_MnOpTablInvariant ON MnOpTablInvariant (HeadClue, SingCode, Lyambda, Nw, N2w, Znakcon, K, ErrKj, Bknumber);   
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
    INSERT INTO dbo.ModfTablLanguage (ModfTablID, SpaceGrp)
    SELECT ID AS ModfTablId, SpaceGrp
    FROM ModfTablInvariant;
    GO
    -- Удаляем "русские" столбцы, а так же зависимости
    ALTER TABLE dbo.ModfTablInvariant DROP CONSTRAINT U_ModfTabl;
    ALTER TABLE dbo.ModfTablInvariant DROP COLUMN SpaceGrp;
    GO
    -- Создаем уникальный индекс для ModfTablLanguage
    CREATE UNIQUE INDEX U_ModfTablLanguage ON ModfTablLanguage (ModfTablID, LanguageID, SpaceGrp);   
    GO
    -- Создаем уникальный индекс для ModfTablInvariant
    CREATE UNIQUE INDEX U_ModfTablInvariant ON ModfTablInvariant (HeadClue, SingCode, SuprTemp, SP2, ErrSupr, PointGrp, Z, Bknumber);   
    GO
    

    --- Таблица - NlOpTabl
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.NlOpTabl ADD LanguageID int NOT NULL DEFAULT(1);
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
    INSERT INTO dbo.PzElTablLanguage (PzElTablID, MethodPz)
    SELECT ID AS PzElTablId, MethodPz
    FROM PzElTablInvariant;
    GO
    -- Удаляем "русские" столбцы, а так же зависимости
    ALTER TABLE dbo.PzElTablInvariant DROP CONSTRAINT U_PzElTabl;
    ALTER TABLE dbo.PzElTablInvariant DROP COLUMN __MethodPz, MethodPz;
    GO
    -- Создаем уникальный индекс для PzElTablLanguage
    CREATE UNIQUE INDEX U_PzElTablLanguage ON PzElTablLanguage (PzElTablID, LanguageID, __MethodPz);   
    GO
    -- Создаем уникальный индекс для PzElTablInvariant
    CREATE UNIQUE INDEX U_PzElTablInvariant ON PzElTablInvariant (HeadClue, SingCode, FreqPzEl, ConstD, D, ErrD, Bknumber);   
    GO
    

    --- Таблица - RefrTabl
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.RefrTabl ADD LanguageID int NOT NULL DEFAULT(1);
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
    INSERT INTO dbo.RefrcIndLanguage (RefrcIndID, MethodIn)
    SELECT ID AS RefrcIndId, MethodIn
    FROM RefrcIndInvariant;
    GO
    -- Удаляем "русские" столбцы, а так же зависимости
    ALTER TABLE dbo.RefrcIndInvariant DROP CONSTRAINT U_RefrcInd;
    ALTER TABLE dbo.RefrcIndInvariant DROP COLUMN __MethodIn, MethodIn;
    GO
    -- Создаем уникальный индекс для RefrcIndLanguage
    CREATE UNIQUE INDEX U_RefrcIndLanguage ON RefrcIndLanguage (RefrcIndID, LanguageID, __MethodIn);   
    GO
    -- Создаем уникальный индекс для RefrcIndInvariant
    CREATE UNIQUE INDEX U_RefrcIndInvariant ON RefrcIndInvariant (HeadClue, SingCode, Temper, WaveLeng, NazbIndx, ZnachInd, ErrIndex, Bknumber);   
    GO
    

    --- Таблица - LastModified
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.LastModified ADD LanguageID int NOT NULL DEFAULT(1);
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
    INSERT INTO dbo.DielectrLanguage (DielectrID, MethodY, Znak)
    SELECT ID AS DielectrId, MethodY, Znak
    FROM DielectrInvariant;
    GO
    -- Удаляем "русские" столбцы, а так же зависимости
    ALTER TABLE dbo.DielectrInvariant DROP CONSTRAINT U_Dielectr;
    ALTER TABLE dbo.DielectrInvariant DROP COLUMN __MethodY, MethodY, Znak;
    GO
    -- Создаем уникальный индекс для DielectrLanguage
    CREATE UNIQUE INDEX U_DielectrLanguage ON DielectrLanguage (DielectrID, LanguageID, Znak, __MethodY);   
    GO
    -- Создаем уникальный индекс для DielectrInvariant
    CREATE UNIQUE INDEX U_DielectrInvariant ON DielectrInvariant (HeadClue, SingCode, FreqDiel, Temper_2, Constant, Diel, ErrY, Bknumber);   
    GO
    

    --- Таблица - GrafTabl
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.GrafTabl ADD LanguageID int NOT NULL DEFAULT(1);
    GO    
    --- Добавляем Language к названию
    sp_rename 'GrafTabl', 'GrafTablLanguage';
    GO
    

    --- Таблица - PlavTabl
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.PlavTabl ADD LanguageID int NOT NULL DEFAULT(1);
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
    INSERT INTO dbo.ElemTablLanguage (ElemTablID, MethodP)
    SELECT ID AS ElemTablId, MethodP
    FROM ElemTablInvariant;
    GO
    -- Удаляем "русские" столбцы, а так же зависимости
    DROP INDEX IX_ElemTabl ON ElemTablInvariant;
    ALTER TABLE dbo.ElemTablInvariant DROP COLUMN __MethodP, MethodP;
    GO
    -- Создаем уникальный индекс для ElemTablLanguage
    CREATE UNIQUE INDEX U_ElemTablLanguage ON ElemTablLanguage (ElemTablID, LanguageID, __MethodP);   
    GO
    -- Создаем уникальный индекс для ElemTablInvariant
    CREATE UNIQUE INDEX U_ElemTablInvariant ON ElemTablInvariant (HeadClue, SingCode, Nazbparam, Znparam, Errparam, NazvAngl, ZnAngle, ErrAngl, Bknumber);   
    GO
    

    --- Таблица - CuryTabl
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.CuryTabl ADD LanguageID int NOT NULL DEFAULT(1);
    GO    
    --- Добавляем Language к названию
    sp_rename 'CuryTabl', 'CuryTablLanguage';
    GO
    

    --- Таблица - HardTabl
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.HardTabl ADD LanguageID int NOT NULL DEFAULT(1);
    GO    
    --- Добавляем Language к названию
    sp_rename 'HardTabl', 'HardTablLanguage';
    GO
    

    --- Таблица - SuspTabl
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.SuspTabl ADD LanguageID int NOT NULL DEFAULT(1);
    GO    
    --- Добавляем Language к названию
    sp_rename 'SuspTabl', 'SuspTablLanguage';
    GO
    

    --- Таблица - DecrTabl
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.DecrTabl ADD LanguageID int NOT NULL DEFAULT(1);
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
    INSERT INTO dbo.PropertiesLanguage (PropertiesID, NAZVPROP)
    SELECT NOMPROP AS PropertiesId, NAZVPROP
    FROM PropertiesInvariant;
    GO
    -- Удаляем "русские" столбцы, а так же зависимости
    
    ALTER TABLE dbo.PropertiesInvariant DROP COLUMN NAZVPROP;
    GO
    -- Создаем уникальный индекс для PropertiesLanguage
    CREATE UNIQUE INDEX U_PropertiesLanguage ON PropertiesLanguage (PropertiesID, LanguageID, NAZVPROP);   
    GO
    -- Создаем уникальный индекс для PropertiesInvariant
    CREATE UNIQUE INDEX U_PropertiesInvariant ON PropertiesInvariant (HTML, TableName);   
    GO
    

    --- Таблица - Properties_Complex
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.Properties_Complex ADD LanguageID int NOT NULL DEFAULT(1);
    GO    
    --- Добавляем Language к названию
    sp_rename 'Properties_Complex', 'Properties_ComplexLanguage';
    GO
    

    --- Таблица - HeatExpn
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.HeatExpn ADD LanguageID int NOT NULL DEFAULT(1);
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
    INSERT INTO dbo.HeatTablLanguage (HeatTablID, MethodC)
    SELECT ID AS HeatTablId, MethodC
    FROM HeatTablInvariant;
    GO
    -- Удаляем "русские" столбцы, а так же зависимости
    ALTER TABLE dbo.HeatTablInvariant DROP CONSTRAINT U_HeatTabl;
    ALTER TABLE dbo.HeatTablInvariant DROP COLUMN __MethodC, MethodC;
    GO
    -- Создаем уникальный индекс для HeatTablLanguage
    CREATE UNIQUE INDEX U_HeatTablLanguage ON HeatTablLanguage (HeatTablID, LanguageID, __MethodC);   
    GO
    -- Создаем уникальный индекс для HeatTablInvariant
    CREATE UNIQUE INDEX U_HeatTablInvariant ON HeatTablInvariant (HeadClue, Temperat, ZnC, C, ErrC, Bknumber);   
    GO
    

    --- Таблица - DensTabl
    --- Добавляем столбец LanguageID
    ALTER TABLE dbo.DensTabl ADD LanguageID int NOT NULL DEFAULT(1);
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
    INSERT INTO dbo.AcOpTablLanguage (AcOpTablID, E, Nsv, Uzv)
    SELECT ID AS AcOpTablId, E, Nsv, Uzv
    FROM AcOpTablInvariant;
    GO
    -- Удаляем "русские" столбцы, а так же зависимости
    ALTER TABLE dbo.AcOpTablInvariant DROP CONSTRAINT U_AcOpTabl;
    ALTER TABLE dbo.AcOpTablInvariant DROP COLUMN E, Nsv, Uzv;
    GO
    -- Создаем уникальный индекс для AcOpTablLanguage
    CREATE UNIQUE INDEX U_AcOpTablLanguage ON AcOpTablLanguage (AcOpTablID, LanguageID, E, Nsv, Uzv);   
    GO
    -- Создаем уникальный индекс для AcOpTablInvariant
    CREATE UNIQUE INDEX U_AcOpTablInvariant ON AcOpTablInvariant (HeadClue, SingCode, WaveLeng, Nzv, M1, M2, M3, Bknumber);   
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
        Expert varchar(32),
		System varchar(128)
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
    INSERT INTO dbo.HeadTablLanguage (HeadTablID, Expert, System)
    SELECT HeadClue AS HeadTablId, Expert, System
    FROM HeadTablInvariant;
    GO
    -- Удаляем "русские" столбцы, а так же зависимости
    ALTER TABLE dbo.HeadTablInvariant DROP CONSTRAINT DF_HeadTabl_Expert;
	ALTER TABLE dbo.HeadTablInvariant DROP CONSTRAINT DF_HeadTabl_System;
    ALTER TABLE dbo.HeadTablInvariant DROP COLUMN Expert, System;
    GO
    -- Создаем уникальный индекс для HeadTablLanguage
    CREATE UNIQUE INDEX U_HeadTablLanguage ON HeadTablLanguage (HeadTablID, LanguageID, Expert, System);   
    GO
    -- Создаем уникальный индекс для HeadTablInvariant
    CREATE UNIQUE INDEX U_HeadTablInvariant ON HeadTablInvariant (Help, Class);   
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
    INSERT INTO dbo.BibliogrLanguage (BibliogrID, Authors, Source, Title)
    SELECT Bknumber AS BibliogrId, Authors, Source, Title
    FROM BibliogrInvariant;
    GO
    -- Удаляем "русские" столбцы, а так же зависимости
    
    ALTER TABLE dbo.BibliogrInvariant DROP COLUMN Authors, Source, Title;
    GO
    -- Создаем уникальный индекс для BibliogrLanguage
    CREATE UNIQUE INDEX U_BibliogrLanguage ON BibliogrLanguage (BibliogrID, LanguageID, Authors, Source, Title);   
    GO
    -- Создаем уникальный индекс для BibliogrInvariant
    CREATE UNIQUE INDEX U_BibliogrInvariant ON BibliogrInvariant (DOI);   
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
    INSERT INTO dbo.ConstSelLanguage (ConstSelID, Measure)
    SELECT ID AS ConstSelId, Measure
    FROM ConstSelInvariant;
    GO
    -- Удаляем "русские" столбцы, а так же зависимости
    ALTER TABLE dbo.ConstSelInvariant DROP CONSTRAINT U_ConstSel;
    ALTER TABLE dbo.ConstSelInvariant DROP COLUMN Measure;
    GO
    -- Создаем уникальный индекс для ConstSelLanguage
    CREATE UNIQUE INDEX U_ConstSelLanguage ON ConstSelLanguage (ConstSelID, LanguageID, Measure);   
    GO
    -- Создаем уникальный индекс для ConstSelInvariant
    CREATE UNIQUE INDEX U_ConstSelInvariant ON ConstSelInvariant (HeadClue, SingCode, Equation, NazvSel, ZnachSel, Bknumber);   
    GO
    

        --- Добавим primary key для DensTablLanguage 
        ALTER TABLE DensTablLanguage ADD PRIMARY KEY (ID);

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
        
        -- Отключаем триггеры        
        sp_msforeachtable 'ALTER TABLE ? DISABLE TRIGGER all'
        GO
        
