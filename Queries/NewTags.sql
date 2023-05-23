SELECT *
FROM [TERA].[dbo].[historyFinalView]
WHERE [Chamber] = 'tr_04' AND [Measurement] = 'tr_dew_point_sp'

UNION ALL

SELECT *
FROM [TERA].[dbo].[onchangeFinalView]
WHERE
	([Chamber] = 'tr_02' AND [Measurement] = 'et_total_day')
	OR ([Chamber] = 'tr_03' AND [Measurement] = 'tr_CER_Calculated')