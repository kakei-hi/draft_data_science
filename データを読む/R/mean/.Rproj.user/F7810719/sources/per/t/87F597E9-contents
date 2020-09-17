# 平均値と分布

pckg = "tidyverse"
if(!require(pckg, character.only = TRUE)){
  install.packages(pckg, type = "source")
  if (!require(pckg, character.only = TRUE)){
    str = paste0("could not install ", pckg)
    stop(str)
  }
}

## 日本語設定
par(family = "HiraKakuProN-W3")                       # plot() で日本語 on mac
theme_set(theme_grey(base_family = "HiraKakuProN-W3")) # ggplot で日本語

## 幾何平均
geoMean = function(x){
  
  # 算術平均と幾何平均の関係を利用
  g = exp(mean(log(x)))

  return(g)
  
}

## 調和平均
harmMean = function(x){
  
  # 算術平均と調和平均の関係を利用
  h = 1 / mean(1 / x)
  
  return(h)
  
}

# hazurechi.vec = runif(n = 6, min = 25, max = 30)
hazurechi.vec = c(55, 55, 57, 58, 59, 59)
hist(hazurechi.vec)
a0 = mean(hazurechi.vec)
g0 = geoMean(hazurechi.vec)
h0 = harmMean(hazurechi.vec)

hazurechi.vec = c(hazurechi.vec, 10)
hist(hazurechi.vec)

a1 = mean(hazurechi.vec)
g1 = geoMean(hazurechi.vec)
h1 = harmMean(hazurechi.vec)
