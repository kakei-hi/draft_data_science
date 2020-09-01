# 年齢 - 年収

pckg = "tidyverse"
if(!require(pckg, character.only = TRUE)){
  install.packages(pckg, type = "source")
  if (!require(pckg, character.only = TRUE)){
    str = paste0("could not install ", pckg)
    stop(str)
  }
}

par(family = "HiraKakuProN-W3");                      # plot() で日本語 on mac
theme_set(theme_grey(base_family = "HiraKakuProN-W3")); # ggplot で日本語

N = 30

income = ceiling(rnorm(n = N, mean = 600, sd = 30))
dept = rep("総務", N)
a = data.frame(年収 = income, 部署 = dept)

income = ceiling(rnorm(n = N, mean = 650, sd = 30))
dept = rep("営業", N)
b = data.frame(年収 = income, 部署 = dept)

income = ceiling(rnorm(n = N, mean = 750, sd = 40))
dept = rep("開発", N)
c = data.frame(年収 = income, 部署 = dept)

data.df = a %>% bind_rows(b) %>% bind_rows(c)

rid = runif(nrow(data.df))
data.df = data.df %>%
  mutate(id = rid) %>%
  arrange(id) %>%
  select(年収, 部署) %>%
  write_csv("annualIncome.csv")

g = ggplot(data.df, aes(x = 部署, y = 年収))
# g = g + ggtitle("ニワトリの飼料")
g = g + geom_boxplot()
plot(g)


