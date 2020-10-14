# 歪度
 
pckg = "tidyverse"
if(!require(pckg, character.only = TRUE)){
  install.packages(pckg, type = "source")
  if (!require(pckg, character.only = TRUE)){
    str = paste0("could not install ", pckg)
    stop(str)
  }
}

neg_skew.vec = rlnorm(n = 10000, meanlog = 2, sdlog = 0.5)
g = ggplot(NULL, aes(x = neg_skew.vec))
g = g + geom_histogram(fill = "white", colour = "black", binwidth = 1)
g = g + xlim(c(0, 30))
g = g + theme(axis.title = element_blank(),
              axis.text = element_blank(),
              axis.ticks = element_blank(),
              panel.grid.major = element_blank())
plot(g)