SELECT
	"TimeTable"."DateAndTime",
	"ValTable"."Millitm",
	CASE
		-- WHEN "BackoffTable"."Chamber" IS NOT NULL THEN "BackoffTable"."Chamber"
		WHEN SUBSTRING("ChamberTable"."Chamber", 1, 3) = 'tr_' THEN "ChamberTable"."Chamber"
		WHEN SUBSTRING("ChamberTable"."Chamber", 1, 5) = 'tera_' THEN CONCAT('tr_', SUBSTRING("ChamberTable"."Chamber", 6, 2))
		WHEN SUBSTRING("ChamberTable"."Chamber", 1, 2) = 't_' THEN CONCAT('tr_', SUBSTRING("ChamberTable"."Chamber", 3, 2))
		WHEN SUBSTRING("ChamberTable"."Chamber", 1, 2) = 'tr' THEN CONCAT('tr_', SUBSTRING("ChamberTable"."Chamber", 5, 2))
		ELSE "ChamberTable"."Chamber"
	END AS "Chamber",
	"ValTable"."Status",
	"ValTable"."Marker",
	CASE
		WHEN
			SUBSTRING("TERA"."dbo"."TagTable"."TagName", 1, 3) = 'tr_'
			AND SUBSTRING("TERA"."dbo"."TagTable"."TagName", 6, 1) = '\' THEN RIGHT("TERA"."dbo"."TagTable"."TagName", LEN("TERA"."dbo"."TagTable"."TagName") - 6)
		ELSE "TERA"."dbo"."TagTable"."TagName"
	END AS "Measurement",
	"ValTable"."Val",
	NULL AS "Dump Valve Status",
	NULL AS "Back Status",
	NULL AS "Door Status",
	NULL AS "Table Name"
	-- "ValTable"."TagIndex",
	-- "BackoffTable"."Backoff_Indicator",
	-- "DoorOpenTable"."DoorOpen_Indicator",
	-- "DumpOpenTable"."DumpOpen_Indicator",
FROM (
	SELECT TOP (1000) "TERA"."dbo"."AlrmFloatTable"."DateAndTime"
	FROM "TERA"."dbo"."AlrmFloatTable"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."backOff"."StartDateTime" AS "DateAndTime"
	FROM "TERA"."dbo"."backOff"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."dateBackOff"."TheDate" AS "DateAndTime"
	FROM "TERA"."dbo"."dateBackOff"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."dateDoorOpen"."TheDate" AS "DateAndTime"
	FROM "TERA"."dbo"."dateDoorOpen"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."dateDumpOpen"."TheDate" AS "DateAndTime"
	FROM "TERA"."dbo"."dateDumpOpen"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."doorOpen"."StartDateTime" AS "DateAndTime"
	FROM "TERA"."dbo"."doorOpen"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."dumpOpen"."StartDateTime" AS "DateAndTime"
	FROM "TERA"."dbo"."dumpOpen"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."FloatTable"."DateAndTime"
	FROM "TERA"."dbo"."FloatTable"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."MoistureFloatTable"."DateAndTime"
	FROM "TERA"."dbo"."MoistureFloatTable"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."onchangeFloatTable"."DateAndTime"
	FROM "TERA"."dbo"."onchangeFloatTable"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."origBackOff"."DateAndTime"
	FROM "TERA"."dbo"."origBackOff"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."origDoorOpen"."DateAndTime"
	FROM "TERA"."dbo"."origDoorOpen"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."origDumpOpen"."DateAndTime"
	FROM "TERA"."dbo"."origDumpOpen"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."ProcFloatTable"."DateAndTime"
	FROM "TERA"."dbo"."ProcFloatTable"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."temperatureFloatTable"."DateAndTime"
	FROM "TERA"."dbo"."temperatureFloatTable") "TimeTable"
LEFT JOIN (
	SELECT TOP (1000) "TERA"."dbo"."AlrmFloatTable".*
	FROM "TERA"."dbo"."AlrmFloatTable"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."FloatTable".*
	FROM "TERA"."dbo"."FloatTable"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."MoistureFloatTable".*
	FROM "TERA"."dbo"."moistureFloatTable"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."onchangeFloatTable".*
	FROM "TERA"."dbo"."onchangeFloatTable"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."ProcFloatTable".*
	FROM "TERA"."dbo"."ProcFloatTable"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."temperatureFloatTable".*
	FROM "TERA"."dbo"."temperatureFloatTable") "ValTable"
	ON "TimeTable"."DateAndTime" = "ValTable"."DateAndTime"
