# 折れ線グラフ UKgas

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

qtr = as.numeric(time(UKgas))
cnsmp = as.numeric(UKgas)

quartz(file = "lineChart.pdf", type = "pdf", width = 7, height = 7)

# 折れ線グラフ
tibble(qtr, cnsmp) %>%
  filter(qtr >= 1960) %>%
  ggplot(aes(x = qtr, y = cnsmp)) +
  geom_line() +
  geom_point() + 
  xlab("四半期") +
  ylab("消費量")

# 散布図
tibble(qtr, cnsmp) %>%
  filter(qtr >= 1970) %>%
  ggplot(aes(x = qtr, y = cnsmp)) +
  geom_point() + 
  xlab("四半期") +
  ylab("消費量")

dev.off()


