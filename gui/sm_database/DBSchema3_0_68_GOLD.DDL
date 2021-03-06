--    This SQL DDL script was generated by Microsoft Visual Studio (Release Date: LOCAL BUILD).

--    Driver Used : Microsoft Visual Studio - Microsoft Access Driver.
--    Document    : E:\SpreadModel\_Databases\DBSchema3_0_68.vsd.
--    Time Created: December 14, 2005 2:27 PM.
--    Operation   : From Visio Update Database Wizard.
--    Connected data source : NADTemplate3_0_50
--    Connected server      : ACCESS
--    Connected database    : E:\SPREADMODEL\_Databases\template-3_0_50.mdb

--    With modifications by hand for the counter field inProductionType.productionTypeID


-- Update existing table `inProductionType`.
create table `inProductionType_IM0` ( 
	`productionTypeID` COUNTER,
	`descr` VARCHAR(255),
	`transitionDisease` BIT,
	`latentPeriodPdfID` INTEGER,
	`subclinicalPeriodPdfID` INTEGER,
	`clinicalPeriodPdfID` INTEGER,
	`immunePeriodPdfID` INTEGER,
	`detection` BIT,
	`detProbReportVsTimeClinicalRelID` INTEGER,
	`detProbReportVsFirstDetectionRelID` INTEGER,
	`destrBasic` BIT,
	`destrRing` BIT,
	`destrRingRadius` DOUBLE,
	`destrDirect` BIT,
	`destrDirectSuccess` DOUBLE,
	`destrDirectTracePeriod` INTEGER,
	`destrIndirect` BIT,
	`destrIndirectSuccess` DOUBLE,
	`destrIndirectTracePeriod` INTEGER,
	`destrPriority` INTEGER,
	`useVaccination` BIT,
	`vaccMinTimeBetweenVaccinations` INTEGER,
	`vaccDaysToImmunity` INTEGER,
	`vaccImmunePeriodPdfID` INTEGER,
	`vaccRing` BIT,
	`vaccRingRadius` DOUBLE,
	`vaccPriority` INTEGER); 

insert into `inProductionType_IM0` ( `productionTypeID`, `descr`, `transitionDisease`, `latentPeriodPdfID`, `subclinicalPeriodPdfID`, `clinicalPeriodPdfID`, `immunePeriodPdfID`, `detection`, `detProbReportVsTimeClinicalRelID`, `detProbReportVsFirstDetectionRelID`, `destrBasic`, `destrRing`, `destrRingRadius`, `destrDirect`, `destrDirectSuccess`, `destrDirectTracePeriod`, `destrIndirect`, `destrIndirectSuccess`, `destrIndirectTracePeriod`, `destrPriority`, `useVaccination`, `vaccMinTimeBetweenVaccinations`, `vaccDaysToImmunity`, `vaccImmunePeriodPdfID`, `vaccRing`, `vaccRingRadius`, `vaccPriority`) 
    select `inProductionType`.`productionTypeID`, 
           `inProductionType`.`descr`, 
           `inProductionType`.`transitionDisease`, 
           `inProductionType`.`latentPeriodPdfID`, 
           `inProductionType`.`subclinicalPeriodPdfID`, 
           `inProductionType`.`clinicalPeriodPdfID`, 
           `inProductionType`.`immunePeriodPdfID`, 
           `inProductionType`.`detection`, 
           `inProductionType`.`detProbReportVsTimeClinicalRelID`, 
           `inProductionType`.`detProbReportVsFirstDetectionRelID`, 
           `inProductionType`.`destrBasic`, 
           `inProductionType`.`destrRing`, 
           `inProductionType`.`destrRingRadius`, 
           `inProductionType`.`destrDirect`, 
           `inProductionType`.`destrDirectSuccess`, 
           `inProductionType`.`destrDirectTracePeriod`, 
           `inProductionType`.`destrIndirect`, 
           `inProductionType`.`destrIndirectSuccess`, 
           `inProductionType`.`destrIndirectTracePeriod`, 
           `inProductionType`.`destrPriority`, 
           `inProductionType`.`useVaccination`, 
           `inProductionType`.`vaccMinTimeBetweenVaccinations`, 
           `inProductionType`.`vaccDaysToImmunity`, 
           `inProductionType`.`vaccImmunePeriodPdfID`, 
           `inProductionType`.`vaccRing`, 
           `inProductionType`.`vaccRingRadius`, 
           `inProductionType`.`vaccPriority`  
    from `inProductionType`;


