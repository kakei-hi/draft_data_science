# 偏りのある分布

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

## 幾何平均
geoMean = function(x){
  
  # 算術平均と幾何平均の関係を利用
  g = exp(mean(log(x)))
  
  return(g)
  
}

par(family = "HiraKakuProN-W3")                     # plot() で日本語 on mac
theme_set(theme_grey(base_family = "HiraKakuProN-W3")) # ggplot で日本語

## 調和平均
harmMean = function(x){
  
  # 算術平均と調和平均の関係を利用
  h = 1 / mean(1 / x)
  
  return(h)
  
}
# skewed.vec = rexp(n = 1000, 0.05)
# data.frame(val = skewed.vec) %>% write_csv("skewedDist.vec")
# 
# g = ggplot(NULL, aes(x = skewed.vec))
# g = g + geom_histogram(binwidth = 10, fill = "white", colour = "black")
# g = g + xlab("") + ylab("")
# plot(g)
# 
# (A = mean(skewed.vec))
# (G = geoMean(skewed.vec))
# (H = harmMean(skewed.vec))
# max(skewed.vec)

# 貯蓄金額
# https://www.mhlw.go.jp/toukei/saikin/hw/k-tyosa/k-tyosa16/dl/16.pdf
num_of_households = c(14.9, 4.7, 3.5, 7.9, 5.9, 6.3, 3.3, 9.4, 5.8, 8.7, 4.7, 6.3, 8.8)
amount_of_saving = c(0, 25, 75, 150, 250, 350, 450, 600, 850, 1250, 1750, 2500, 5000)
sum(num_of_households * amount_of_saving) / sum(num_of_households)

num_of_households = num_of_households * 10

# 正規分布: [-3σ, 3σ]に99.7%
val_saving.vec = array(dim = 0)
val_saving.vec = rep(0, num_of_households[1])
for (i in 2:length(num_of_households)) {
  sd = (amount_of_saving[i] - amount_of_saving[i - 1]) / 3
  saving = rnorm(n = num_of_households[i], mean = amount_of_saving[i],
                sd = sd)
  val_saving.vec = c(val_saving.vec, saving)
}

data.frame(amount_of_saving = val_saving.vec) %>% 
  write_csv("amountSaving.csv")

(a0 = mean(val_saving.vec))

g = ggplot(NULL, aes(x = val_saving.vec))
g = g + geom_histogram(binwidth = 500, fill = "white", colour = "black")
g = g + geom_vline(xintercept = a0, linetype = "dashed")
g = g + xlab("貯蓄額（万円）") + ylab("世帯数")
plot(g)

quartz(file = "貯蓄額（実態）.pdf", type = "pdf", family = "HiraKaku", width = 5, height = 5,
       pointsize = 10)
print(g)
dev.off()

# 正規分布
sym_mean = (min(val_saving.vec) + max(val_saving.vec)) / 2
sym_sd = sym_mean / 3.5
symDist.vec = rnorm(n = sum(num_of_households),
                    mean = sym_mean,
                    sd = sym_sd)
data.frame(amount_of_saving = symDist.vec) %>% 
  write_csv("symDist.csv")

(a1 = mean(symDist.vec))

g = ggplot(NULL, aes(x = symDist.vec))
g = g + geom_histogram(binwidth = 500, fill = "white", colour = "black")
g = g + geom_vline(xintercept = a1, linetype = "dashed")
g = g + xlab("貯蓄額（万円）") + ylab("世帯数")
plot(g)

quartz(file = "貯蓄額（正規分布）.pdf", type = "pdf", family = "HiraKaku", width = 5, height = 5,
       pointsize = 10)
print(g)
dev.off()
