df <- read.csv("sample_data.csv")

timeDivision <- (df$studyHrs - df$inClassHrs)

png("hist_studytime_diff.png")
hist(timeDivision, col=heat.colors(max(df$inClassHrs)), main="Division of Student Study Time\n(histogram)", xlab="Difference between in-class and out of class study time")
abline(v=mean(timeDivision), col="deepskyblue3", lwd=2)
abline(v=median(timeDivision), col="chartreuse3", lwd=2)
legend(x="topright", c("Mean", "Median"), col=c("deepskyblue3","chartreuse3"), lwd=c(2,2))
dev.off()
