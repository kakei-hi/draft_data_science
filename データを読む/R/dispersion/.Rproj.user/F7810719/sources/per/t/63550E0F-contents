# 尖度

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

g = ggplot(data = data.frame(X = c(-10, 10))) + xlim(-10, 10)
g = g + stat_function(fun = dnorm, args = list(mean = 0, sd = 1.5), colour = "blue")
g = g + stat_function(fun = dt, args = list(df = 30, ncp = 0), colour = "green")
# g = g + stat_function(fun = dlogis, args = list(location = 0, scale = 5), colour = "green")
g = g + stat_function(fun = dcauchy, args = list(location = 0, scale = 5), colour = "red")
g = g + theme(axis.title = element_blank(),
              axis.text = element_blank(),
              axis.ticks = element_blank(),
              panel.grid.major = element_blank())

plot(g)


# ラプラス分布
rlaplace = function(n){
  u = log(runif(n))
  v = ifelse(runif(n) > 1 / 2, 1, -1)
  return(u * v)
  
}

size.t = 10000
size.g = 10000000
t.vec = rt(n = size.t, df = 1, ncp = 0)
laplace.vec = rlaplace(size.t)
gauss.vec = rnorm(n = size.g)

t.max = max(t.vec) + 1
t.min = min(t.vec) - 1
hist(t.vec, prob = T, xlim = c(-5, 5), ylim = c(0, 0.4), breaks = seq(t.min, t.max, 0.5))
curve(dnorm(x), add = TRUE)

t.max = max(laplace.vec) + 1
t.min = min(laplace.vec) - 1
hist(laplace.vec, prob = T, xlim = c(-5, 5), ylim = c(0, 0.4), breaks = seq(t.min, t.max, 0.5))
curve(dnorm(x), add = TRUE)

