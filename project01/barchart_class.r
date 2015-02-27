df <- read.csv("sample_data.csv")

numByClass <- c(length(subset(df$yr, df$yr == "Freshman")),
				length(subset(df$yr, df$yr == "Sophomore")),
				length(subset(df$yr, df$yr == "Junior")),
				length(subset(df$yr, df$yr == "Senior")))

png("barchart_class.png")
barplot(numByClass,
		main="Students by Class\n(barchart)",
		xlab="Class", ylab="Total Students",
		col=rainbow(4),
		names.arg=c("Freshman","Sophomore","Junior","Senior"))
dev.off()
