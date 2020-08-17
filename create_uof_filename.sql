--Create the master table of UOF files from the DPD "Response to Resistance" datasets
--Source is the City of Dallas Open Data Portal
--Covers the years 2013-2019


DROP TABLE IF EXISTS cdep.uof_filenum;

CREATE TABLE cdep.uof_filenum AS (
	OBJECTID varchar,
	FILENUM varchar,
	Address text,
	OCCURRED_D date,
	OCCURRED_T time,
	CURRENT_BA varchar,
	OffSex text,
	OffRace text,
	HIRE_DT date,
	OFF_INJURE text, --could be boolean if I trusted they were all correct
	OffCondTyp text,
	OFF_HOSPIT text, --could be boolean if I trusted they were all correct
	SERVICE_TY text,
	UOF_REASON text,
	Cycles_Num text,
	STREET_N varchar,
	STREET text,
	street_g text,
	street_t text,
	CitNum varchar,
	CitRace text,
	CitSex text,
	CIT_INJURE text, --could be boolean if I trusted they were all correct
	CitCondTyp text,
	CIT_ARREST text,
	CIT_INFL_A text,
	CitChargeT text,
	RA varchar,
	BEAT varchar,
	SECTOR varchar,
	DIVISION text,
	DIST_NAME varchar,
	TAAG_Name text,
	X numeric,
	Y numeric,
	GeoLocation json,
	Year_reported varchar
);

--FILENUMs are repeated for the same incident with multiple victims
--we need a PRIMARY KEY of objectid & filenum to keep things unique
ALTER TABLE cdep.uof_filenum ADD PRIMARY KEY (OBJECTID,FILENUM);


COMMENT ON TABLE cdep.uof_filename IS 'collection of uses of force reports for Dallas Police Department from the City of Dallas Open Data Portal';
COMMENT ON COLUMN cdep.uof_filename.OBJECTID IS 'unique object id from database';
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
COMMENT ON COLUMN cdep.uof_filename.STREET_N IS 'street number for incident';
COMMENT ON COLUMN cdep.uof_filename.STREET IS 'street name for incident';
COMMENT ON COLUMN cdep.uof_filename.street_g IS 'street direction for incident';
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
COMMENT ON COLUMN cdep.uof_filename.DIST_NAME IS 'City of Dallas Council District';
COMMENT ON COLUMN cdep.uof_filename.TAAG_Name IS 'Targeted Action Area Grid (enhanced enforcement area)';
COMMENT ON COLUMN cdep.uof_filename.X IS 'x coordinate in Texas North Central State Plane EPSG:2276';
COMMENT ON COLUMN cdep.uof_filename.Y IS 'y coordinate in Texas North Central State Plane EPSG:2276';
COMMENT ON COLUMN cdep.uof_filename.GeoLocation IS 'json of address and latitude and longitude';
