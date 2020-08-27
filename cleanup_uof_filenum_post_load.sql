--A quick cleanup of values after database loading

--fix null text string to database NULL value after loading (issue with processing in Python)
UPDATE cdep.uof_filenum SET geocoded_column = NULL WHERE geocoded_column::text = 'null';
UPDATE cdep.uof_filenum SET cycles_num = NULL WHERE cycles_num = 'NULL';
UPDATE cdep.uof_filenum SET street_g = NULL WHERE street_g = 'NULL';
UPDATE cdep.uof_filenum SET service_ty = NULL WHERE service_ty = 'NULL';
UPDATE cdep.uof_filenum SET uof_reason = NULL WHERE uof_reason = 'NULL';
UPDATE cdep.uof_filenum SET cit_race = NULL WHERE cit_race = 'NULL';
UPDATE cdep.uof_filenum SET citsex = NULL WHERE citsex = 'NULL';
UPDATE cdep.uof_filenum SET cit_infl_a = NULL WHERE cit_infl_a = 'NULL';
UPDATE cdep.uof_filenum SET street_t = NULL WHERE street_t = 'NULL';
UPDATE cdep.uof_filenum SET street = NULL WHERE street = 'NULL';
UPDATE cdep.uof_filenum SET address = NULL WHERE address = 'NULL';



