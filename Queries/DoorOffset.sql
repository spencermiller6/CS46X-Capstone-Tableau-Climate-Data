SELECT
	[DateAndTime],
	[Chamber],
	[DoorStatus],
	CASE WHEN [DoorStatus] = 'Door Open' THEN 0 ELSE DATEDIFF(MINUTE, [PrevOpenTime], [DateAndTime]) END AS TimeSinceDoorOpen
FROM (
	SELECT TOP 10
		[DateAndTime],
		[Chamber],
		[DoorStatus],
		LAG(CASE WHEN [DoorStatus] = 'Door Open' THEN [DateAndTime] END) OVER(PARTITION BY [Chamber] ORDER BY [DateAndTime]) AS [PrevOpenTime]
	FROM [TERA].[dbo].[historyFinalView] AS T1
) AS T2

--SELECT TOP 1000
--	[DateAndTime],
--	[Millitm],
--    [Chamber],
--    [Status],
--    [Marker],
--    [Measurement],
--    [Val],
--    [DumpValveStatus],
--    [BackStatus],
--    [DoorStatus],
--	DATEDIFF(MINUTE, [PrevOpenTime], [DateAndTime])
--FROM (
--	SELECT
--		[DateAndTime],
--		[Millitm],
--		[Chamber],
--		[Status],
--		[Marker],
--		[Measurement],
--		[Val],
--		[DumpValveStatus],
--		[BackStatus],
--		[DoorStatus],
--		(
--			SELECT MAX(T2.[DateAndTime])
--			FROM [TERA].[dbo].[historyFinalView] AS T2
--			WHERE
--				T2.[Chamber] = T1.[Chamber]
--				AND T2.[DoorStatus] = T1.[DoorStatus]
--				AND T2.[DateAndTime] < T1.[DateAndTime]
--		) AS PrevOpenTime
--	FROM [TERA].[dbo].[historyFinalView] AS T1
--) AS T3


--SELECT
--	T1.[DateAndTime],
--    T1.[Chamber],
--    T1.[DoorStatus],
--	DATEDIFF(MINUTE, MAX(T2.[DateAndTime]), T1.[DateAndTime])
--FROM [TERA].[dbo].[historyFinalView] AS T1
--LEFT JOIN [TERA].[dbo].[historyFinalView] AS T2
--	ON T1.[Chamber] = T2.[Chamber]
--	AND T2.[DoorStatus] = 'Door Open'
--	AND T2.[DateAndTime] < T1.[DateAndTime]
--GROUP BY
--	T1.[DateAndTime],
--	T1.[Chamber],
--	T1.[DoorStatus]
--ORDER BY
--	T1.[Chamber],
--	T1.[DateAndTime]