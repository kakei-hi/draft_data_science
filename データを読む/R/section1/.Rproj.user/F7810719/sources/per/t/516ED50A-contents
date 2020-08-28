# ニワトリ: 飼料 - 体重

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

rid = runif(nrow(chickwts))
data.df = chickwts %>%
  mutate(id = rid) %>%
  arrange(id) %>%
  filter(feed == "casein" | feed == "horsebean" | feed == "soybean") %>%
  mutate(飼料 = case_when(
    feed == "casein" ~ "カゼイン",
    feed == "horsebean" ~ "空豆",
    feed == "soybean" ~ "大豆"
  )) %>%
  rename(体重 = weight) %>%
  select(体重, 飼料) %>%
  write_csv("chckenWeight.csv")

g = ggplot(data.df, aes(x = 飼料, y = 体重))
# g = g + ggtitle("ニワトリの飼料")
g = g + geom_boxplot()
plot(g)