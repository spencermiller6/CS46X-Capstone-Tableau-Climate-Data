(SELECT
	'historyFinalView' AS "Source",
    [Measurement],
	COUNT(CONCAT([DateAndTime], [Chamber]))
FROM [TERA].[dbo].[historyFinalView]
GROUP BY [Measurement])
UNION ALL
(SELECT
	'onchangeFinalView' AS "Source",
    [Measurement],
	COUNT(CONCAT([DateAndTime], [Chamber]))
FROM [TERA].[dbo].[onchangeFinalView]
GROUP BY [Measurement])
UNION ALL
(SELECT
	'procFinalView' AS "Source",
    [Measurement],
	COUNT(CONCAT([DateAndTime], [Chamber]))
FROM [TERA].[dbo].[procFinalView]
GROUP BY [Measurement])