library(ggplot2)
library(extrafont)

p1 <- ggplot(data = total.property.damages, aes(x = reorder(EVTYPE, - PROPFINAL), y = PROPFINAL / 10^9)) +
   geom_bar(fill = heat.colors(12, alpha = 1), color ="black", stat = "identity")  + 
   ylab("Total number of property damages \n (billions of dollars)") + xlab("Event type") +
   expand_limits(y = c(0, 170)) +
   ggtitle("Weather events' impact \n on the economic development in the US. \n Events with the highest number \n of property damages")

p1 <- p1 + theme(axis.text.x =
                    element_text(size  = 10,
                                 angle = 45,
                                 hjust = 1,
                                 vjust = 1))

p1 <- p1 + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                 panel.background = element_blank(), axis.line = element_line(colour = "black"))

p1 <- p1 + theme(
   plot.title = element_text(color = "red", size = 10, face = "bold.italic", family ="Comic Sans MS"),
   axis.title.x = element_text(color = "blue", size = 10, face = "bold"),
   axis.title.y = element_text(color = "#993333", size = 9, face = "bold"))

library(gridExtra)



library(ggplot2)
library(extrafont)
p1 <- ggplot(data = total.fatalities, aes(x = reorder(EVTYPE, - FATALITIES), y = FATALITIES)) +
   geom_bar(fill = heat.colors(12, alpha = 1), color ="black", stat = "identity")  + 
   ylab("Total number of fatalities") + xlab("Event type \n (Fig.2)") +
   expand_limits(y = c(0, 7000)) +
   ggtitle("Weather events' impact on the health of the US population. \n Events with the highest number of fatalities")

p1 <- p1 + theme(axis.text.x =
                    element_text(size  = 10,
                                 angle = 45,
                                 hjust = 1,
                                 vjust = 1))

p1 <- p1 + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                 panel.background = element_blank(), axis.line = element_line(colour = "black"))

p1 <- p1 + theme(
   plot.title = element_text(color = "red", size = 14, face = "bold.italic", family ="Comic Sans MS"),
   axis.title.x = element_text(color = "blue", size = 14, face = "bold"),
   axis.title.y = element_text(color = "#993333", size = 14, face = "bold"))

print(p1)


p1 <- ggplot(data = total.injuries, aes(x = reorder(EVTYPE, - INJURIES), y = INJURIES)) +
   geom_bar(fill = heat.colors(12, alpha = 1), color ="black", stat = "identity")  + 
   ylab("Total number of injuries") + xlab("Event type \n (Fig.1)") +
   expand_limits(y = c(0, 100000)) +
   ggtitle("Weather events' impact on the health of the US population. \n Events with the highest number of injuries")

p1 <- p1 + theme(axis.text.x =
                    element_text(size  = 10,
                                 angle = 45,
                                 hjust = 1,
                                 vjust = 1))

p1 <- p1 + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
                 panel.background = element_blank(), axis.line = element_line(colour = "black"))

p1 <- p1 + theme(
   plot.title = element_text(color = "red", size = 14, face = "bold.italic", family ="Comic Sans MS"),
   axis.title.x = element_text(color = "blue", size = 14, face = "bold"),
   axis.title.y = element_text(color = "#993333", size = 14, face = "bold"))

print(p1)


storm.data.released2$EVTYPE = mapvalues(storm.data.released2$EVTYPE, from = c("TSTM WIND", "THUNDERSTORM WINDS", "RIVER FLOOD", "HURRICANE/TYPHOON", "HURRICANE"), to = c("THUNDERSTORM WIND", "THUNDERSTORM WIND", "FLOOD", "HURRICANE", "HURRICANE"))

storm.data.released2$PROPDMGEXP = mapvalues(storm.data.released2$PROPDMGEXP, from = c("K", "M", "", "B", "m", "+", "0", "5", "6", "?", "4", "2", "3", "h", "7", "H", "-", "1", "8"), to = c(10^3, 10^6, 1, 10^9, 10^6, 1, 1, 10^5, 10^6, 1, 10^4, 10^2, 10^3, 10^3, 10^7, 10^2, 1, 1, 10^8))

print(head(storm.data.released2$PROPDMG, 12))