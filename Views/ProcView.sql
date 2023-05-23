USE [TERA]
GO

/****** Object:  View [dbo].[ProcView]    Script Date: 4/20/2023 3:27:04 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER     VIEW [dbo].[ProcView]
AS

SELECT        
dbo.ProcFloatTable.DateAndTime, 
dbo.ProcFloatTable.Millitm,
dbo.procTags.Chamber,
dbo.ProcFloatTable.Status, 
dbo.ProcFloatTable.Marker,
dbo.procTags.Measurement,
dbo.ProcFloatTable.Val
FROM dbo.ProcFloatTable INNER JOIN
--limit to only the tags we need for Proc Table
dbo.procTags ON dbo.procTags.TagIndex = dbo.ProcFloatTable.TagIndex
WHERE
(dbo.procTags.TagIndex IN (0,1,4,9,10,13,18,19,22,27,28,
	31,36,37,40,45,46,49,63,64,67,72,73,76,81,
	82,85,90,91,94,99,100,103,108,109,112,288)
OR dbo.procTags.TagIndex between 129 and 140
OR dbo.procTags.TagIndex between 228 and 259
OR dbo.procTags.TagIndex between 263 and 275
OR dbo.procTags.TagIndex between 321 and 332
OR dbo.procTags.TagIndex between 345 and 392
OR dbo.procTags.TagIndex IN (199, 200)
OR dbo.procTags.TagIndex between 276 and 287
);

GO


