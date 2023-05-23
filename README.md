# CS46X-Capstone-Tableau-Climate-Data

## Project Introduction
The Tableau dashboard project aims to create a user-friendly platform for accessing, analyzing, visualizing, and extracting data from a large SQL database containing climate change data from Oregon State University’s Dr. Jillian Gregg’s research. The primary users will be students, researchers, and faculty from Oregon State University, with the potential for expansion to other research institutions, and it will provide users with faster, consistent speeds for manipulating and transforming data. The dashboard allows users to explore different variables and perform arithmetic calculations on them, as well as compare and analyze data to be used in research or publication. The project's scope includes creating workarounds for missing values, assessing chamber climate control precision, and comparing control efficiency before and after key changes in operations.

## Overview of Worksheets
- Data Sleuthing: Allows the user to see their data and its variability. Also gives the user the ability to filter out certain data. (useful for handling outliers)
- Treatment Average: Gives the user the ability to view the averages of any given measurement and treatment visualized on a bar or line graph.
- Data Sleuthing - Virtual Tags: Same as Data Sleuthing but with Virtual Tags/Calculated Fields. (Values Calculated using the measurements and treatments.)
- Treatment Average - Virtual Tags: Same as Treatment Average but with Virtual Tags/Calculated Fields. (Values Calculated using the measurements and treatments.) This worksheet takes a while to load due to the calculations.
- X vs Y: Allows the User to compare two different measurements against each other. One plotted on the X axis and one on the Y axis.
- Double Y: Enables the user to compare two different measurements over time with two separate y axes for each measurement.
- Temp Setpoint Avg Diff: Shows the user the differences between the chamber temperature values and what was expected from the experiment (setpoint).
- Chamber Per Treatment: Allows the user to select treatments and measurements and visualize measurement data for chambers in the selected treatment. Supports the use of multiple treatments.

## Dashboard Manipulations
Dashboards can be configured to display different data based on the filters set on the right side of each dashboard. These are the filters used throughout the workbook:
- Measurement: Variable recorded during experiment (temperature, precipitation, etc)
- Treatment: Asymmetric, Symmetric, Ambient
- Chambers: 14 different chambers used in the experiment
- Month
- Quarter
- Year
- Day/Night
- Cut off High
- Cut off Low

## Important Details
There are a total of three treatments, each treatment is applied to various different temperature chambers. The treatments are Ambient, Symmetric, and Asymmetric. There are a total of fourteen chambers (denoted by “tr_” followed by their id number) which correspond to one of the treatments. Here are all the chambers and their respective treatment:
- Ambient: tr_02, tr_06, tr_10, tr_14
- Symmetric: tr_03, tr_05, tr_11, tr_13
- Asymmetric: tr_4, tr_7, tr_09, tr_12

Ambient is defined as the chamber being the same as the external environment temperature. Symmetric is the external environment temperature raised by a constant temperature (3.5 degrees). Asymmetric is the external temperature during the day, and a greater temperature at the night.
There are two measurement variables that are particularly important to know and those are: “tr_therm_1” and “tr_air_temp_sp”. The “tr_therm_1” measurement contains the values of the true temperature values within the chambers for every minute. The “tr_air_temp_sp” holds the “goal” value or the value at which the researchers would like their measurement values to be at. Having these two variables is important in allowing the researchers to see how reliable their measurement recordings are. 

## Setting-Up Your Environment
 In order to use GitHub with Tableau, you first need to separate the worbook from the data it comes packaged with. To do this, you must take the following steps:
- Change your file explorer settings to show file name extensions.
- Change the file extension of your packaged workbook from .twbx to .zip.
- Extract the folder you have just created, doing this will separate the data and worbook files.
- The workbook file inside the new folder will be substantially smaller and can be uploaded to GitHub. Check it and make sure that it still functions properly.
- You can now delete the original packaged workbook.

## Pulling the Latest Workbook & Pushing Your Changes
- After your initial pull, syncing your workbook with the master branch will mostly work as normal.
- To get started, pull a copy of the TERA file from the repository and open it.
- Go to file -> import workbook, and select the workbook version you've been working on.
- This will import all dashboards and sheets from your existing workbook, some of which may be redundant.
- Look through all of the dashboards and sheets in the main TERA file and carefully remove the ones that are redundant. This can be a tedious process but be careful.

## Best Practices
- Pushing and pulling with the repository frequently makes the syncing process much simpler. It also helps to constrain each commit to the creation, update to, or deletion of, a single dashboard or sheet at a time.
- Using extracts to minimize the amount of data your computer is processing at a time can vastly improve performance. Filtering your extracts by a date and time range is an easy way to do this:
  - Go to the data source tab
  - Switch your connection from live to extract
  - Edit your extract: add a filter on date and time
  - Select range of dates and adjust the range as desired
    - Start with a small range, like a week, and test its performance before moving up to larger ranges like a month or year
    - 2010 is the go-to test year
  - Select ok to exit all of the windows and create the extract
  - Wait for Tableau to do any preprocessing, then switch tabs out of the data source into a dashboard or sheet to create and save the extract
- In addition to being crucial for interfacing with GitHub, separating your packaged workbooks into distinct data and workbook files can vastly reduce the storage they require from your computer. If you have multiple workbooks that all rely on the same data you can simply have all of them point to a single data file rather than multiple copies for each workbook.

## Resources
- [Using Tableau with GitHub](https://www.mightycanary.com/ideas/tableau-version-management)
- [Tableau File Types](https://help.tableau.com/current/pro/desktop/en-us/environ_filesandfolders.htm)
- [Creating Extracts in Tableau](https://help.tableau.com/current/pro/desktop/en-us/extracting_data.htm)
