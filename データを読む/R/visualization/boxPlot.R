# 箱ひげ図

pckg = "tidyverse"
if(!require(pckg, character.only = TRUE)){
  install.packages(pckg, type = "source")
  if (!require(pckg, character.only = TRUE)){
    str = paste0("could not install ", pckg)
    stop(str)
  }
}

par(family = "HiraKakuProN-W3")                     # plot() で日本語 on mac
theme_set(theme_grey(base_family = "HiraKakuProN-W3")) # ggplot で日本語

# 説明用箱ひげ図
x =rnorm(n = 100)
explain.vec = c(x, rnorm(n = 5, mean = 2, sd = 1))

# 貯蓄データ
skew.df = read_csv("../mean/amountSaving.csv")
sym.df = read_csv("../mean/symDist.csv")
data.frame(skew = skew.df$amount_of_saving, 
           sym = sym.df$amount_of_saving) %>%
  pivot_longer(cols = c('skew', 'sym'), names_to = "dist", values_to = "val") ->
  saving.df

quartz(file = "boxplot.pdf", type = "pdf", width = 7, height = 7)

ggplot(data = NULL, aes(y = explain.vec)) +
  geom_boxplot() + 
  theme(axis.title = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks = element_blank(),
        panel.grid.major = element_blank())

ggplot(data = saving.df, aes(x = dist, y = val)) +
  geom_boxplot() + 
  theme(axis.title = element_blank(),
        axis.text.x = element_blank(),
        axis.ticks = element_blank(),
        panel.grid.major = element_blank())

dev.off()


