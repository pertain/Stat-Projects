df <- read.csv("sample_data.csv")

statistic <- c("Mean","Median","Standard Deviation","Variance")

studyHrStats <- c(mean(df$studyHrs),median(df$studyHrs),sd(df$studyHrs),var(df$studyHrs))
dfStudyHrs <- data.frame(statistic,studyHrStats)
dfStudyHrs

write.csv(dfStudyHrs, "stats_studyHrs.csv", row.names=FALSE)
