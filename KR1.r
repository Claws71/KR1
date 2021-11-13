# Установка пакето
install.packages('ggplot2')
install.packages('tidyverse')

# Подключение библиотек ggplot2 и tidyverse
library(ggplot2)
library(tidyverse)


# Подключение БД
bd <- read.csv("RU_Electricity_Market_PZ_dayahead_price_volume.csv", header = TRUE, sep = ",")

# Названия столбцов
names(bd)

# Авторегрессионный процесс
set.seed(49)
y <- arima.sim(n = nrow(bd), bd)
plot(y)

# Создание графика
ggplot(data = bd)+
  geom_point(alpha = 1/2, mapping = aes(x= timestep, y = price_eur, color = consumption_eur))


ggplot(data = bd)+
  geom_point(alpha = 1/4, mapping = aes(x= consumption_eur, y = price_eur))