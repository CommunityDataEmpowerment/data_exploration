SELECT * FROM cdep.uof_filenum LIMIT 1000;

--find the 'null' string in geocoded_column
SELECT * FROM cdep.uof_filenum WHERE geocoded_column::text = 'null';
--fixing the string 'null' to actual database NULL (issue with processing in Python)
UPDATE cdep.uof_filenum SET geocoded_column = NULL WHERE geocoded_column::text = 'null';

--find the 'NULL' string in cycles_num
SELECT * FROM cdep.uof_filenum WHERE cycles_num = 'NULL';
--fixing the string 'null' to actual database NULL (issue with processing in Python)
UPDATE cdep.uof_filenum SET cycles_num = NULL WHERE cycles_num = 'NULL';

--check for 'null' or 'NULL' string everywhere
SELECT * FROM cdep.uof_filenum 
WHERE
	objectid = 'NULL' OR objectid = 'null' OR
	zip = 'NULL' OR zip = 'null' OR
	filenum = 'NULL' OR filenum = 'null' OR
	current_ba = 'NULL' OR current_ba = 'null' OR
	offsex = 'NULL' OR offsex = 'null' OR
	offrace = 'NULL' OR offrace = 'null' OR
	off_injure = 'NULL' OR off_injure = 'null' OR
	offcondtyp = 'NULL' OR offcondtyp = 'null' OR
	off_hospit = 'NULL' OR off_hospit = 'null' OR
	service_ty = 'NULL' OR service_ty = 'null' OR
	uof_reason = 'NULL' OR uof_reason = 'null' OR
	cycles_num = 'NULL' OR cycles_num = 'null' OR
	street_n = 'NULL' OR street_n = 'null' OR
	street = 'NULL' OR street = 'null' OR
	street_g = 'NULL' OR street_g = 'null' OR
	street_t = 'NULL' OR street_t = 'null' OR
	address = 'NULL' OR address = 'null' OR
	citnum = 'NULL' OR citnum = 'null' OR
	citrace = 'NULL' OR citrace = 'null' OR
	citsex = 'NULL' OR citsex = 'null' OR
	cit_injure = 'NULL' OR cit_injure = 'null' OR
	citcondtyp = 'NULL' OR citcondtyp = 'null' OR
	cit_arrest = 'NULL' OR cit_arrest = 'null' OR
	cit_infl_a = 'NULL' OR cit_infl_a = 'null' OR
	citcharget = 'NULL' OR citcharget = 'null' OR
	council_district = 'NULL' OR council_district = 'null' OR
	ra = 'NULL' OR ra = 'null' OR
	beat = 'NULL' OR beat = 'null' OR
	sector = 'NULL' OR sector = 'null' OR
	division = 'NULL' OR division = 'null' OR
	year_reported = 'NULL' OR year_reported = 'null' ;
--none found