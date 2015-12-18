This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the “Individual household electric power consumption Data Set” which I have made available on the course web site:

here is the data set [here](https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip)

The following descriptions of the 9 variables in the dataset are taken from the UCI web site:[here](https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption)

------------------
### Loading the data

The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. Make sure your computer has enough memory (most modern computers should be fine).

--------
We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.

---------
You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime() and as.Date() functions.

-----
ALL Information [information](https://github.com/rdpeng/ExData_Plotting1)
