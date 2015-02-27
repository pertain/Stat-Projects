df <- read.csv("sample_data.csv")

statistic <- c("Mean","Median","Standard Deviation","Variance")
values <- c(mean(df$inClassHrs),median(df$inClassHrs),sd(df$inClassHrs),var(df$inClassHrs))

dfClassHrs <- data.frame(statistic,values)
dfClassHrs

write.csv(dfClassHrs, "stats_classHrs.csv", row.names=FALSE)
