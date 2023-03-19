#Deliverable 1

#Use the library() function to load the dplyr package.
library(dplyr)

#import and read in the MechaCar_mpg.csv file as a dataframe.
mechacar_mpg <- read.csv(file='MechaCar_mpg.csv',check.names=F,stringsAsFactors = F)
head(mechacar_mpg)

#Perform linear regression using the lm() function.
lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD ,data=mechacar_mpg)

#Using the summary() function, determine the p-value and the r-squared value for the linear regression model.
summary(lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=mechacar_mpg)) 

#Deliverable 2

#import and read in the Suspension_Coil.csv file as a table.
suspension_coil <- read.csv(file='Suspension_Coil.csv',check.names=F,stringsAsFactors = F) 

#Write an RScript that creates a total_summary dataframe using the summarize() function to get the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
total_summary <- suspension_coil %>% summarize(Mean_PSI=mean(PSI),
                                          Median_PSI=median(PSI),
                                          Var_PSI=var(PSI),
                                          Std_Dev_PSI=sd(PSI),
                                          Num_Coil=n(), .groups = 'keep') 

#Write an RScript that creates a lot_summary dataframe using the group_by() and the summarize() functions to group each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil’s PSI column.
lot_summary <- suspension_coil %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI),
                                                                         Median_PSI=median(PSI),
                                                                         Var_PSI=var(PSI),
                                                                         Std_Dev_PSI=sd(PSI),
                                                                         Num_Coil=n(), .groups = 'keep') 
#Deliverable 3

#Use the t.test() function to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 pounds per square inch.
t.test(suspension_coil$PSI,mu=mean(suspension_coil$PSI))

# t-test for lot 1
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot == "Lot1"),mu=mean(suspension_coil$PSI))

# t-test for lot 2
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot == "Lot2"),mu=mean(suspension_coil$PSI))

# t-test for lot 3
t.test(subset(suspension_coil$PSI,suspension_coil$Manufacturing_Lot == "Lot3"),mu=mean(suspension_coil$PSI))