LEFT JOIN (
	SELECT TOP (1000) "TERA"."dbo"."AlarmTags".*
	FROM "TERA"."dbo"."AlarmTags"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."historyTags".*
	FROM "TERA"."dbo"."historyTags"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."moistureTags".*
	FROM "TERA"."dbo"."moistureTags"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."onchangeTags".*
	FROM "TERA"."dbo"."onchangeTags"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."procTags".*
	FROM "TERA"."dbo"."procTags"
	UNION
	SELECT TOP (1000) "TERA"."dbo"."temperatureTags".*
	FROM "TERA"."dbo"."temperatureTags"
) "ChamberTable"
	ON "ValTable"."TagIndex" = "ChamberTable"."TagIndex"
-- LEFT JOIN (
-- 	SELECT TOP (1000)
-- 		"TERA"."dbo"."backOff"."StartDateTime" AS "DateAndTime",
-- 		"TERA"."dbo"."backOff"."Chamber",
-- 		"TERA"."dbo"."backOff"."Backoff_Indicator"
-- 	FROM "TERA"."dbo"."backOff"
-- 	UNION
-- 	SELECT TOP (1000)
-- 		"TERA"."dbo"."dateBackOff"."TheDate" AS "DateAndTime",
-- 		"TERA"."dbo"."dateBackOff"."Chamber",
-- 		"TERA"."dbo"."dateBackOff"."Backoff_Indicator"
-- 	FROM "TERA"."dbo"."dateBackOff"
-- 	UNION
-- 	SELECT TOP (1000)
-- 		"TERA"."dbo"."origBackOff"."DateAndTime",
-- 		"TERA"."dbo"."origBackOff"."Chamber",
-- 		"TERA"."dbo"."origBackOff"."Backoff_Indicator"
-- 	FROM "TERA"."dbo"."origBackOff") AS "BackoffTable"
-- 	ON "TimeTable".DateAndTime = "BackoffTable"."DateAndTime"
-- LEFT JOIN (
-- 	SELECT TOP (1000)
-- 		"TERA"."dbo"."doorOpen"."StartDateTime" AS "DateAndTime",
-- 		"TERA"."dbo"."doorOpen"."Chamber",
-- 		"TERA"."dbo"."doorOpen"."DoorOpen_Indicator"
-- 	FROM "TERA"."dbo"."doorOpen"
-- 	UNION
-- 	SELECT TOP (1000)
-- 		"TERA"."dbo"."dateDoorOpen"."TheDate" AS "DateAndTime",
-- 		"TERA"."dbo"."dateDoorOpen"."Chamber",
-- 		"TERA"."dbo"."dateDoorOpen"."DoorOpen_Indicator"
-- 	FROM "TERA"."dbo"."dateDoorOpen"
-- 	UNION
-- 	SELECT TOP (1000)
-- 		"TERA"."dbo".origDoorOpen."DateAndTime",
-- 		"TERA"."dbo".origDoorOpen."Chamber",
-- 		"TERA"."dbo".origDoorOpen."DoorOpen_Indicator"
-- 	FROM "TERA"."dbo".origDoorOpen) AS "DoorOpenTable"
-- 	ON "TimeTable".DateAndTime = "DoorOpenTable"."DateAndTime"
-- LEFT JOIN (
-- 	SELECT TOP (1000)
-- 		"TERA"."dbo"."dumpOpen"."StartDateTime" AS "DateAndTime",
-- 		"TERA"."dbo"."dumpOpen"."Chamber",
-- 		"TERA"."dbo"."dumpOpen"."DumpOpen_Indicator"
-- 	FROM "TERA"."dbo"."dumpOpen"
-- 	UNION
-- 	SELECT TOP (1000)
-- 		"TERA"."dbo"."dateDumpOpen"."TheDate" AS "DateAndTime",
-- 		"TERA"."dbo"."dateDumpOpen"."Chamber",
-- 		"TERA"."dbo"."dateDumpOpen"."DumpOpen_Indicator"
-- 	FROM "TERA"."dbo"."dateDumpOpen"
-- 	UNION
-- 	SELECT TOP (1000)
-- 		"TERA"."dbo".origDumpOpen."DateAndTime",
-- 		"TERA"."dbo".origDumpOpen."Chamber",
-- 		"TERA"."dbo".origDumpOpen."DumpOpen_Indicator"
-- 	FROM "TERA"."dbo".origDumpOpen) AS "DumpOpenTable"
-- 	ON "TimeTable".DateAndTime = "DumpOpenTable"."DateAndTime"
LEFT JOIN "TERA"."dbo"."TagTable" ON "ValTable"."TagIndex" = "TERA"."dbo"."TagTable"."TagIndex"
ORDER BY "TimeTable"."DateAndTime" ASC