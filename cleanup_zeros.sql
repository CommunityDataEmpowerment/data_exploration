SELECT current_ba, COUNT(current_ba) AS badge_count FROM cdep.uof_filenum GROUP BY current_ba ORDER BY current_ba::numeric;
--find the trailing 0s from the badge numbers
SELECT DISTINCT current_ba, trim(trailing'00' FROM current_ba) FROM cdep.uof_filenum WHERE year_reported='2018';
--fix the trailing 0s from the badge numbers
UPDATE cdep.uof_filenum SET current_ba = trim(trailing'00' FROM current_ba) WHERE year_reported='2018';
--find the trailing . from the badge numbers
SELECT DISTINCT current_ba, trim(trailing'.' FROM current_ba) FROM cdep.uof_filenum WHERE year_reported='2018';
--fix the trailing . from the badge numbers
UPDATE cdep.uof_filenum SET current_ba = trim(trailing'.' FROM current_ba) WHERE year_reported='2018';

--find the '0E-11' badge numbers
SELECT current_ba FROM cdep.uof_filenum WHERE current_ba = '0E-11';
--fix the '0E-11' badge numbers
UPDATE cdep.uof_filenum SET current_ba = '0' WHERE current_ba = '0E-11';

--check for 2013 duplicates
SELECT * FROM cdep.uof_filenum WHERE year_reported='2013' ORDER BY filenum,objectid LIMIT 1000;