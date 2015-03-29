df <- read.csv("sample_data.csv")

png('hist_compare.png')
hist(df$studyHrs,
     col=heat.colors(max(df$inClassHrs)),
     main="Hours Spent Studying\n(histogram)",
     xlab="Hours spent in class & studying")
abline(v=mean(df$studyHrs),
       col="deepskyblue3",
       lwd=2)
abline(v=median(df$studyHrs),
       col="chartreuse3",
       lwd=2)

hist(df$inClassHrs,
     col=cm.colors(max(df$inClassHrs)),
     main="Hours spent in Class\n(histogram)",
     xlab="Hours spent in class & studying",
     add=TRUE)
abline(v=mean(df$inClassHrs),
       col="magenta",
       lwd=2)
abline(v=median(df$inClassHrs),
       col="lightsteelblue4",
       lwd=2)

legend(x="topright",
       c("Class Mean","Class Median","Study Mean","Study Median"),
       col=c("deepskyblue3", "chartreuse3","magenta","lightsteelblue4"),
       lwd=c(2,2))
dev.off()
