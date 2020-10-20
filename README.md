# Elastic Net Regression with R 
We fit an Elastic Net Logistic Regression model in R for using the Canadian General Social Survey 2016.
Data is only available to academic instutions. We downloaded our data from the [CHASS](http://dc.chass.utoronto.ca/myaccess.html)
website. If you posses a UofT account then to download the data for this project first go the [website](http://dc.chass.utoronto.ca/myaccess.html). Then
 
1. On the side bar click on "SDA @ CHASS"
2. Login with your University of Toronto account
3. Select your language of choice
4. "Ctrl + f", Command for Mac users, and type "gss"
5. Click on "General Social Survey"
6. Look for the 2016 version and click on "data"
7. Under "Download" click "Customized Subset"
8. Clik on the option to download as a "csv" file and select "All" variables
9. At the bottom click "continue" and download

Open 'gss_cleanup.R' and look for the line

```r
gss_raw <- read.csv("AAoJPbDn.csv")
```

change the file name to the name of the file you just downloaded. Select and run all code in this script, the model and report are in the file
'report.Rmd'.