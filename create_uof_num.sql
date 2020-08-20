--Create the table for each individual UoF

DROP TABLE IF EXISTS cdep.uof_num;

CREATE TABLE cdep.uof_num (
	OBJECTID varchar,
	FILENUM varchar,
	UOFNum varchar,
	ForceType text,
	ForceEffec text --could be boolean if I trusted they were all correct
);

ALTER TABLE cdep.uof_num ADD PRIMARY KEY (OBJECTID,FILENUM,UOFNum);

COMMENT ON TABLE cdep.uof_num IS 'detail of uses of force by DPD officers, referenced by OBJECTID and FILENUM to the uof_filename table';
COMMENT ON COLUMN cdep.uof_num.OBJECTID IS 'unique object id from database';
COMMENT ON COLUMN cdep.uof_num.FILENUM IS 'UOF file number for incident. Will repeat for each victim in the incident';
COMMENT ON COLUMN cdep.uof_num.UOFNum IS 'UOF number for the individual use of force type applied';
COMMENT ON COLUMN cdep.uof_num.ForceType IS 'Type of force applied';
COMMENT ON COLUMN cdep.uof_num.ForceEffec IS 'Whether the force was determined to be effective';