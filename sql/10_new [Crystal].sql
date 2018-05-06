use Crystal;

alter table dbo.HeadTablInvariant
add [SystemUrl] as (replace(replace(System, '<sub>', ''),'</sub>', ''));
go

alter table dbo.PropertiesInvariant add TableNameUrl varchar(50);
go

update P
set TableNameUrl = (case
  when P.TableName = 'RefrTabl' then 'Review'
	when P.TableName = 'SistTabl' then 'Composition'
	when P.TableName = 'HeatTabl' then 'Heat'
	when P.TableName = 'DensTabl' then 'Density'
	when P.TableName = 'HardTabl' then 'Hardness'
	when P.TableName = 'SuspTabl' then 'Solubility'
	when P.TableName = 'PlavTabl' then 'Melt'
	when P.TableName = 'CuryTabl' then 'Cury'
	when P.TableName = 'ModfTabl' then 'Crystal_Mod'
	when P.TableName = 'ElemTabl' then 'Lattice'
	when P.TableName = 'HeatExpn0' then 'Thermal_Expansion'
	when P.TableName = 'HeatExpn1' then 'Thermal_Conductivity'
	when P.TableName = 'Dielectr' then 'Dielectric'
	when P.TableName = 'DielDiss' then 'Dielectric_Loss'
	when P.TableName = 'PzElTabl' then 'Piezoelectric'
	when P.TableName = 'MechTabl' then 'Piezoelectric_Coupling'
	when P.TableName = 'MechTabl' then 'Piezoelectric_Coupling'
	when P.TableName = 'Elastic1' then 'Elastic'
	when P.TableName = 'Wavepure' then 'Transparency'
	when P.TableName = 'RefrcInd' then 'Refractive'
	when P.TableName = 'ConstSel' then 'Sellmeier'
	when P.TableName = 'ElOpTabl' then 'Electro-optical'
	when P.TableName = 'EsOpTabl' then 'Elasto-optical'
	when P.TableName = 'NlOpTabl' then 'Nonlinear-optical'
	when P.TableName = 'DecrTabl' then 'Wave'
	when P.TableName = 'AcOpTabl' then 'Acousto-optical'
	when P.TableName = 'LitrTabl' then 'References'
end)
from dbo.PropertiesInvariant P;
go