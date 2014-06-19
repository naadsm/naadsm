-- rollback-3_2-to-3_1.sql
-- -----------------------
-- Begin: 2006/03/01
-- Last revision: $Date: 2011-08-30 15:55:24 $ $Author: areeves $
-- Version: $Revision: 1.1.2.1 $
-- Project: NAADSM
-- Website: http://www.naadsm.org
-- Author: Aaron Reeves <aaron.reeves@naadsm.org>
-- --------------------------------------------------
-- Copyright (C) 2011 Animal Population Health Institute, Colorado State University
-- 
-- This program is free software; you can redistribute it and/or modify it under the terms of the GNU General
-- Public License as published by the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.

-- ---------------------
-- This can be executed against a NAADSM 3.2-compatible scenario file 
-- (a Microsoft Access-formatted file) to roll it back to a version
-- of the NAADSM database schema that is compatible with NAADSM 3.1.
-- Reasons for doing so are exceedingly rare, but in some instances, 
-- this capability might be helpful for trouble-shooting or comparison
-- of results generated by these two major versions of NAADSM.
-- 
-- The code in this file can be run against an Access database using
-- an application like JetSQLConsole (http://sourceforge.net/projects/jetsqlconsole/).
-- ---------------------


-- Delete all output
--------------------
delete from outDailyByProductionType;
delete from outIterationByProductionType;
delete from outIterationCosts;
delete from outIterationByZone;
delete from outDailyByZone;
delete from outIterationByZoneAndProductionType;
delete from outDailyByZoneAndProductionType;
delete from outDailyEvents;
delete from outDailyExposures;
delete from outIterationByHerd;
delete from outEpidemicCurves;
--delete from outSelectDailyByProductionType;
--delete from outSelectDailyByZoneAndProductionType;
update outGeneral set simulationStartTime = NULL, simulationEndTime = NULL, completedIterations = NULL, version = NULL;

update dynHerd set finalStateCode = NULL, finalDetectionStateCode = NULL, finalControlStateCode = NULL, cumulInfected = NULL, cumulDetected = NULL, cumulDestroyed = NULL, cumulVaccinated = NULL;


-- Roll back from 3.2.13
------------------------
alter table outIterationByProductionType drop column firstDetUInf;
alter table outIterationByProductionType drop column firstDetAInf;


-- Roll back from 3.2.11
------------------------
alter table outIterationByProductionType drop column tocUDirFwd;
alter table outIterationByProductionType drop column tocUIndFwd;
alter table outIterationByProductionType drop column tocUDirBack;
alter table outIterationByProductionType drop column tocUIndBack;

alter table outDailyByProductionType drop column tocUDirFwd;
alter table outDailyByProductionType drop column tocUIndFwd;
alter table outDailyByProductionType drop column tocUDirBack;
alter table outDailyByProductionType drop column tocUIndBack;
alter table outDailyByProductionType drop column tonUDirFwd;
alter table outDailyByProductionType drop column tonUIndFwd;
alter table outDailyByProductionType drop column tonUDirBack;
alter table outDailyByProductionType drop column tonUIndBack;

alter table inSelectDailyOutputs drop column stocUDirFwd;
alter table inSelectDailyOutputs drop column stocUIndFwd;
alter table inSelectDailyOutputs drop column stocUDirBack;
alter table inSelectDailyOutputs drop column stocUIndBack;
alter table inSelectDailyOutputs drop column stonUDirFwd;
alter table inSelectDailyOutputs drop column stonUIndFwd;
alter table inSelectDailyOutputs drop column stonUDirBack;
alter table inSelectDailyOutputs drop column stonUIndBack;

alter table outDailyEvents add column traceSuccess bit;

delete from readSpreadMethodCodes where spreadMethodCode = "TBD";
delete from readSpreadMethodCodes where spreadMethodCode = "TBI";
delete from readSpreadMethodCodes where spreadMethodCode = "TFD";
delete from readSpreadMethodCodes where spreadMethodCode = "TFI";

alter table `outDailyExposures` drop constraint `readSpreadMethodCodes_outDailyExposures_FK1`;
  
alter table `inDiseaseSpread` drop constraint `readSpreadMethodCodes_inDiseaseSpread_FK1`;  

alter table readSpreadMethodCodes alter column spreadMethodCode char(1);

alter table outDailyExposures alter column spreadMethodCode char(1);

alter table inDiseaseSpread alter column spreadMethodCode char(1);

alter table `outDailyExposures`
	add constraint `readSpreadMethodCodes_outDailyExposures_FK1` foreign key (
		`spreadMethodCode`)
	 references `readSpreadMethodCodes` (
		`spreadMethodCode`); 
    
alter table `inDiseaseSpread`
	add constraint `readSpreadMethodCodes_inDiseaseSpread_FK1` foreign key (
		`spreadMethodCode`)
	 references `readSpreadMethodCodes` (
		`spreadMethodCode`);   

    
-- Roll back from 3.2.5
-----------------------
UPDATE `inChart` SET `yAxisUnits` = "Percent" WHERE `fieldName` = "ZONMovementDirect";
UPDATE `inChart` SET `yAxisUnits` = "Percent" WHERE `fieldName` = "ZONMovementIndirect";
UPDATE `inChart` SET `yAxisUnits` = "Percent" WHERE `fieldName` = "DPrevalence";
UPDATE `inChart` SET `yAxisUnits` = "Percent" WHERE `fieldName` = "CMMovementControlIndirect";
UPDATE `inChart` SET `yAxisUnits` = "Percent" WHERE `fieldName` = "CMMovementControlDirect";
UPDATE `inChart` SET `yAxisUnits` = "Percent" WHERE `fieldName` = "DetProbObsVsTimeClinical";
UPDATE `inChart` SET `yAxisUnits` = "Percent probability" WHERE `fieldName` = "DetProbReportVsFirstDetection"; 


-- Roll back from 3.2.2
-----------------------
update `readEventCodes` set `eventCode` = "X" where `eventCode` = "M";
update `readDetectionStateCodes` set `detectionStateCode` = "X" where `detectionStateCode` = "M";


-- Roll back from 3.2.1
-----------------------
alter table outIterationByProductionType drop column lastDetection;


-- Roll back from 3.2.0
-----------------------
alter table outIterationByZone drop column `maxZonePerimeter`;
alter table outIterationByZone drop column `maxZonePerimeterDay`;
alter table outIterationByZone drop column `finalZonePerimeter`;
alter table outIterationByZone drop column `maxZoneArea`;
alter table outIterationByZone drop column `maxZoneAreaDay`;
alter table outIterationByZone drop column `finalZoneArea`;
alter table outIterationByZone add column `maxArea` DOUBLE;
alter table outIterationByZone add column `maxAreaDay` INTEGER;
alter table outIterationByZone add column `finalArea` DOUBLE;

alter table outDailyByZone drop column zonePerimeter;
alter table outDailyByZone drop column zoneArea;
alter table outDailyByZone add column area double;

alter table outIteration drop column deswUMax;
alter table outIteration drop column deswUMaxDay;
alter table outIteration drop column deswAMax;
alter table outIteration drop column deswAMaxDay;
alter table outIteration drop column deswUTimeMax;
alter table outIteration drop column deswUTimeAvg;
alter table outIteration drop column vacwUMax;
alter table outIteration drop column vacwUMaxDay;
alter table outIteration drop column vacwAMax;
alter table outIteration drop column vacwAMaxDay;
alter table outIteration drop column vacwUTimeMax;
alter table outIteration drop column vacwUTimeAvg;

alter table outDailyByProductionType drop column `trcUDirFwd`;
alter table outDailyByProductionType drop column `trcADirFwd`;
alter table outDailyByProductionType drop column `trcUIndFwd`;
alter table outDailyByProductionType drop column `trcAIndFwd`;
alter table outDailyByProductionType drop column `trcUDirpFwd`;
alter table outDailyByProductionType drop column `trcADirpFwd`;
alter table outDailyByProductionType drop column `trcUIndpFwd`;
alter table outDailyByProductionType drop column `trcAIndpFwd`;
alter table outDailyByProductionType drop column `trnUDirFwd`;
alter table outDailyByProductionType drop column `trnADirFwd`;
alter table outDailyByProductionType drop column `trnUIndFwd`;
alter table outDailyByProductionType drop column `trnAIndFwd`;
alter table outDailyByProductionType drop column `trcUDirBack`;
alter table outDailyByProductionType drop column `trcADirBack`;
alter table outDailyByProductionType drop column `trcUIndBack`;
alter table outDailyByProductionType drop column `trcAIndBack`;
alter table outDailyByProductionType drop column `trcUDirpBack`;
alter table outDailyByProductionType drop column `trcADirpBack`;
alter table outDailyByProductionType drop column `trcUIndpBack`;
alter table outDailyByProductionType drop column `trcAIndpBack`;
alter table outDailyByProductionType drop column `trnUDirBack`;
alter table outDailyByProductionType drop column `trnADirBack`;
alter table outDailyByProductionType drop column `trnUIndBack`;
alter table outDailyByProductionType drop column `trnAIndBack`;
alter table outDailyByProductionType drop column `exmcUDirFwd`;
alter table outDailyByProductionType drop column `exmcADirFwd`;
alter table outDailyByProductionType drop column `exmcUIndFwd`;
alter table outDailyByProductionType drop column `exmcAIndFwd`;
alter table outDailyByProductionType drop column `exmcUDirBack`;
alter table outDailyByProductionType drop column `exmcADirBack`;
alter table outDailyByProductionType drop column `exmcUIndBack`;
alter table outDailyByProductionType drop column `exmcAIndBack`;
alter table outDailyByProductionType drop column `exmnUAll`;
alter table outDailyByProductionType drop column `exmnAAll`;
alter table outDailyByProductionType drop column `tstcUDirFwd`;
alter table outDailyByProductionType drop column `tstcADirFwd`;
alter table outDailyByProductionType drop column `tstcUIndFwd`;
alter table outDailyByProductionType drop column `tstcAIndFwd`;
alter table outDailyByProductionType drop column `tstcUDirBack`;
alter table outDailyByProductionType drop column `tstcADirBack`;
alter table outDailyByProductionType drop column `tstcUIndBack`;
alter table outDailyByProductionType drop column `tstcAIndBack`;
alter table outDailyByProductionType drop column `tstcUTruePos`;
alter table outDailyByProductionType drop column `tstcATruePos`;
alter table outDailyByProductionType drop column `tstnUTruePos`;
alter table outDailyByProductionType drop column `tstnATruePos`;
alter table outDailyByProductionType drop column `tstcUTrueNeg`;
alter table outDailyByProductionType drop column `tstcATrueNeg`;
alter table outDailyByProductionType drop column `tstnUTrueNeg`;
alter table outDailyByProductionType drop column `tstnATrueNeg`;
alter table outDailyByProductionType drop column `tstcUFalsePos`;
alter table outDailyByProductionType drop column `tstcAFalsePos`;
alter table outDailyByProductionType drop column `tstnUFalsePos`;
alter table outDailyByProductionType drop column `tstnAFalsePos`;
alter table outDailyByProductionType drop column `tstcUFalseNeg`;
alter table outDailyByProductionType drop column `tstcAFalseNeg`;
alter table outDailyByProductionType drop column `tstnUFalseNeg`;
alter table outDailyByProductionType drop column `tstnAFalseNeg`;
alter table outDailyByProductionType drop column `detnUTest`;
alter table outDailyByProductionType drop column `detnATest`;
alter table outDailyByProductionType drop column `detcUTest`;
alter table outDailyByProductionType drop column `detcATest`;
alter table outDailyByProductionType drop column `descUDirFwd`;
alter table outDailyByProductionType drop column `descADirFwd`;
alter table outDailyByProductionType drop column `descUIndFwd`;
alter table outDailyByProductionType drop column `descAIndFwd`; 
alter table outDailyByProductionType drop column `descUDirBack`;
alter table outDailyByProductionType drop column `descADirBack`;
alter table outDailyByProductionType drop column `descUIndBack`;
alter table outDailyByProductionType drop column `descAIndBack`;
alter table outDailyByProductionType drop column `deswUAll`;
alter table outDailyByProductionType drop column `deswAAll`;
alter table outDailyByProductionType drop column `vacnUAll`;
alter table outDailyByProductionType drop column `vacnAAll`;
alter table outDailyByProductionType drop column `vacwUAll`;
alter table outDailyByProductionType drop column `vacwAAll`;
alter table outDailyByProductionType drop column `appdUInfectious`;

alter table outDailyByProductionType add column `trcUDir` long;
alter table outDailyByProductionType add column `trcADir` long;
alter table outDailyByProductionType add column `trcUInd` long;
alter table outDailyByProductionType add column `trcAInd` long;
alter table outDailyByProductionType add column `trcUDirp` long;
alter table outDailyByProductionType add column `trcADirp` long;
alter table outDailyByProductionType add column `trcUIndp` long;
alter table outDailyByProductionType add column `trcAIndp` long;
alter table outDailyByProductionType add column `trnUDir` long;
alter table outDailyByProductionType add column `trnADir` long;
alter table outDailyByProductionType add column `trnUInd` long;
alter table outDailyByProductionType add column `trnAInd` long;
alter table outDailyByProductionType add column `descUDir` long;
alter table outDailyByProductionType add column `descADir` long;
alter table outDailyByProductionType add column `descUInd` long;
alter table outDailyByProductionType add column `descAInd` long; 
alter table outDailyByProductionType add column vaccnUAll long;
alter table outDailyByProductionType add column vaccnAAll long;
alter table outDailyByProductionType add column appUInfectious long;

alter table inSelectDailyOutputs drop column `strcUDirFwd`;
alter table inSelectDailyOutputs drop column `strcADirFwd`;
alter table inSelectDailyOutputs drop column `strcUIndFwd`;
alter table inSelectDailyOutputs drop column `strcAIndFwd`;
alter table inSelectDailyOutputs drop column `strcUDirpFwd`;
alter table inSelectDailyOutputs drop column `strcADirpFwd`;
alter table inSelectDailyOutputs drop column `strcUIndpFwd`;
alter table inSelectDailyOutputs drop column `strcAIndpFwd`;
alter table inSelectDailyOutputs drop column `strnUDirFwd`;
alter table inSelectDailyOutputs drop column `strnADirFwd`;
alter table inSelectDailyOutputs drop column `strnUIndFwd`;
alter table inSelectDailyOutputs drop column `strnAIndFwd`;
alter table inSelectDailyOutputs drop column `strcUDirBack`;
alter table inSelectDailyOutputs drop column `strcADirBack`;
alter table inSelectDailyOutputs drop column `strcUIndBack`;
alter table inSelectDailyOutputs drop column `strcAIndBack`;
alter table inSelectDailyOutputs drop column `strcUDirpBack`;
alter table inSelectDailyOutputs drop column `strcADirpBack`;
alter table inSelectDailyOutputs drop column `strcUIndpBack`;
alter table inSelectDailyOutputs drop column `strcAIndpBack`;
alter table inSelectDailyOutputs drop column `strnUDirBack`;
alter table inSelectDailyOutputs drop column `strnADirBack`;
alter table inSelectDailyOutputs drop column `strnUIndBack`;
alter table inSelectDailyOutputs drop column `strnAIndBack`;
alter table inSelectDailyOutputs drop column `sexmcUDirFwd`;
alter table inSelectDailyOutputs drop column `sexmcADirFwd`;
alter table inSelectDailyOutputs drop column `sexmcUIndFwd`;
alter table inSelectDailyOutputs drop column `sexmcAIndFwd`;
alter table inSelectDailyOutputs drop column `sexmcUDirBack`;
alter table inSelectDailyOutputs drop column `sexmcADirBack`;
alter table inSelectDailyOutputs drop column `sexmcUIndBack`;
alter table inSelectDailyOutputs drop column `sexmcAIndBack`;
alter table inSelectDailyOutputs drop column `sexmnUAll`;
alter table inSelectDailyOutputs drop column `sexmnAAll`;
alter table inSelectDailyOutputs drop column `ststcUDirFwd`;
alter table inSelectDailyOutputs drop column `ststcADirFwd`;
alter table inSelectDailyOutputs drop column `ststcUIndFwd`;
alter table inSelectDailyOutputs drop column `ststcAIndFwd`;
alter table inSelectDailyOutputs drop column `ststcUDirBack`;
alter table inSelectDailyOutputs drop column `ststcADirBack`;
alter table inSelectDailyOutputs drop column `ststcUIndBack`;
alter table inSelectDailyOutputs drop column `ststcAIndBack`;
alter table inSelectDailyOutputs drop column `ststcUTruePos`;
alter table inSelectDailyOutputs drop column `ststcATruePos`;
alter table inSelectDailyOutputs drop column `ststnUTruePos`;
alter table inSelectDailyOutputs drop column `ststnATruePos`;
alter table inSelectDailyOutputs drop column `ststcUTrueNeg`;
alter table inSelectDailyOutputs drop column `ststcATrueNeg`;
alter table inSelectDailyOutputs drop column `ststnUTrueNeg`;
alter table inSelectDailyOutputs drop column `ststnATrueNeg`;
alter table inSelectDailyOutputs drop column `ststcUFalsePos`;
alter table inSelectDailyOutputs drop column `ststcAFalsePos`;
alter table inSelectDailyOutputs drop column `ststnUFalsePos`;
alter table inSelectDailyOutputs drop column `ststnAFalsePos`;
alter table inSelectDailyOutputs drop column `ststcUFalseNeg`;
alter table inSelectDailyOutputs drop column `ststcAFalseNeg`;
alter table inSelectDailyOutputs drop column `ststnUFalseNeg`;
alter table inSelectDailyOutputs drop column `ststnAFalseNeg`;
alter table inSelectDailyOutputs drop column `sdetnUTest`;
alter table inSelectDailyOutputs drop column `sdetnATest`;
alter table inSelectDailyOutputs drop column `sdetcUTest`;
alter table inSelectDailyOutputs drop column `sdetcATest`;
alter table inSelectDailyOutputs drop column `sdescUDirFwd`;
alter table inSelectDailyOutputs drop column `sdescADirFwd`;
alter table inSelectDailyOutputs drop column `sdescUIndFwd`;
alter table inSelectDailyOutputs drop column `sdescAIndFwd`; 
alter table inSelectDailyOutputs drop column `sdescUDirBack`;
alter table inSelectDailyOutputs drop column `sdescADirBack`;
alter table inSelectDailyOutputs drop column `sdescUIndBack`;
alter table inSelectDailyOutputs drop column `sdescAIndBack`;
alter table inSelectDailyOutputs drop column `sdeswUAll`;
alter table inSelectDailyOutputs drop column `sdeswAAll`;
alter table inSelectDailyOutputs drop column `svacnUAll`;
alter table inSelectDailyOutputs drop column `svacnAAll`;
alter table inSelectDailyOutputs drop column `svacwUAll`;
alter table inSelectDailyOutputs drop column `svacwAAll`;
alter table inSelectDailyOutputs drop column `sappdUInfectious`;

alter table inSelectDailyOutputs add column `strcUDir` bit;
alter table inSelectDailyOutputs add column `strcADir` bit;
alter table inSelectDailyOutputs add column `strcUInd` bit;
alter table inSelectDailyOutputs add column `strcAInd` bit;
alter table inSelectDailyOutputs add column `strcUDirp` bit;
alter table inSelectDailyOutputs add column `strcADirp` bit;
alter table inSelectDailyOutputs add column `strcUIndp` bit;
alter table inSelectDailyOutputs add column `strcAIndp` bit;
alter table inSelectDailyOutputs add column `strnUDir` bit;
alter table inSelectDailyOutputs add column `strnADir` bit;
alter table inSelectDailyOutputs add column `strnUInd` bit;
alter table inSelectDailyOutputs add column `strnAInd` bit;
alter table inSelectDailyOutputs add column `sdescUDir` bit;
alter table inSelectDailyOutputs add column `sdescADir` bit;
alter table inSelectDailyOutputs add column `sdescUInd` bit;
alter table inSelectDailyOutputs add column `sdescAInd` bit; 
alter table inSelectDailyOutputs add column svaccnUAll bit;
alter table inSelectDailyOutputs add column svaccnAAll bit;
alter table inSelectDailyOutputs add column sappUInfectious bit;

alter table outIterationByProductionType drop column `trcUDirFwd`;
alter table outIterationByProductionType drop column `trcADirFwd`;
alter table outIterationByProductionType drop column `trcUIndFwd`;
alter table outIterationByProductionType drop column `trcAIndFwd`;
alter table outIterationByProductionType drop column `trcUDirpFwd`;
alter table outIterationByProductionType drop column `trcADirpFwd`;
alter table outIterationByProductionType drop column `trcUIndpFwd`;
alter table outIterationByProductionType drop column `trcAIndpFwd`;
alter table outIterationByProductionType drop column `trcUDirBack`;
alter table outIterationByProductionType drop column `trcADirBack`;
alter table outIterationByProductionType drop column `trcUIndBack`;
alter table outIterationByProductionType drop column `trcAIndBack`;
alter table outIterationByProductionType drop column `trcUDirpBack`;
alter table outIterationByProductionType drop column `trcADirpBack`;
alter table outIterationByProductionType drop column `trcUIndpBack`;
alter table outIterationByProductionType drop column `trcAIndpBack`;
alter table outIterationByProductionType drop column `exmcUDirFwd`;
alter table outIterationByProductionType drop column `exmcADirFwd`;
alter table outIterationByProductionType drop column `exmcUIndFwd`;
alter table outIterationByProductionType drop column `exmcAIndFwd`;
alter table outIterationByProductionType drop column `exmcUDirBack`;
alter table outIterationByProductionType drop column `exmcADirBack`;
alter table outIterationByProductionType drop column `exmcUIndBack`;
alter table outIterationByProductionType drop column `exmcAIndBack`;
alter table outIterationByProductionType drop column `tstcUDirFwd`;
alter table outIterationByProductionType drop column `tstcADirFwd`;
alter table outIterationByProductionType drop column `tstcUIndFwd`;
alter table outIterationByProductionType drop column `tstcAIndFwd`;
alter table outIterationByProductionType drop column `tstcUDirBack`;
alter table outIterationByProductionType drop column `tstcADirBack`;
alter table outIterationByProductionType drop column `tstcUIndBack`;
alter table outIterationByProductionType drop column `tstcAIndBack`;
alter table outIterationByProductionType drop column `tstcUTruePos`;
alter table outIterationByProductionType drop column `tstcATruePos`;
alter table outIterationByProductionType drop column `tstcUTrueNeg`;
alter table outIterationByProductionType drop column `tstcATrueNeg`;
alter table outIterationByProductionType drop column `tstcUFalsePos`;
alter table outIterationByProductionType drop column `tstcAFalsePos`;
alter table outIterationByProductionType drop column `tstcUFalseNeg`;
alter table outIterationByProductionType drop column `tstcAFalseNeg`;
alter table outIterationByProductionType drop column `detcUTest`;
alter table outIterationByProductionType drop column `detcATest`;
alter table outIterationByProductionType drop column `descUDirFwd`;
alter table outIterationByProductionType drop column `descADirFwd`;
alter table outIterationByProductionType drop column `descUIndFwd`;
alter table outIterationByProductionType drop column `descAIndFwd`; 
alter table outIterationByProductionType drop column `descUDirBack`;
alter table outIterationByProductionType drop column `descADirBack`;
alter table outIterationByProductionType drop column `descUIndBack`;
alter table outIterationByProductionType drop column `descAIndBack`;

alter table outIterationByProductionType add column `trcUDir` long;
alter table outIterationByProductionType add column `trcADir` long;
alter table outIterationByProductionType add column `trcUInd` long;
alter table outIterationByProductionType add column `trcAInd` long;
alter table outIterationByProductionType add column `trcUDirp` long;
alter table outIterationByProductionType add column `trcADirp` long;
alter table outIterationByProductionType add column `trcUIndp` long;
alter table outIterationByProductionType add column `trcAIndp` long;
alter table outIterationByProductionType add column `descUDir` long;
alter table outIterationByProductionType add column `descADir` long;
alter table outIterationByProductionType add column `descUInd` long;
alter table outIterationByProductionType add column `descAInd` long; 

alter table outDailyExposures drop column isAdequate;
alter table outDailyExposures add column success bit;

-- Rename table from readControlStateCodes to readApparentStateCodes.
create table `readApparentStateCodes` ( 
	`apparentStateCode` CHAR(1),
	`definition` VARCHAR(255)); 

insert into `readApparentStateCodes` (`apparentStateCode`, `definition`) 
    select `readControlStateCodes`.`controlStateCode`, 
           `readControlStateCodes`.`definition`  
    from `readControlStateCodes`;

alter table `readApparentStateCodes`
	add constraint `readApparentStateCodes_PK` primary key (`apparentStateCode`) ; 

alter table `outIterationByHerd` drop constraint `readApparentStateCodes_outIterationByHerd_FK1`;
alter table `dynHerd` drop constraint `readApparentStateCodes_dynHerd_FK1`;  

alter table outIterationByHerd add column lastApparentStateDay integer;
alter table outIterationByHerd add column lastApparentStateCode char(1);
alter table outIterationByHerd drop column lastControlStateCode;
alter table outIterationByHerd drop column lastControlStateDay;

-- Add foreign key constraints to table `outIterationByHerd`.
alter table `outIterationByHerd`
	add constraint `readApparentStateCodes_outIterationByHerd_FK1` foreign key (
		`lastApparentStateCode`)
	 references `readApparentStateCodes` (
		`apparentStateCode`); 

alter table `dynHerd` drop constraint `readDetectionStateCodes_dynHerd_FK1`;  
    
drop table readDetectionStateCodes;    
    
alter table dynHerd drop column finalDetectionStateCode;
alter table dynHerd drop column finalControlStateCode;
alter table dynHerd add column finalApparentStateCode char(1); 
alter table dynHerd drop column cumulInfected;
alter table dynHerd drop column cumulDetected;
alter table dynHerd drop column cumulDestroyed;
alter table dynHerd drop column cumulVaccinated;
alter table dynHerd add column cumInfected integer;
alter table dynHerd add column cumDetected integer;
alter table dynHerd add column cumDestroyed integer;
alter table dynHerd add column cumVaccinated integer;    
    
    
-- Add foreign key constraints to table `dynHerd`.
alter table `dynHerd`
	add constraint `readApparentStateCodes_dynHerd_FK1` foreign key (
		`finalApparentStateCode`)
	 references `readApparentStateCodes` (
		`apparentStateCode`); 
    
drop table `readControlStateCodes`;

alter table `outDailyEvents` drop constraint `readTestResultCodes_outDailyEvents_FK1`;
drop table readTestResultCodes;

delete from readEventCodes where eventCode = "K";
delete from readEventCodes where eventCode = "J";
delete from readEventCodes where eventCode = "X";
delete from readEventCodes where eventCode = "S";

delete from readApparentStateCodes where apparentStateCode = "K";
delete from readApparentStateCodes where apparentStateCode = "J";
delete from readApparentStateCodes where apparentStateCode = "Q";

alter table inControlsGlobal drop column includeTracingHerdExam;
alter table inControlsGlobal drop column includeTracingTesting;

alter table inGeneral drop column `language`;

alter table `inProductionType` drop  constraint `inChart_inProductionType_FK9`;
alter table `inProductionType` drop constraint `inChart_inProductionType_FK10`;
alter table inProductionType drop column traceDirectBack;
alter table inProductionType drop column traceIndirectBack;
alter table inProductionType drop column traceDelayPdfID;
alter table inProductionType drop column destrDirectBackTraces;
alter table inProductionType drop column destrIndirectBackTraces;
alter table inProductionType drop column vaccVaccinateDetected;
alter table inProductionType drop column examDirectForward;
alter table inProductionType drop column examDirectForwardMultiplier;
alter table inProductionType drop column examIndirectForward;
alter table inProductionType drop column examIndirectForwardMultiplier;
alter table inProductionType drop column examDirectBack;
alter table inProductionType drop column examDirectBackMultiplier;
alter table inProductionType drop column examIndirectBack;
alter table inProductionType drop column examIndirectBackMultiplier;
alter table inProductionType drop column testDirectForward;
alter table inProductionType drop column testIndirectForward;
alter table inProductionType drop column testDirectBack;
alter table inProductionType drop column testIndirectBack;
alter table inProductionType drop column testSpecificity;
alter table inProductionType drop column testSensitivity;
alter table inProductionType drop column testDelayPdfID;

alter table inProductionType add column traceDirect bit;
alter table inProductionType add column traceIndirect bit;
alter table inProductionType add column destrDirectTraces bit;
alter table inProductionType add column destrIndirectTraces bit;

update inProductionType set traceDirect = traceDirectForward;
update inProductionType set traceIndirect = traceIndirectForward;
update inProductionType set destrDirectTraces = destrDirectForwardTraces; 
update inProductionType set destrIndirectTraces = destrIndirectForwardTraces; 

alter table inProductionType drop column traceDirectForward; 
alter table inProductionType drop column traceIndirectForward; 
alter table inProductionType drop column destrDirectForwardTraces; 
alter table inProductionType drop column destrIndirectForwardTraces; 

delete from inChart where fieldName = "TrDelay";
delete from inChart where fieldName = "TeDelay";

--Set the version number
------------------------
update DBSchemaVersion set VersionNumber = "3.1.22", VersionDate = "02/02/09 12:15 PM", VersionID = 1233602101;




     











