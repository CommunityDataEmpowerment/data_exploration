DROP TABLE IF EXISTS cdep.address_lookup;

CREATE TABLE cdep.address_lookup (
	id SERIAL PRIMARY KEY,
	id_correct int,
	address text,
	zip varchar,
	lat numeric,
	lon numeric,
	x numeric,
	y numeric,
	beat numeric,
	ra numeric,
	division text,
	sector numeric,
	council_dist varchar,
    queried boolean DEFAULT 'f'
);

--all CAPS
--remove the punctuation
WITH prep AS (
	SELECT 
		DISTINCT UPPER(REPLACE(address,'.','')) AS address
		FROM cdep.uof_filenum
)
INSERT INTO cdep.address_lookup (address) SELECT address FROM prep ORDER BY address;