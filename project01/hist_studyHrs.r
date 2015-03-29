df <- read.csv("sample_data.csv")

png('hist_studyHrs.png')
hist(df$studyHrs,
     col=heat.colors(max(df$inClassHrs)),
     main="Hours Spent Studying\n(histogram)",
     xlab="Hours spent studying outside of class")
abline(v=mean(df$studyHrs),
       col="deepskyblue3",
       lwd=2)
abline(v=median(df$studyHrs),
       col="chartreuse3",
       lwd=2)
legend(x="topright",
       c("Mean","Median"),
       col=c("deepskyblue3","chartreuse3"),
       lwd=c(2,2))
dev.off()
