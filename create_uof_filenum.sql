--Create the master table of UOF files from the DPD "Response to Resistance" datasets
--Source is the City of Dallas Open Data Portal
--Covers the years 2013-2019


DROP TABLE IF EXISTS cdep.uof_filenum;

CREATE TABLE cdep.uof_filenum (
	objectid varchar,
	zip varchar,
	filenum varchar,
	occurred_d date,
	occurred_t time,
	current_ba varchar,
	offsex text,
	offrace text,
	hire_dt date,
	off_injure text, --could be boolean if i trusted they were all correct
	offcondtyp text,
	off_hospit text, --could be boolean if i trusted they were all correct
	service_ty text,
	uof_reason text,
	cycles_num text,
	street_n varchar,
	street text,
	street_g text,
	street_t text,
	address text,
	citnum varchar,
	citrace text,
	citsex text,
	cit_injure text, --could be boolean if i trusted they were all correct
	citcondtyp text,
	cit_arrest text,
	cit_infl_a text,
	citcharget text,
	council_district text,
	ra varchar,
	beat varchar,
	sector varchar,
	division text,
	x numeric,
	y numeric,
	geocoded_column json,
	year_reported varchar
);

--FILENUMs are repeated for the same incident with multiple victims
--we need a PRIMARY KEY of objectid & filenum to keep things unique
ALTER TABLE cdep.uof_filenum ADD PRIMARY KEY (OBJECTID,FILENUM);


COMMENT ON TABLE cdep.uof_filenum IS 'collection of uses of force reports for Dallas Police Department from the City of Dallas Open Data Portal';
COMMENT ON COLUMN cdep.uof_filenum.OBJECTID IS 'unique object id from database';
COMMENT ON COLUMN cdep.uof_filenum.zip IS 'ZIP code of UoF incident';
COMMENT ON COLUMN cdep.uof_filenum.FILENUM IS 'UOF file number for incident. Will repeat for each victim in the incident';
COMMENT ON COLUMN cdep.uof_filenum.Address IS 'address of UoF incident';
COMMENT ON COLUMN cdep.uof_filenum.OCCURRED_D IS 'date of UoF incident';
COMMENT ON COLUMN cdep.uof_filenum.OCCURRED_T IS 'time of UoF incident';
COMMENT ON COLUMN cdep.uof_filenum.CURRENT_BA IS 'badge number of officer applying force';
COMMENT ON COLUMN cdep.uof_filenum.OffSex IS 'sex of officer applying force';
COMMENT ON COLUMN cdep.uof_filenum.OffRace IS 'race of officer applying force';
COMMENT ON COLUMN cdep.uof_filenum.HIRE_DT IS 'hire date of officer applying force';
COMMENT ON COLUMN cdep.uof_filenum.OFF_INJURE IS 'indication of injury to officer applying force';
COMMENT ON COLUMN cdep.uof_filenum.OffCondTyp IS 'description of injury to officer applying force';
COMMENT ON COLUMN cdep.uof_filenum.OFF_HOSPIT IS 'indication of hospitalization of officer applying force';
COMMENT ON COLUMN cdep.uof_filenum.SERVICE_TY IS 'type of policing service being rendered';
COMMENT ON COLUMN cdep.uof_filenum.UOF_REASON IS 'reason for use of force';
COMMENT ON COLUMN cdep.uof_filenum.Cycles_Num IS 'unclear what this means';
COMMENT ON COLUMN cdep.uof_filenum.STREET_N IS 'street number for UoF incident';
COMMENT ON COLUMN cdep.uof_filenum.STREET IS 'street name for incident';
COMMENT ON COLUMN cdep.uof_filenum.street_g IS 'street direction for UoF incident';
COMMENT ON COLUMN cdep.uof_filenum.street_t IS 'street name appendix';
COMMENT ON COLUMN cdep.uof_filenum.CitNum IS 'name of victim';
COMMENT ON COLUMN cdep.uof_filenum.CitRace IS 'race of victim';
COMMENT ON COLUMN cdep.uof_filenum.CitSex IS 'sex of victim';
COMMENT ON COLUMN cdep.uof_filenum.CIT_INJURE IS 'indication of victim injury';
COMMENT ON COLUMN cdep.uof_filenum.CitCondTyp IS 'description of victim injuries';
COMMENT ON COLUMN cdep.uof_filenum.CIT_ARREST IS 'indication of whether victim was arrested';
COMMENT ON COLUMN cdep.uof_filenum.CIT_INFL_A IS 'description of related circumstances (unclear)';
COMMENT ON COLUMN cdep.uof_filenum.CitChargeT IS 'description of victim arrest charges';
COMMENT ON COLUMN cdep.uof_filenum.RA IS 'DPD Reporting Area (administrative division)';
COMMENT ON COLUMN cdep.uof_filenum.BEAT IS 'DPD Beat (administrative division)';
COMMENT ON COLUMN cdep.uof_filenum.SECTOR IS 'DPD Sector (administrative division)';
COMMENT ON COLUMN cdep.uof_filenum.DIVISION IS 'DPD Division (administrative division)';
COMMENT ON COLUMN cdep.uof_filenum.council_district IS 'City of Dallas Council District';
COMMENT ON COLUMN cdep.uof_filenum.X IS 'x coordinate in Texas North Central State Plane EPSG:2276';
COMMENT ON COLUMN cdep.uof_filenum.Y IS 'y coordinate in Texas North Central State Plane EPSG:2276';
COMMENT ON COLUMN cdep.uof_filenum.geocoded_column IS 'json of address and latitude and longitude';
COMMENT ON COLUMN cdep.uof_filenum.Year_reported IS 'Year the UoF incident was reported';
