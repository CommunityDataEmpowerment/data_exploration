ALTER TABLE cdep.uof_filenum ADD COLUMN address_id int;

UPDATE cdep.uof_filenum AS u 
SET address_id = a.id
FROM (SELECT id, address FROM cdep.address_lookup) AS a
WHERE UPPER(REPLACE(u.address,'.','')) = a.address;

/* 
--SELECT statement to test above
SELECT u.address, a.id, a.address
FROM cdep.uof_filenum u
INNER JOIN cdep.address_lookup a
	ON UPPER(REPLACE(u.address,'.','')) = a.address
LIMIT 100;

*/

--testing the result
SELECT * FROM cdep.uof_filenum WHERE address_id IS NULL;

--Returns 16 rows where address field is NULL, most have addresses broken out