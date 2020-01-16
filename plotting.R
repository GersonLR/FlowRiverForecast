#x<-my_data[["Date"]]
x<-c(1:29203)
y<-my_data[["average_daily_flow"]]


#grafico normal
heading = paste("Caudal promedio diario 1937-2017")
plot(x, y, type="n", main=heading,xlab="días", ylab="m3/s" )
lines(x, y, type="l")


#usando ggplot

require(ggplot2)
p <- ggplot(aes(x = x, y = y), data = my_data) + geom_line()
p + labs(title = "Caudal promedio diario 1937-2017",y="Caudal (m3/seg)", x = "Fecha")

