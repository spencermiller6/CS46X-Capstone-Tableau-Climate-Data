# Documentation - Steven Vu (6/1/2023)

## Dependencies
- Tableau Desktop subscription
- Tableau Workbook
- TERA data source file
  
### Best practices for calculation fields
- When making calculation fields that utilize other calculaton fields, it is best to use the calculation field definitions instead. This is because calling other calculation fields increases the number of computations needed.
  - For example, if your calculation field uses [Average Sales], where Average Sales is a separate calculation field, just substitute the contents of the Average Sales calculation for [Average Sales] in your new calculation field.
  - Make sure to add comments as to will help with user readability. I was able to add comments using "//", "/*", and "*/", however, I did realize that one of my peers could not comment code with this method. You will have to test what works for you.
- Use descriptive field and alias names.
  - Ask the project planner if there is a particular naming convention they would like to use
- Understand level of data and scope of the data
  - When I was using a level of detail that was not steep enough, it caused a row to have repeating values. This was resolved when I specified the level of detail that I wanted.
- Validate calculation fields
  - Make sure that the values you are getting are in line with the data you get from other calculations/sources. If there's some differences between actual vs expected data, this would most likely impact the understanding of the grander picture.
- Simplify calculations when possible or see if there's already a built-in function for the functionality that you are implementing as these functions will often be more efficient.
  - There's already:
    - Aggregation functions
    - Table calculations
    - Level of Detail expressions
- Look at previously done calculation and worksheets. 
  - Our group was able to learn how to implement error bars because there was something similar in an existing worksheet.

### Dealing with NULL values
- Impute using calculation fields
  - Use functions like IFNULL(), ISNULL(), and/or IF() statements to check for NULL values and optionally provide an alternative value.
    - Example:
      - IFNULL([Val], AVG({INCLUDE [Chamber]: SUM[Val]}))
      - This would fill in any NULL values with the average Val of the respective Chamber
- If you want to adjust how NULL values are displayed in a view, you can go to the format options on the view (say, right clicking on the y-axis and selecting "format..." for example), select the "pane" tab and you should see a dropdown for options relating to special values. (You can also adjust how many decimal values are displayed, which may be useful to show significant figures)
- There's a Tableau function called "Zn" that returns the "default" or valid values when it is not NULL and returns zero if, for the row, the column value is NULL. In certain scenarios, you might not want to use this function as it would affect calculation values (like finding averages, for example).

### Other helpful functions
- The Tableau expression, "FIXED," is a Level of Detail (LOD) specifier that allows the user the specify the dimension(s), regardless of the dimensions specified in reference to the view. Details of other specifers can be found [here](https://help.tableau.com/current/pro/desktop/en-us/calculations_calculatedfields_lod_overview.htm).

### Helpful resources
- [Tableau Desktop and Web Authoring](https://www.tableau.com/support/help)
  - Useful tutorials and guides to help get started with Tableau
- [Youtube - sqlbelle](https://www.youtube.com/@sqlbelle/videos)
  - Covers some beginner and more advanced applications of Tableau with examples
