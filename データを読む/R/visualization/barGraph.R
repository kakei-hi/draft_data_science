# 棒グラフ

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

faculty = c(rep("理学部", 206), rep("工学部", 300), rep("法学部", 180), 
            rep("文学部", 182))
career = c(rep("進学", 123), rep("就職", 80), rep("不明", 3),
           rep("進学", 152), rep("就職", 146), rep("不明", 2),
           rep("進学", 26), rep("就職", 147), rep("不明", 7),
           rep("進学", 15), rep("就職", 154), rep("不明", 13))

raw.df = data.frame(faculty = faculty, career = career) 

g = ggplot(data = raw.df, aes(x = faculty))
g = g + geom_bar(aes(y = career), stat = "identity")
plot(g)
