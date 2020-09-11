--adding the lat/lon values in columns
--create the columns
ALTER TABLE cdep.uof_filenum
	ADD COLUMN lat numeric,
	ADD COLUMN lon numeric;
	
--first pass with the latitude and longitude values
UPDATE cdep.uof_filenum
	SET 
	lat = 
		CASE WHEN geocoded_column -> 'latitude' IS NOT NULL 
			THEN TRIM(BOTH '""' from (geocoded_column -> 'latitude')::varchar)::numeric
			ELSE NULL
			END,
	lon = 
		CASE WHEN geocoded_column -> 'longitude' IS NOT NULL 
			THEN TRIM(BOTH '""' from (geocoded_column -> 'longitude')::varchar)::numeric
			ELSE NULL
			END
			
--second pass with the GeoJSON-type object
UPDATE cdep.uof_filenum
	SET
	lat = ((geocoded_column -> 'coordinates')->>1)::numeric,
	lon = ((geocoded_column -> 'coordinates')->>2)::numeric
	WHERE geocoded_column -> 'coordinates' IS NOT NULL;
	
--test queries for UPDATE above
	
--extract the latitude from the point array
SELECT ((geocoded_column -> 'coordinates')->>1)::numeric FROM cdep.data_extract WHERE geocoded_column -> 'coordinates' IS NOT NULL LIMIT 10

--extract the longitude from the point array
SELECT ((geocoded_column -> 'coordinates')->>2)::numeric FROM cdep.data_extract WHERE geocoded_column -> 'coordinates' IS NOT NULL LIMIT 10

--figuring out how to access the geocoded_column with 'coordinates' value
SELECT geocoded_column FROM cdep.data_extract WHERE geocoded_column -> 'coordinates' IS NOT NULL;

--figuring out how to trim the "" from the latitude and longitude strings
SELECT TRIM(BOTH '""' from (geocoded_column -> 'latitude')::varchar)::numeric AS lat FROM cdep.data_extract LIMIT 10

--filter for just the coordinates value in geocoded_column
SELECT geocoded_column FROM cdep.data_extract 
WHERE geocoded_column -> 'latitude' IS NULL AND geocoded_column IS NOT NULL AND geocoded_column -> 'human_address' IS NULL;

