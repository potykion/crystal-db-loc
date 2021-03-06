use Crystal;
go

ALTER TABLE AcOpTablInvariant ADD CONSTRAINT U_AcOpTablInvariant UNIQUE (HeadClue, SingCode, WaveLeng, Nzv, M1, M2, M3, Bknumber)
ALTER TABLE AcOpTablLanguage ADD CONSTRAINT U_AcOpTablLanguage UNIQUE (AcOpTablID, LanguageID, E, Nsv, Uzv)
ALTER TABLE ConstSelLanguage ADD CONSTRAINT U_ConstSelLanguage UNIQUE (ConstSelID, LanguageID, Measure)
ALTER TABLE CuryTablInvariant ADD CONSTRAINT U_CuryTablInvariant UNIQUE (HeadClue, CuryTemp, ErrCury, Bknumber)
ALTER TABLE CuryTablLanguage ADD CONSTRAINT U_CuryTablLanguage UNIQUE (CuryTablID, LanguageID, Oboztran)
ALTER TABLE DecrTablInvariant ADD CONSTRAINT U_DecrTablInvariant UNIQUE (HeadClue, SingCode, WaveSpeed, Decrement, DecrFreq, Bknumber)
ALTER TABLE DecrTablLanguage ADD CONSTRAINT U_DecrTablLanguage UNIQUE (DecrTablID, LanguageID, Nzv, Uzv, WaveType)
ALTER TABLE DensTablInvariant ADD CONSTRAINT U_DensTablInvariant UNIQUE (HeadClue, SingCode, Density, ErrDens, Bknumber)
ALTER TABLE DensTablLanguage ADD CONSTRAINT U_DensTablLanguage UNIQUE (DensTablID, LanguageID, __MethodD)
ALTER TABLE DielDissInvariant ADD CONSTRAINT U_DielDissInvariant UNIQUE (HeadClue, SingCode, FreqDiss, Temper_3, TangentD, ErrDiss, Bknumber)
ALTER TABLE DielDissLanguage ADD CONSTRAINT U_DielDissLanguage UNIQUE (DielDissID, LanguageID, TangName, __MethodY)
ALTER TABLE DielectrInvariant ADD CONSTRAINT U_DielectrInvariant UNIQUE (HeadClue, SingCode, FreqDiel, Temper_2, Constant, Diel, ErrY, Bknumber)
ALTER TABLE DielectrLanguage ADD CONSTRAINT U_DielectrLanguage UNIQUE (DielectrID, LanguageID, Znak, __MethodY)
ALTER TABLE Elastic1Invariant ADD CONSTRAINT U_Elastic1Invariant UNIQUE (HeadClue, SingCode, TemperEl, CondClu1, E1, ErrE, Bknumber)
ALTER TABLE Elastic1Language ADD CONSTRAINT U_Elastic1Language UNIQUE (Elastic1ID, LanguageID, ZnE, __MethodE)
ALTER TABLE ElemTablInvariant ADD CONSTRAINT U_ElemTablInvariant UNIQUE (HeadClue, SingCode, Znparam, Errparam, NazvAngl, ZnAngle, ErrAngl, Bknumber)
ALTER TABLE ElemTablLanguage ADD CONSTRAINT U_ElemTablLanguage UNIQUE (ElemTablID, LanguageID, Nazbparam, __MethodP)
ALTER TABLE ElemTablNewInvariant ADD CONSTRAINT U_ElemTablNewInvariant UNIQUE (HeadClue, SingCode, A, AErr, B, BErr, C, CErr, Alpha, AlphaErr, Beta, BetaErr, Gamma, GammaErr, Bknumber)
ALTER TABLE ElemTablNewLanguage ADD CONSTRAINT U_ElemTablNewLanguage UNIQUE (ElemTablNewID, LanguageID, __MethodP)
ALTER TABLE ElOpTablInvariant ADD CONSTRAINT U_ElOpTablInvariant UNIQUE (HeadClue, SingCode, WvLeng, R, ErrR, Bknumber)
ALTER TABLE ElOpTablLanguage ADD CONSTRAINT U_ElOpTablLanguage UNIQUE (ElOpTablID, LanguageID, ZnN1, __MethodR)
ALTER TABLE EsOpTablInvariant ADD CONSTRAINT U_EsOpTablInvariant UNIQUE (HeadClue, SingCode, LengWave, P, ErrP, Bknumber)
ALTER TABLE EsOpTablLanguage ADD CONSTRAINT U_EsOpTablLanguage UNIQUE (EsOpTablID, LanguageID, ZnP, __MethodP)
ALTER TABLE GrafTablInvariant ADD CONSTRAINT U_GrafTablInvariant UNIQUE (HeadClue, NompClue)
ALTER TABLE HardTablInvariant ADD CONSTRAINT U_HardTablInvariant UNIQUE (HeadClue, SingCode, Hard1, Hard2, ErrHard, Mohs, ErrMohs, Bknumber)
ALTER TABLE HardTablLanguage ADD CONSTRAINT U_HardTablLanguage UNIQUE (HardTablID, LanguageID, __MethodH)
ALTER TABLE HeadTablInvariant ADD CONSTRAINT U_HeadTablInvariant UNIQUE (System, Help, Class)
ALTER TABLE HeadTablLanguage ADD CONSTRAINT U_HeadTablLanguage UNIQUE (HeadTablID, LanguageID, Expert)
ALTER TABLE HeatExpnInvariant ADD CONSTRAINT U_HeatExpnInvariant UNIQUE (HeadClue, SingCode, DataType, Temper_1, Temper_2, S11, ErrHExp, Bknumber)
ALTER TABLE HeatExpnLanguage ADD CONSTRAINT U_HeatExpnLanguage UNIQUE (HeatExpnID, LanguageID, Znak1, __MethodEx)
ALTER TABLE HeatTablInvariant ADD CONSTRAINT U_HeatTablInvariant UNIQUE (HeadClue, Temperat, ZnC, C, ErrC, Bknumber)
ALTER TABLE HeatTablLanguage ADD CONSTRAINT U_HeatTablLanguage UNIQUE (HeatTablID, LanguageID, __MethodC)
ALTER TABLE LastModifiedInvariant ADD CONSTRAINT U_LastModifiedInvariant UNIQUE (LastModified)
ALTER TABLE LastModifiedLanguage ADD CONSTRAINT U_LastModifiedLanguage UNIQUE (LastModifiedID, LanguageID, Text)
ALTER TABLE MechTablInvariant ADD CONSTRAINT U_MechTablInvariant UNIQUE (HeadClue, SingCode, Bknumber, FreqCons, Temper, K, ErrK)
ALTER TABLE MechTablLanguage ADD CONSTRAINT U_MechTablLanguage UNIQUE (MechTablID, LanguageID, ZnK, __MethodK)
ALTER TABLE MnOpTablInvariant ADD CONSTRAINT U_MnOpTablInvariant UNIQUE (HeadClue, SingCode, Lyambda, Nw, N2w, Znakcon, K, ErrKj, Bknumber)
ALTER TABLE MnOpTablLanguage ADD CONSTRAINT U_MnOpTablLanguage UNIQUE (MnOpTablID, LanguageID, __MethodK)
ALTER TABLE ModfTablInvariant ADD CONSTRAINT U_ModfTablInvariant UNIQUE (HeadClue, SingCode, SuprTemp, SP2, ErrSupr, PointGrp, Z, Bknumber)
ALTER TABLE ModfTablLanguage ADD CONSTRAINT U_ModfTablLanguage UNIQUE (ModfTablID, LanguageID, SpaceGrp)
ALTER TABLE NlOpTablInvariant ADD CONSTRAINT U_NlOpTablInvariant UNIQUE (HeadClue, SingCode, Lyambda, Rij, ErrRij, Bknumber)
ALTER TABLE NlOpTablLanguage ADD CONSTRAINT U_NlOpTablLanguage UNIQUE (NlOpTablID, LanguageID, ZnR, __MethodR)
ALTER TABLE PlavTablInvariant ADD CONSTRAINT U_PlavTablInvariant UNIQUE (HeadClue, PlavTemp, ErrPlav, Bknumber)
ALTER TABLE PlavTablLanguage ADD CONSTRAINT U_PlavTablLanguage UNIQUE (PlavTablID, LanguageID, PlavType)
ALTER TABLE PropertiesInvariant ADD CONSTRAINT U_PropertiesInvariant UNIQUE (HTML, TableName)
ALTER TABLE PropertiesLanguage ADD CONSTRAINT U_PropertiesLanguage UNIQUE (PropertiesID, LanguageID, NAZVPROP)
ALTER TABLE PzElTablInvariant ADD CONSTRAINT U_PzElTablInvariant UNIQUE (HeadClue, SingCode, FreqPzEl, ConstD, D, ErrD, Bknumber)
ALTER TABLE PzElTablLanguage ADD CONSTRAINT U_PzElTablLanguage UNIQUE (PzElTablID, LanguageID, __MethodPz)
ALTER TABLE RefrcIndInvariant ADD CONSTRAINT U_RefrcIndInvariant UNIQUE (HeadClue, SingCode, Temper, WaveLeng, NazbIndx, ZnachInd, ErrIndex, Bknumber)
ALTER TABLE RefrcIndLanguage ADD CONSTRAINT U_RefrcIndLanguage UNIQUE (RefrcIndID, LanguageID, __MethodIn)
ALTER TABLE SuspTablInvariant ADD CONSTRAINT U_SuspTablInvariant UNIQUE (HeadClue, Temper, Suspense, ErrSusp, Bknumber)
ALTER TABLE SuspTablLanguage ADD CONSTRAINT U_SuspTablLanguage UNIQUE (SuspTablID, LanguageID, SuspName, __MethodS)
go
alter table dbo.ConstSelInvariant
add [__Equation] as (CONVERT(VARCHAR(32), HASHBYTES('MD5', Equation), 2));
go
ALTER TABLE ConstSelInvariant ADD CONSTRAINT U_ConstSelInvariant UNIQUE (HeadClue, SingCode, __Equation, NazvSel, ZnachSel, Bknumber)
go
alter table dbo.GrafTablLanguage
add [__Signatur] as (CONVERT(VARCHAR(32), HASHBYTES('MD5', Signatur), 2));
go
ALTER TABLE GrafTablLanguage ADD CONSTRAINT U_GrafTablLanguage UNIQUE (GrafTablID, LanguageID, NameGraf, __Signatur)
go

