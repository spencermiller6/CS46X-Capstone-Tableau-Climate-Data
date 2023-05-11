USE [TERA]
GO

/****** Object:  View [dbo].[historyView]    Script Date: 4/26/2023 9:11:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER           VIEW [dbo].[historyView]
   AS   
SELECT        
dbo.FloatTable.DateAndTime, 
dbo.FloatTable.Millitm,
dbo.historyTags.Chamber,
dbo.FloatTable.Status, 
dbo.FloatTable.Marker,
dbo.historyTags.Measurement,
dbo.FloatTable.Val
FROM dbo.FloatTable INNER JOIN
--limit to only the tags we need for History Table
dbo.historyTags ON dbo.historyTags.TagIndex = dbo.FloatTable.TagIndex
WHERE
(
	dbo.historyTags.TagIndex between 0 and 14
	OR dbo.historyTags.TagIndex between 25 and 25
	OR dbo.historyTags.TagIndex between 27 and 28
	OR dbo.historyTags.TagIndex between 30 and 31
	OR dbo.historyTags.TagIndex between 50 and 57
	OR dbo.historyTags.TagIndex between 109 and 113
	OR dbo.historyTags.TagIndex between 129 and 129
	OR dbo.historyTags.TagIndex between 170 and 170
	OR dbo.historyTags.TagIndex between 174 and 184
	OR dbo.historyTags.TagIndex between 198 and 201
	OR dbo.historyTags.TagIndex between 228 and 231
	OR dbo.historyTags.TagIndex between 243 and 243
	OR dbo.historyTags.TagIndex between 257 and 258
	OR dbo.historyTags.TagIndex between 261 and 261
	OR dbo.historyTags.TagIndex between 263 and 263
	OR dbo.historyTags.TagIndex between 276 and 276
	OR dbo.historyTags.TagIndex between 281 and 282
	OR dbo.historyTags.TagIndex between 288 and 288
	OR dbo.historyTags.TagIndex IN (321, 324, 326, 331, 333, 338, 340, 345, 347, 352, 354)
	OR dbo.historyTags.TagIndex between 357 and 364
	OR dbo.historyTags.TagIndex IN (366, 368, 369, 374, 375, 380, 381, 382, 394, 396, 401, 403, 404, 416, 428, 441, 442, 443, 477)
	OR dbo.historyTags.TagIndex between 485 and 494
	OR dbo.historyTags.TagIndex between 518 and 521
	OR dbo.historyTags.TagIndex between 542 and 567
	OR dbo.historyTags.TagIndex IN (579, 591, 603)
	OR dbo.historyTags.TagIndex between 615 and 651
	OR dbo.historyTags.TagIndex IN (687, 699, 711)
	OR dbo.historyTags.TagIndex between 880 and 882
	OR dbo.historyTags.TagIndex IN (971, 972, 1167, 1168, 1193, 1205, 1217, 1229, 1241, 1253, 1254)


OR dbo.historyTags.TagIndex IN (4,29,36,43,50,57,64,71,78,85,92,99,106)
OR dbo.historyTags.TagIndex IN (25,27,28,30,31,32,34,35,37,38,39,
	41,42,44,45,46,48,49,51,52,53,55,56,58,59,60,
	62,63,65,66,67,69,70,72,73,74,76,77,79,80,81,
	83,84,86,87,88,90,91,93,94,95,97,98,100,101,
	102,104,105)
OR dbo.historyTags.TagIndex between 107 and 173
OR dbo.historyTags.TagIndex between 182 and 217
OR dbo.historyTags.TagIndex between 230 and 241
OR dbo.historyTags.TagIndex IN (324,326,331,333,338,340,
	345,347,352,354,359,361,366,368,373,375,380,
	382,387,389,394,396,401)
OR dbo.historyTags.TagIndex between 403 and 427
OR dbo.historyTags.TagIndex between 441 and 488
OR dbo.historyTags.TagIndex between 567 and 650
OR dbo.historyTags.TagIndex = 710
OR dbo.historyTags.TagIndex between 7 and 14
OR dbo.historyTags.TagIndex between 174 and 181
OR dbo.historyTags.TagIndex = 552
OR dbo.historyTags.TagIndex between 428 and 439
OR dbo.historyTags.TagIndex between 489 and 524
OR dbo.historyTags.TagIndex between 651 and 662
OR dbo.historyTags.TagIndex between 711 and 722
OR dbo.historyTags.TagIndex IN (4, 57));
GO


