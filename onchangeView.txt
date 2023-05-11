USE [TERA]
GO

/****** Object:  View [dbo].[onchangeView]    Script Date: 4/20/2023 2:56:12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE OR ALTER           VIEW [dbo].[onchangeView]
AS
SELECT        
dbo.onchangeFloatTable.DateAndTime, 
dbo.onchangeFloatTable.Millitm,
dbo.onchangeTags.Chamber,
dbo.onchangeFloatTable.Status, 
dbo.onchangeFloatTable.Marker,
dbo.onchangeTags.Measurement,
dbo.onchangeFloatTable.Val
FROM dbo.onchangeFloatTable INNER JOIN
--limit to only the tags we need for onChange Table
dbo.onchangeTags ON dbo.onchangeTags.TagIndex = dbo.onchangeFloatTable.TagIndex
WHERE
(dbo.onchangeTags.TagIndex IN (4,8,12,16,20,24,28,32,36,40,44,48)
OR dbo.onchangeTags.TagIndex between 49 and 56
OR dbo.onchangeTags.TagIndex between 58 and 64
OR dbo.onchangeTags.TagIndex between 67 and 73
OR dbo.onchangeTags.TagIndex between 75 and 81
OR dbo.onchangeTags.TagIndex between 83 and 89
OR dbo.onchangeTags.TagIndex between 91 and 97
OR dbo.onchangeTags.TagIndex between 99 and 105
OR dbo.onchangeTags.TagIndex between 107 and 113
OR dbo.onchangeTags.TagIndex between 115 and 121
OR dbo.onchangeTags.TagIndex between 123 and 129
OR dbo.onchangeTags.TagIndex between 131 and 137
OR dbo.onchangeTags.TagIndex between 139 and 145
OR dbo.onchangeTags.TagIndex between 170 and 193
OR dbo.onchangeTags.TagIndex between 198 and 200
OR dbo.onchangeTags.TagIndex between 203 and 205
OR dbo.onchangeTags.TagIndex between 208 and 210
OR dbo.onchangeTags.TagIndex between 213 and 215
OR dbo.onchangeTags.TagIndex between 203 and 205
OR dbo.onchangeTags.TagIndex IN (218, 219, 221)
OR dbo.onchangeTags.TagIndex between 223 and 225
OR dbo.onchangeTags.TagIndex between 228 and 230
OR dbo.onchangeTags.TagIndex between 233 and 235
OR dbo.onchangeTags.TagIndex between 238 and 240
OR dbo.onchangeTags.TagIndex between 243 and 245
OR dbo.onchangeTags.TagIndex between 248 and 250
OR dbo.onchangeTags.TagIndex between 253 and 255
OR dbo.onchangeTags.TagIndex between 257 and 304
OR dbo.onchangeTags.TagIndex between 357 and 364
OR dbo.onchangeTags.TagIndex between 368 and 375
OR dbo.onchangeTags.TagIndex between 379 and 386
OR dbo.onchangeTags.TagIndex between 390 and 397
OR dbo.onchangeTags.TagIndex between 401 and 408
OR dbo.onchangeTags.TagIndex between 412 and 419
OR dbo.onchangeTags.TagIndex between 423 and 430
OR dbo.onchangeTags.TagIndex between 434 and 441
OR dbo.onchangeTags.TagIndex between 447 and 451
OR dbo.onchangeTags.TagIndex between 455 and 462
OR dbo.onchangeTags.TagIndex between 466 and 473
OR dbo.onchangeTags.TagIndex between 477 and 484
OR dbo.onchangeTags.TagIndex between 517 and 565
OR dbo.onchangeTags.TagIndex IN (880,881,882,888,889,890,896,897,
	898,904,905,906,912,913,914,920,921,922,928,
	929,930,936,937,938,944,945,946,952,953,954,
	960,961,962)
OR dbo.onchangeTags.TagIndex between 968 and 994
OR dbo.onchangeTags.TagIndex between 1205 and 1227
OR dbo.onchangeTags.TagIndex between 1229 and 1276
OR dbo.onchangeTags.TagIndex IN (1, 201)
OR dbo.onchangeTags.TagIndex between 485 and 490
OR dbo.onchangeTags.TagIndex between 493 and 516
OR dbo.onchangeTags.TagIndex between 1167 and 1190

);

GO


