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
        