alter table `dynHerd`
	drop constraint `inProductionType_dynHerd_FK1`;


alter table `inProductionTypePair`
	drop constraint `inProductionType_inProductionTypePairs_FK1`;


alter table `inProductionTypePair`
	drop constraint `inProductionType_inProductionTypePairs_FK2`;


alter table `outDailyByProductionType`
	drop constraint `inProductionType_outDailyByProductionType_FK1`;


alter table `outIterationByProductionType`
	drop constraint `inProductionType_outIterationByProductionType_FK1`;


alter table `inProductionType`
	drop constraint `FK1`;


alter table `inProductionType`
	drop constraint `FK2`;


alter table `inProductionType`
	drop constraint `FK4`;


alter table `inProductionType`
	drop constraint `inChart_inProductionType_FK3`;


alter table `inProductionType`
	drop constraint `inChart_inProductionType_FK5`;


alter table `inProductionType`
	drop constraint `inChart_inProductionType_FK6`;


alter table `inProductionType`
	drop constraint `inChart_inProductionType_FK7`;


drop table `inProductionType`; 


-- `inProductionType` : Table of inProductionType
-- 	`costAppraisalPerUnit` : costAppraisalPerUnit is of inProductionType
-- 	`costCleaningPerUnit` : costCleaningPerUnit is of inProductionType
-- 	`costEuthanasiaPerAnimal` : costEuthanasiaPerAnimal is of inProductionType
-- 	`costIndemnificationPerAnimal` : costIndemnificationPerAnimal is of inProductionType
-- 	`costDisposalPerAnimal` : costDisposalPerAnimal is of inProductionType
-- 	`costVaccinationSetupPerUnit` : costVaccinationSetupPerUnit is of inProductionType
-- 	`costVaccinationThreshold` : costVaccinationThreshold is of inProductionType
-- 	`costVaccinationBaselinePerAnimal` : costVaccinationBaselinePerAnimal is of inProductionType
-- 	`costVaccinationAdditionalPerAnimal` : costVaccinationAdditionalPerAnimal is of inProductionType  
create table `inProductionType` ( 
	`productionTypeID` COUNTER,
	`descr` VARCHAR(255),
	`useDiseaseTransition` BIT,
	`disLatentPeriodPdfID` INTEGER,
	`disSubclinicalPeriodPdfID` INTEGER,
	`disClinicalPeriodPdfID` INTEGER,
	`disImmunePeriodPdfID` INTEGER,
	`useDetection` BIT,
	`detProbReportVsTimeClinicalRelID` INTEGER,
	`detProbReportVsFirstDetectionRelID` INTEGER,
	`useBasicDestruction` BIT,
	`useRingDestruction` BIT,
	`destrRingRadius` DOUBLE,
	`destrDirect` BIT,
	`destrDirectSuccess` DOUBLE,
	`destrDirectTracePeriod` INTEGER,
	`destrIndirect` BIT,
	`destrIndirectSuccess` DOUBLE,
	`destrIndirectTracePeriod` INTEGER,
	`destrPriority` INTEGER,
	`useVaccination` BIT,
	`vaccMinTimeBetweenVaccinations` INTEGER,
	`vaccDaysToImmunity` INTEGER,
	`vaccImmunePeriodPdfID` INTEGER,
	`vaccRing` BIT,
	`vaccRingRadius` DOUBLE,
	`vaccPriority` INTEGER,
	`useCosts` BIT,
	`costDestrAppraisalPerUnit` DOUBLE,
	`costDestrCleaningPerUnit` DOUBLE,
	`costDestrEuthanasiaPerAnimal` DOUBLE,
	`costDestrIndemnificationPerAnimal` DOUBLE,
	`costDestrDisposalPerAnimal` DOUBLE,
	`costVaccSetupPerUnit` DOUBLE,
	`costVaccThreshold` INTEGER,
	`costVaccBaselinePerAnimal` DOUBLE,
	`costVaccAdditionalPerAnimal` DOUBLE); 

