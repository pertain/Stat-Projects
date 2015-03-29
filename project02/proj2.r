# proj2.r
# 
# This program is used to produce plots for
# project 2 in sta215. The data set is based
# on electricity usage and cost.

require(aplpack)
require(ggplot2)

df <- read.csv("proj2_data.csv")

qtr1 <- subset(df, mon > 0 & mon < 4)
qtr2 <- subset(df, mon > 3 & mon < 7)
qtr3 <- subset(df, mon > 6 & mon < 10)
qtr4 <- subset(df, mon > 9 & mon < 13)

q1kwh <- qtr1$kwh
q2kwh <- qtr2$kwh
q3kwh <- qtr3$kwh
q4kwh <- qtr4$kwh

#df
#qtr1
#qtr2
#qtr3
#qtr4
#q1kwh
#q2kwh
#q3kwh
#q4kwh

sageColors <- c("darkseagreen4","darkseagreen","darkseagreen3",
                "darkseagreen2","darkseagreen1","honeydew",
                "white","honeydew","darkseagreen1",
                "darkseagreen2","darkseagreen3","darkseagreen")


# ===========================================================
# question 1 - back-to-back stem and leaf of 2 diff quarters
# ===========================================================

stem.leaf.backback(x = q1kwh,
                   y = q2kwh,
                   m = 1,
                   unit = 10)


# ===========================================================
# question 2 - histogram of one of the two quarters
# ===========================================================

png("hist_qtr1_kwh.png")
hist(qtr1$kwh,
     #col = cm.colors(7),
     #col = terrain.colors(7),
     col = sageColors,
     main = "Histogram of First Quarter\nElectricity Usage",
     xlab = "Electricity Usage [kWh]")
dev.off()


# ===========================================================
# question 3 - descriptive statistics for data from question 2
# ===========================================================

descriptiveStats <- summary(qtr1$kwh)
class(descriptiveStats)


# ===========================================================
# question 4 - box and whisker plot of data from question 2
# ===========================================================

df$qtrs <- append(rep(c(rep("Q4",3), rep("Q3",3), rep("Q2",3), rep("Q1",3)), 5), rep("Q4",3))

png("boxplots_kwh.png")
boxplot(df$kwh~df$qtrs,
        main = "Boxplots of Electricity Usage\nby Quarter",
        xlab = "Quarters",
        ylab = "Electricity Usage [kWh]",
        col = terrain.colors(4))
dev.off()


# ===========================================================
# question 5 - lineplot of dollars per kWh (entire data set)
# ===========================================================

months <- append(rep(c("Dec","Mar","Jun","Sep"), 5), "Dec")

png("line_dolpkwh.png")
plot(df$dolpkwh,
     type = "l",
     axes = FALSE,
     main = "Seasonal Trends in Electricity Prices",
     font.lab = 2,
     xlab = "Months (over a five year period)",
     ylab = "Price ($/kWh)",
     lwd = 3,
     col = "springgreen3")
grid()
box()
axis(side = 1,
     at = seq(1,61,3),
     lab = months,
     las = 2)
axis(side = 2)
dev.off()


# ===========================================================
# question 6 - scatter plot of KWh/day and $/KWh
# ===========================================================

mons <- append(rep(c("Dec","Nov","Oct","Sep","Aug","Jul",
                     "Jun","May","Apr","Mar","Feb","Jan"), 5),
               c("Dec","Nov","Oct"))

qplot(kwhpday,
      dolpkwh,
      colour = mons,
      data = df) +
labs(colour = "Months",
     x = "Daily Electricity Usage (kWh/Day)",
     y = "Price of Electricity ($/kWh)",
     title = "Scatterplot of Electricity Prices vs Usage")
ggsave(file = "scatter.png")
