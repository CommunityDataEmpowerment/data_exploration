SELECT DISTINCT
	filenum, occurred_d, occurred_t, current_ba, offsex, offrace, hire_dt, off_injure, service_ty, 
	uof_reason, citnum, citrace, citsex, 
	CASE WHEN cit_injure = 'Y' OR cit_injure::boolean IS TRUE
		THEN 'Y'
		WHEN cit_injure = 'N' OR cit_injure::boolean IS FALSE
		THEN 'N'
		ELSE NULL
		END cit_injured,
	citcondtyp, cit_infl_a, citcharget, council_district, year_reported, off_name,
	CASE WHEN occurred_d <= '2016-10-22'
		THEN 'BROWN'
		WHEN occurred_d >'2016-10-22' AND occurred_d < '2017-09-05'
		THEN 'PIERCE'
		WHEN occurred_d >= '2017-09-05' 
		THEN 'HALL'
		ELSE NULL
	END chief
FROM cdep.data_extract