insert into `inProductionType` (`productionTypeID`,`descr`, `useDiseaseTransition`, `disLatentPeriodPdfID`, `disSubclinicalPeriodPdfID`, `disClinicalPeriodPdfID`, `disImmunePeriodPdfID`, `useDetection`, `detProbReportVsTimeClinicalRelID`, `detProbReportVsFirstDetectionRelID`, `useBasicDestruction`, `useRingDestruction`, `destrRingRadius`, `destrDirect`, `destrDirectSuccess`, `destrDirectTracePeriod`, `destrIndirect`, `destrIndirectSuccess`, `destrIndirectTracePeriod`, `destrPriority`, `useVaccination`, `vaccMinTimeBetweenVaccinations`, `vaccDaysToImmunity`, `vaccImmunePeriodPdfID`, `vaccRing`, `vaccRingRadius`, `vaccPriority`) 
    select `inProductionType_IM0`.`productionTypeID`, 
           `inProductionType_IM0`.`descr`, 
           `inProductionType_IM0`.`transitionDisease`, 
           `inProductionType_IM0`.`latentPeriodPdfID`, 
           `inProductionType_IM0`.`subclinicalPeriodPdfID`, 
           `inProductionType_IM0`.`clinicalPeriodPdfID`, 
           `inProductionType_IM0`.`immunePeriodPdfID`, 
           `inProductionType_IM0`.`detection`, 
           `inProductionType_IM0`.`detProbReportVsTimeClinicalRelID`, 
           `inProductionType_IM0`.`detProbReportVsFirstDetectionRelID`, 
           `inProductionType_IM0`.`destrBasic`, 
           `inProductionType_IM0`.`destrRing`, 
           `inProductionType_IM0`.`destrRingRadius`, 
           `inProductionType_IM0`.`destrDirect`, 
           `inProductionType_IM0`.`destrDirectSuccess`, 
           `inProductionType_IM0`.`destrDirectTracePeriod`, 
           `inProductionType_IM0`.`destrIndirect`, 
           `inProductionType_IM0`.`destrIndirectSuccess`, 
           `inProductionType_IM0`.`destrIndirectTracePeriod`, 
           `inProductionType_IM0`.`destrPriority`, 
           `inProductionType_IM0`.`useVaccination`, 
           `inProductionType_IM0`.`vaccMinTimeBetweenVaccinations`, 
           `inProductionType_IM0`.`vaccDaysToImmunity`, 
           `inProductionType_IM0`.`vaccImmunePeriodPdfID`, 
           `inProductionType_IM0`.`vaccRing`, 
           `inProductionType_IM0`.`vaccRingRadius`, 
           `inProductionType_IM0`.`vaccPriority`  
    from `inProductionType_IM0`;


drop table `inProductionType_IM0`; 


alter table `inProductionType`
	add constraint `inProductionType_PK` primary key (`productionTypeID`) ; 


-- Update existing table `inGeneral`.
create table `inGeneral_IM0` ( 
	`inGeneralID` VARCHAR(10),
	`scenarioDescr` LONGTEXT,
	`iterations` INTEGER,
	`days` INTEGER,
	`simStopReason` VARCHAR(25),
	`includeContactSpread` BIT,
	`includeAirborneSpread` BIT,
	`includeEconomics` BIT,
	`useFixedRandomSeed` BIT,
	`randomSeed` INTEGER,
	`useFixedPoissonValue` BIT,
	`poissonValue` DOUBLE,
	`saveAllDailyOutputs` BIT,
	`saveDailyOutputsForIterations` INTEGER,
	`writeDailyStatesFile` BIT,
	`dailyStatesFileName` VARCHAR(255),
	`saveDailyEvents` BIT,
	`saveDailyExposures` BIT); 

