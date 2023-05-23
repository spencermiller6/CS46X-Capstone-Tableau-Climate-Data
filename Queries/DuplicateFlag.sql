SELECT
	[Measurement],
	CASE
		WHEN
			([procTags] IS NOT NULL AND [onchangeTags] IS NOT NULL)
			OR ([procTags] IS NOT NULL AND [historyTags] IS NOT NULL)
			OR ([onchangeTags] IS NOT NULL AND [historyTags] IS NOT NULL) THEN 1
		ELSE 0 END AS "DuplicateFlag"
FROM (
	SELECT
		[Measurement],
		[Chamber],
		CASE [TableName]
			WHEN 'procTags' THEN [TagIndex]
		END AS "procTags",
		CASE [TableName]
			WHEN 'onchangeTags' THEN [TagIndex]
		END AS onchangeTags,
		CASE [TableName]
			WHEN 'historyTags' THEN [TagIndex]
		END AS historyTags
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
	) AS "SUBQUERY"
ORDER BY [DuplicateFlag] ASC