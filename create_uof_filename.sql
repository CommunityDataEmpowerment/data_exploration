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


COMMENT ON TABLE cdep.uof_filename IS 'collection of uses of force reports for Dallas Police Department from the City of Dallas Open Data Portal';
COMMENT ON COLUMN cdep.uof_filename.OBJECTID IS 'unique object id from database';
COMMENT ON COLUMN cdep.uof_filename.zip IS 'ZIP code of UoF incident';
COMMENT ON COLUMN cdep.uof_filename.FILENUM IS 'UOF file number for incident. Will repeat for each victim in the incident';
COMMENT ON COLUMN cdep.uof_filename.Address IS 'address of UoF incident';
COMMENT ON COLUMN cdep.uof_filename.OCCURRED_D IS 'date of UoF incident';
COMMENT ON COLUMN cdep.uof_filename.OCCURRED_T IS 'time of UoF incident';
COMMENT ON COLUMN cdep.uof_filename.CURRENT_BA IS 'badge number of officer applying force';
COMMENT ON COLUMN cdep.uof_filename.OffSex IS 'sex of officer applying force';
COMMENT ON COLUMN cdep.uof_filename.OffRace IS 'race of officer applying force';
COMMENT ON COLUMN cdep.uof_filename.HIRE_DT IS 'hire date of officer applying force';
COMMENT ON COLUMN cdep.uof_filename.OFF_INJURE IS 'indication of injury to officer applying force';
COMMENT ON COLUMN cdep.uof_filename.OffCondTyp IS 'description of injury to officer applying force';
COMMENT ON COLUMN cdep.uof_filename.OFF_HOSPIT IS 'indication of hospitalization of officer applying force';
COMMENT ON COLUMN cdep.uof_filename.SERVICE_TY IS 'type of policing service being rendered';
COMMENT ON COLUMN cdep.uof_filename.UOF_REASON IS 'reason for use of force';
COMMENT ON COLUMN cdep.uof_filename.Cycles_Num IS 'unclear what this means';
COMMENT ON COLUMN cdep.uof_filename.STREET_N IS 'street number for UoF incident';
COMMENT ON COLUMN cdep.uof_filename.STREET IS 'street name for incident';
COMMENT ON COLUMN cdep.uof_filename.street_g IS 'street direction for UoF incident';
COMMENT ON COLUMN cdep.uof_filename.street_t IS 'street name appendix';
COMMENT ON COLUMN cdep.uof_filename.CitNum IS 'name of victim';
COMMENT ON COLUMN cdep.uof_filename.CitRace IS 'race of victim';
COMMENT ON COLUMN cdep.uof_filename.CitSex IS 'sex of victim';
COMMENT ON COLUMN cdep.uof_filename.CIT_INJURE IS 'indication of victim injury';
COMMENT ON COLUMN cdep.uof_filename.CitCondTyp IS 'description of victim injuries';
COMMENT ON COLUMN cdep.uof_filename.CIT_ARREST IS 'indication of whether victim was arrested';
COMMENT ON COLUMN cdep.uof_filename.CIT_INFL_A IS 'description of related circumstances (unclear)';
COMMENT ON COLUMN cdep.uof_filename.CitChargeT IS 'description of victim arrest charges';
COMMENT ON COLUMN cdep.uof_filename.RA IS 'DPD Reporting Area (administrative division)';
COMMENT ON COLUMN cdep.uof_filename.BEAT IS 'DPD Beat (administrative division)';
COMMENT ON COLUMN cdep.uof_filename.SECTOR IS 'DPD Sector (administrative division)';
COMMENT ON COLUMN cdep.uof_filename.DIVISION IS 'DPD Division (administrative division)';
COMMENT ON COLUMN cdep.uof_filename.council_district IS 'City of Dallas Council District';
COMMENT ON COLUMN cdep.uof_filename.X IS 'x coordinate in Texas North Central State Plane EPSG:2276';
COMMENT ON COLUMN cdep.uof_filename.Y IS 'y coordinate in Texas North Central State Plane EPSG:2276';
COMMENT ON COLUMN cdep.uof_filename.GeoLocation IS 'json of address and latitude and longitude';
COMMENT ON COLUMN cdep.uof_filename.Year_reported IS 'Year the UoF incident was reported';
