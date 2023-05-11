USE [TERA]
GO

/****** Object:  View [dbo].[historyView]    Script Date: 4/26/2023 9:11:35 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO






CREATE OR ALTER VIEW [dbo].[historyView]
AS

SELECT        
	dbo.FloatTable.DateAndTime, 
	dbo.FloatTable.Millitm,
	dbo.historyTags.Chamber,
	dbo.FloatTable.Status, 
	dbo.FloatTable.Marker,
	dbo.historyTags.Measurement,
	dbo.FloatTable.Val
FROM dbo.FloatTable
	INNER JOIN
	--limit to only the tags we need for History Table
	dbo.historyTags ON dbo.historyTags.TagIndex = dbo.FloatTable.TagIndex
WHERE dbo.historyTags.TagIndex IN(0,2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,20,25,27,28,30,31,32,34,35,37,38,39,41,42,44,45,46,48,49,51,52,53,55,56,58,59,60,62,63,65,66,67,69,70,72,73,74,76,77,79,80,81,83,84,86,87,88,90,91,93,94,95,97,98,100,101,102,104,105,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,261,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,324,325,326,331,333,338,340,345,347,352,354,359,361,366,368,373,375,380,382,387,389,394,396,401,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,552,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662,663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,710,711,712,713,714,715,716,717,718,719,720,721,722);
GO

