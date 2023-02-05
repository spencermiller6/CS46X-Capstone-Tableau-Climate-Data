# CS46X-Capstone-Tableau-Climate-Data

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
- Using extracts to minimize the amount of data your computer is processing at a time can vastly improve performance. Filtering your extracts by a date and time range is an easy way to do this.
- In addition to being crucial for interfacing with GitHub, separating your packaged workbooks into distinct data and workbook files can vastly reduce the storage they require from your computer. If you have multiple workbooks that all rely on the same data you can simply have all of them point to a single data file rather than multiple copies for each workbook.

## Resources
- [Using Tableau with GitHub](https://www.mightycanary.com/ideas/tableau-version-management)
- [Tableau File Types](https://help.tableau.com/current/pro/desktop/en-us/environ_filesandfolders.htm)
- [Creating Extracts in Tableau](https://help.tableau.com/current/pro/desktop/en-us/extracting_data.htm)