insert into `inGeneral_IM0` (`inGeneralID`, `scenarioDescr`, `iterations`, `days`, `simStopReason`, `includeContactSpread`, `includeAirborneSpread`, `includeEconomics`, `useFixedRandomSeed`, `randomSeed`, `useFixedPoissonValue`, `poissonValue`, `saveAllDailyOutputs`, `saveDailyOutputsForIterations`, `writeDailyStatesFile`, `dailyStatesFileName`, `saveDailyEvents`, `saveDailyExposures`) 
    select `inGeneral`.`inGeneralID`, 
           `inGeneral`.`scenarioDescr`, 
           `inGeneral`.`iterations`, 
           `inGeneral`.`days`, 
           `inGeneral`.`simStopReason`, 
           `inGeneral`.`includeContactSpread`, 
           `inGeneral`.`includeAirborneSpread`, 
           `inGeneral`.`includeEconomics`, 
           `inGeneral`.`useFixedRandomSeed`, 
           `inGeneral`.`randomSeed`, 
           `inGeneral`.`useFixedPoissonValue`, 
           `inGeneral`.`poissonValue`, 
           `inGeneral`.`saveAllDailyOutputs`, 
           `inGeneral`.`saveDailyOutputsForIterations`, 
           `inGeneral`.`writeDailyStatesFile`, 
           `inGeneral`.`dailyStatesFileName`, 
           `inGeneral`.`saveDailyEvents`, 
           `inGeneral`.`saveDailyExposures`  
    from `inGeneral`;


drop table `inGeneral`; 


-- `inGeneral` : Table of inGeneral  
create table `inGeneral` ( 
	`inGeneralID` VARCHAR(10),
	`scenarioDescr` LONGTEXT,
	`iterations` INTEGER,
	`days` INTEGER,
	`simStopReason` VARCHAR(25),
	`includeContactSpread` BIT,
	`includeAirborneSpread` BIT,
	`includeCosts` BIT,
	`useFixedRandomSeed` BIT,
	`randomSeed` INTEGER,
	`useFixedPoissonValue` BIT,
	`poissonValue` DOUBLE,
	`saveAllDailyOutputs` BIT,
	`saveDailyOutputsForIterations` INTEGER,
	`writeDailyStatesFile` BIT,
	`dailyStatesFileName` VARCHAR(255),
	`saveDailyEvents` BIT,
	`saveDailyExposures` BIT); 

insert into `inGeneral` (`inGeneralID`, `scenarioDescr`, `iterations`, `days`, `simStopReason`, `includeContactSpread`, `includeAirborneSpread`, `includeCosts`, `useFixedRandomSeed`, `randomSeed`, `useFixedPoissonValue`, `poissonValue`, `saveAllDailyOutputs`, `saveDailyOutputsForIterations`, `writeDailyStatesFile`, `dailyStatesFileName`, `saveDailyEvents`, `saveDailyExposures`) 
    select `inGeneral_IM0`.`inGeneralID`, 
           `inGeneral_IM0`.`scenarioDescr`, 
           `inGeneral_IM0`.`iterations`, 
           `inGeneral_IM0`.`days`, 
           `inGeneral_IM0`.`simStopReason`, 
           `inGeneral_IM0`.`includeContactSpread`, 
           `inGeneral_IM0`.`includeAirborneSpread`, 
           `inGeneral_IM0`.`includeEconomics`, 
           `inGeneral_IM0`.`useFixedRandomSeed`, 
           `inGeneral_IM0`.`randomSeed`, 
           `inGeneral_IM0`.`useFixedPoissonValue`, 
           `inGeneral_IM0`.`poissonValue`, 
           `inGeneral_IM0`.`saveAllDailyOutputs`, 
           `inGeneral_IM0`.`saveDailyOutputsForIterations`, 
           `inGeneral_IM0`.`writeDailyStatesFile`, 
           `inGeneral_IM0`.`dailyStatesFileName`, 
           `inGeneral_IM0`.`saveDailyEvents`, 
           `inGeneral_IM0`.`saveDailyExposures`  
    from `inGeneral_IM0`;


drop table `inGeneral_IM0`; 


alter table `inGeneral`
	add constraint `inGeneral_PK` primary key (`inGeneralID`) ; 


create index `inGeneralID` on `inGeneral` (
	`inGeneralID` ASC); 


