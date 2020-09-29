# 分散

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

mu = 0
sig0 = 1
sig1 = 3
n0 = 800
n1 = 1000

var_small.vec = rnorm(n = n0, mean = mu, sd = sig0)
g = ggplot(NULL, aes(x = var_small.vec))
g = g + geom_histogram(fill = "white", colour = "black")
g = g + geom_vline(xintercept = mu, linetype = "dashed")
g = g + xlim(c(-3 * sig1, 3 * sig1))
g = g + theme(axis.title = element_blank(),
              axis.text = element_blank(),
              axis.ticks = element_blank(),
              panel.grid.major = element_blank())
plot(g)

var_larg.vec = rnorm(n = n1, mean = mu, sd = sig1)
g = ggplot(NULL, aes(x = var_larg.vec))
g = g + geom_histogram(fill = "white", colour = "black")
g = g + geom_vline(xintercept = mu, linetype = "dashed")
g = g + xlim(c(-3 * sig1, 3 * sig1))
g = g + theme(axis.title = element_blank(),
              axis.text = element_blank(),
              axis.ticks = element_blank(),
              panel.grid.major = element_blank())
plot(g)
