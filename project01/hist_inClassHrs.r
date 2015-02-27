df <- read.csv("sample_data.csv")

png('hist_inClassHrs.png')
hist(df$inClassHrs, col=heat.colors(max(df$inClassHrs)), main="Hours spent in Class\n(histogram)", xlab="Hours spent studying in class")
abline(v=mean(df$inClassHrs), col="deepskyblue3", lwd=2)
abline(v=median(df$inClassHrs), col="chartreuse3", lwd=2)
legend(x="topright", c("Mean","Median"), col=c("deepskyblue3", "chartreuse3"), lwd=c(2,2))
dev.off()
