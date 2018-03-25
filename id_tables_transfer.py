LANGUAGE_TABLES_WITH_ID_PK = '''ModfTabl
GrafTabl
PlavTabl
ElemTabl
MnOpTabl
SuspTabl
RefrcInd
CuryTabl
LitrTabl
Elastic1
Wavepure
AcOpTabl
NlOpTabl
DecrTabl
LastModified
SistTabl
Dielectr
DielDiss
PzElTabl
MechTabl
HeatTabl
HeatExpn
ElOpTabl
ConstSel'''.splitlines()

TABLES_WITH_NON_ID_PK = '''Properties
EsOpTabl
Bibliogr
DensTabl
RefrTabl
Properties_Complex
HeadTabl
ElemTablNew
HardTabl'''.splitlines()

if __name__ == '__main__':

    for database, language_id in [
        ('Crystal', 1),
        ('Crystal_en', 2),

    ]:
        with open(f'scripts/{database}_transfer_id_tables.sql', 'w') as f:
            print(f'use {database};', file=f)
            for table in LANGUAGE_TABLES_WITH_ID_PK:
                print(f'ALTER TABLE dbo.{table} ADD LanguageID int NOT NULL DEFAULT({language_id});', file=f)
