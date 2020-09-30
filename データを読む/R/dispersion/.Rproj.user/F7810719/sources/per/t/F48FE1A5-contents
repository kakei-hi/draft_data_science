# 範囲と外れ値

pckg = "tidyverse"
if(!require(pckg, character.only = TRUE)){
  install.packages(pckg, type = "source")
  if (!require(pckg, character.only = TRUE)){
    str = paste0("could not install ", pckg)
    stop(str)
  }
}


data0 = c(55, 56, 57, 58, 59, 60)
data1 = c(data0, 10)

sig0 = sd(data0)
sig1 = sd(data1)
r0 = range(data0)
r1 = range(data1)

sig0
sig1
r0
r1