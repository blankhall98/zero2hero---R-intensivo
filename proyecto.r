# PROYECTO GGPLOT2 + DPLYR
library(ggplot2)
library(dplyr)
library(readr)

BTC_USD <- read_csv("data/BTC-USD.csv")
META <- read_csv("data/META.csv")

#view
View(BTC_USD)

#columnas
names(BTC_USD)

#subbase
BTC <- data.frame(
  'Date' = BTC_USD$Date,
  'Close' = BTC_USD$Close,
  'Volume' = BTC_USD$Volume
)

View(BTC)
summary(BTC)

#grafica sencilla
plot(BTC$Date,BTC$Close,type='l')

plot(META$Date,META$Close,type='l')

# FILTER
bitcoin_caro <- BTC %>% filter(Close > 40000)

bitcoin_barato <- BTC %>% filter(Close < 20000)

media_caro <- mean(bitcoin_caro$Volume)
media_barato <- mean(bitcoin_barato$Volume)

bitcoin_barato_solito <- BTC %>% filter(Close < 20000, Volume < media_barato)

flores <- iris

#ARRANGE
petalo_desc <- flores %>% arrange(desc(Petal.Length))
petalo_grande <- head(petalo_desc)
petalo_pequeño <- tail(petalo_desc)

busqueda <- head(flores %>% filter(Species == 'setosa') %>%
  arrange(desc(Petal.Length)))

#MUTATE
flores <- flores %>% mutate(Petal.Area = Petal.Length*Petal.Width)

#SUMMARISE
BTC %>% filter(Close < 20000) %>% summarise(mediaC = mean(Close))

BTC <- BTC %>% mutate(retraso = lag(Close))
BTC <- BTC %>% mutate(Returns = (Close/lag(Close))-1)

#ggplot2
ggplot(flores,aes(Petal.Width,Petal.Length,color=Species,size=Petal.Area))+
  geom_point()

ggplot(flores,aes(Petal.Width,Petal.Length))+
  facet_wrap(~Species)+
  geom_smooth(method = 'lm')+
  geom_point()

META <- META %>% mutate(Returns = (Close/lag(Close))-1)

META$Returns
BTC$Returns

ggplot(BTC,aes(x=Date,y=Close))+
  ggtitle('BITCOIN')+
  geom_line()

ggplot(BTC,aes(x=Returns))+geom_histogram()

ggplot(flores,aes(x=Petal.Area,color=Species))+
  geom_histogram()

NFLX <- read_csv("data/NFLX.csv")

NFLX <- NFLX %>% mutate(Returns = (Close/lag(Close))-1)

#analis de portafolio
portafolio <- data.frame(
  'Meta' = META$Returns,
  'Netflix' = NFLX$Returns
)

portafolio <- na.omit(portafolio)

#analisis de correlacion
ggplot(data=portafolio,aes(x=Meta,y=Netflix))+
  geom_smooth(method='lm')+
  geom_point()

modelo <- lm(data=portafolio,formula=Netflix ~ Meta)
summary(modelo)
