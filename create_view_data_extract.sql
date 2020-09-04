--create the master file of incidents enriched with officer information
    
DROP VIEW IF EXISTS cdep.data_extract;

CREATE VIEW cdep.data_extract AS 
    SELECT DISTINCT ON (f.filenum,u.uofnum,f.citnum) f.*,u.uofnum,u.forceeffec,u.forcetype, o.off_name, ft.dpd_level, ft.physical_contact, ft.victim_danger 
    FROM cdep.uof_filenum AS f
    --join the uof
    LEFT OUTER JOIN cdep.uof_num as u
        ON f.filenum = u.filenum
    --join the officer information
    LEFT OUTER JOIN cdep.officer as o
        ON f.current_ba = o.badge_num
    LEFT OUTER JOIN cdep.forcetype as ft
        ON u.forcetype = ft.forcetype
    ORDER BY f.filenum
;