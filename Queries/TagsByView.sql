SELECT
	[Measurement],
	CASE [Chamber] WHEN 'tr1' THEN [TableName] END AS "tr1",
	CASE [Chamber] WHEN 'tr8' THEN [TableName] END AS "tr8",
	CASE [Chamber] WHEN 'tr_02' THEN [TableName] END AS "tr_02",
	CASE [Chamber] WHEN 'tr_03' THEN [TableName] END AS "tr_03",
	CASE [Chamber] WHEN 'tr_04' THEN [TableName] END AS "tr_04",
	CASE [Chamber] WHEN 'tr_05' THEN [TableName] END AS "tr_05",
	CASE [Chamber] WHEN 'tr_06' THEN [TableName] END AS "tr_06",
	CASE [Chamber] WHEN 'tr_07' THEN [TableName] END AS "tr_07",
	CASE [Chamber] WHEN 'tr_09' THEN [TableName] END AS "tr_09",
	CASE [Chamber] WHEN 'tr_10' THEN [TableName] END AS "tr_10",
	CASE [Chamber] WHEN 'tr_11' THEN [TableName] END AS "tr_11",
	CASE [Chamber] WHEN 'tr_12' THEN [TableName] END AS "tr_12",
	CASE [Chamber] WHEN 'tr_13' THEN [TableName] END AS "tr_13",
	CASE [Chamber] WHEN 'tr_14' THEN [TableName] END AS "tr_14",
	CASE [Chamber] WHEN 'weather' THEN [TableName] END AS "weather"
FROM (
	SELECT
		[Chamber],
		[Measurement],
		[TagIndex],
		'procTags' AS "TableName"
	FROM [TERA].[dbo].[procTags]
	UNION
	SELECT
		[Chamber],
		[Measurement],
		[TagIndex],
		'onchangeTags' AS "TableName"
	FROM [TERA].[dbo].[onchangeTags]
	UNION
	SELECT
		[Chamber],
		[Measurement],
		[TagIndex],
		'historyTags' AS "TableName"
	FROM [TERA].[dbo].[historyTags]) AS "UNION"
ORDER BY [Measurement] ASC