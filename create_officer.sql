--Table of officer badge numbers and identifying information
--source is City of Dallas Police Incidents data

DROP TABLE IF EXISTS cdep.officer;

CREATE TABLE cdep.officer (
    badge_num varchar PRIMARY KEY,
    off_name text,
    off_race varchar,
    off_sex varchar,
    off_hire_dt date
);