-- Restore foreign key constraints for existing tables
alter table `outEpidemicCurves`
	add constraint `inProductionType_outEpidemicCurves_FK1` foreign key (
		`productionTypeID`)
	 references `inProductionType` (
		`productionTypeID`); 

alter table `inProductionType`
	add constraint `FK1` foreign key (
		`disLatentPeriodPdfID`)
	 references `inChart` (
		`chartID`); 

alter table `inProductionType`
	add constraint `FK2` foreign key (
		`disSubclinicalPeriodPdfID`)
	 references `inChart` (
		`chartID`); 

alter table `inProductionType`
	add constraint `FK4` foreign key (
		`disImmunePeriodPdfID`)
	 references `inChart` (
		`chartID`); 

alter table `inProductionType`
	add constraint `inChart_inProductionType_FK3` foreign key (
		`disClinicalPeriodPdfID`)
	 references `inChart` (
		`chartID`); 

alter table `inProductionType`
	add constraint `inChart_inProductionType_FK5` foreign key (
		`detProbReportVsTimeClinicalRelID`)
	 references `inChart` (
		`chartID`); 

alter table `inProductionType`
	add constraint `inChart_inProductionType_FK6` foreign key (
		`detProbReportVsFirstDetectionRelID`)
	 references `inChart` (
		`chartID`); 

alter table `inProductionType`
	add constraint `inChart_inProductionType_FK7` foreign key (
		`vaccImmunePeriodPdfID`)
	 references `inChart` (
		`chartID`); 

alter table `dynHerd`
	add constraint `inProductionType_dynHerd_FK1` foreign key (
		`productionTypeID`)
	 references `inProductionType` (
		`productionTypeID`); 

alter table `inProductionTypePair`
	add constraint `inProductionType_inProductionTypePairs_FK1` foreign key (
		`sourceProductionTypeID`)
	 references `inProductionType` (
		`productionTypeID`); 

alter table `inProductionTypePair`
	add constraint `inProductionType_inProductionTypePairs_FK2` foreign key (
		`destProductionTypeID`)
	 references `inProductionType` (
		`productionTypeID`); 

alter table `outDailyByProductionType`
	add constraint `inProductionType_outDailyByProductionType_FK1` foreign key (
		`productionTypeID`)
	 references `inProductionType` (
		`productionTypeID`); 

alter table `outIterationByProductionType`
	add constraint `inProductionType_outIterationByProductionType_FK1` foreign key (
		`productionTypeID`)
	 references `inProductionType` (
		`productionTypeID`); 


-- Create new table `outIterationCosts`.
-- `outIterationCosts` : Table of outIterationCosts
-- 	`iteration` : iteration partly identifies outIterationCosts
-- 	`destrAppraisal` : destrAppraisal is of outIterationCosts
-- 	`destrCleaning` : destrCleaning is of outIterationCosts
-- 	`destrEuthanasia` : destrEuthanasia is of outIterationCosts
-- 	`destrIndemnification` : destrIndemnification is of outIterationCosts
-- 	`destrDisposal` : destrDisposal is of outIterationCosts
-- 	`vaccSetup` : vaccSetup is of outIterationCosts
-- 	`vaccVaccination` : vaccVaccination is of outIterationCosts
-- 	`productionTypeID` : productionTypeID identifies outIterationCosts  
create table `outIterationCosts` ( 
	`iteration` INTEGER,
	`productionTypeID` INTEGER,
	`destrAppraisal` CURRENCY,	
	`destrCleaning` CURRENCY,
	`destrEuthanasia` CURRENCY,
	`destrIndemnification` CURRENCY,
	`destrDisposal` CURRENCY,
	`vaccSetup` CURRENCY,
	`vaccVaccination` CURRENCY, 
	constraint `outIterationCosts_PK` primary key (`productionTypeID`, `iteration`) ); 


-- Add foreign key constraints to table `outIterationCosts`.
alter table `outIterationCosts`
	add constraint `inProductionType_outIterationCosts_FK1` foreign key (
		`productionTypeID`)
	 references `inProductionType` (
		`productionTypeID`); 


-- This is the end of the Microsoft Visual Studio generated SQL DDL script.
