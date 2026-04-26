#First, initialize monthly_sales.
monthly_sales = c(120, 135, 148, 160, 145, 170, 165, 180, 200, 190, 220, 205)

#BASIC ANALYSIS
#Calculate the total sales for the year.
#Simply add all values in a vector using sum() function

sum(monthly_sales)

#Find the average monthly sales.
#Use mean() function

mean(monthly_sales)

#Identify the month with the highest sales.
#Using names() function let's assign a month to each value

names(monthly_sales) = month.abb

#Now, names(monthly_sales) gets us a vector with months, using a mask get such vector where value equals to the maximum value.

names(monthly_sales)[monthly_sales == max(monthly_sales)]

#SALES GROWTH ANALYSIS
#Calculate the month-over-month sales growth rate. Store this in a new vector and ensure that your result has one less element than the monthly_sales vector.
# Create a rate vector, to calculate a growth rate we should subtract prev. months from next months. For this take 
# monthly_sales[-1] as next months monthly_sales[-12] as prev. months for corresponding months. What is left to do is
# Subtract and get a rate. Moreover, don't forget to assign names to values, must be all months except Jan (as for Jan no prev. value).

rate = monthly_sales[-1] - monthly_sales[-12]
names(rate) = month.abb[-1]

#Determine the month with the highest growth rate. Display the month and the growth rate.
#Calculate the max value using max(), from names(rate) using same mask as previously find the name, and print needed values. In the message function we
#must put " " to separate values.
max_rate = max(rate)
message(names(rate)[rate == max_rate], " ", max_rate)

#DATA MANIPULATION
#ABC Corp believes that adding 10% to the sales figures of the first six months will provide a more accurate picture due to an accounting error. Adjust the dataset accordingly and recalculate the total and average sales.
#Using slicing get first 6 monthly sales and adjust by 10%
#Calculate rate same as previously.

monthly_sales[1:6] = monthly_sales[1:6] * 1.1
rate = monthly_sales[-1] - monthly_sales[-12]

#Create a named vector using the adjusted sales data, with names indicating months (January to December).
#I think we already have that

#ADVANCED ANALYSIS
#Using the adjusted sales data, identify any months where sales were below the annual average. List these months and their sales figures.
#First assign values and corresponding names to new vector c using mask, and print

ans = monthly_sales[monthly_sales < mean(monthly_sales)]
names(ans) = names(monthly_sales)[monthly_sales < mean(monthly_sales)]

ans

#Calculate the variance and standard deviation of the monthly sales (both original and adjusted data) to understand the variability in sales.
# Using var(for varience) and sd(standard deviation) calculate for both.
old_monthly_sales = c(120, 135, 148, 160, 145, 170, 165, 180, 200, 190, 220, 205)
names(old_monthly_sales) = month.abb
var(old_monthly_sales)
var(monthly_sales)
sd(old_monthly_sales)
sd(monthly_sales)

#We can conclude that monthly_sales are more stable and smooth than old_monthly sales, as both sd and var are less.