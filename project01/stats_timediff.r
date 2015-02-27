df <- read.csv("sample_data.csv")

timeDivision <- (df$studyHrs - df$inClassHrs)

statistic <- c("Mean","Median","Standard Deviation","Variance")

timeDiffStats <- c(mean(timeDivision),median(timeDivision),sd(timeDivision),var(timeDivision))
dfTimeDiff <- data.frame(statistic,timeDiffStats)
dfTimeDiff

write.csv(dfTimeDiff, "stats_timediff.csv", row.names=FALSE)
