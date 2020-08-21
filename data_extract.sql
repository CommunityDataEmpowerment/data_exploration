--create the master file of incidents enriched with officer information
SELECT DISTINCT ON (f.filenum,u.uofnum,f.citnum) f.*,u.uofnum,u.forceeffec,u.forcetype, o.off_name 
FROM cdep.uof_filenum AS f
--join the uof
FULL OUTER JOIN cdep.uof_num as u
	ON f.filenum = u.filenum
--join the officer information
LEFT OUTER JOIN cdep.officer as o
	ON f.current_ba = o.badge_num
--WHERE year_reported = '2018'
ORDER BY f.filenum
--LIMIT 100
;
