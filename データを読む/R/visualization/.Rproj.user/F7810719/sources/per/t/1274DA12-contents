# 回帰モデルフィット
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

quartz(file = "scatterPlot.pdf", type = "pdf", width = 7, height = 7)

ggplot(data = cars, aes(x = speed, y = dist)) +
  geom_point() +
  stat_smooth(method = lm, level = .95)

dev.off()
