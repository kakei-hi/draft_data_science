# 相関係数

# 多変量正規分布
pckg = "mvtnorm"
if(!require(pckg, character.only = TRUE)){
  install.packages(pckg, type = "source")
  if (!require(pckg, character.only = TRUE)){
    str = paste0("could not install ", pckg)
    stop(str)
  }
}

pckg = "tidyverse"
if(!require(pckg, character.only = TRUE)){
  install.packages(pckg, type = "source")
  if (!require(pckg, character.only = TRUE)){
    str = paste0("could not install ", pckg)
    stop(str)
  }
}

# サンプルサイズ
size.n = 50

# 正の相関
mu = c(-0, 0)
sig1 = 1
sig2 = 1
r = 0.9
sig12 = r * sig1 * sig2
val_cov.mat = matrix(c(sig1^2, sig12, sig12, sig2^2), nrow = 2)
v = rmvnorm(n = size.n, mean = mu, sigma = val_cov.mat)
x = v[, 1]
y = v[, 2]

cor(x, y)
g = ggplot(data = NULL, aes(x = x, y = y))
g = g + geom_point()
g = g + theme(axis.title = element_blank(),
              axis.text = element_blank(),
              axis.ticks = element_blank(),
              panel.grid.major = element_blank())
plot(g)

# 負の相関
mu = c(-0, 0)
sig1 = 1
sig2 = 1
r = -0.9
sig12 = r * sig1 * sig2
val_cov.mat = matrix(c(sig1^2, sig12, sig12, sig2^2), nrow = 2)
v = rmvnorm(n = size.n, mean = mu, sigma = val_cov.mat)
x = v[, 1]
y = v[, 2]

cor(x, y)
g = ggplot(data = NULL, aes(x = x, y = y))
g = g + geom_point()
g = g + theme(axis.title = element_blank(),
              axis.text = element_blank(),
              axis.ticks = element_blank(),
              panel.grid.major = element_blank())
plot(g)

# 相関なし
mu = c(-0, 0)
sig1 = 1
sig2 = 1
r = 0.01
sig12 = r * sig1 * sig2
val_cov.mat = matrix(c(sig1^2, sig12, sig12, sig2^2), nrow = 2)
v = rmvnorm(n = size.n, mean = mu, sigma = val_cov.mat)
x = v[, 1]
y = v[, 2]

cor(x, y)
g = ggplot(data = NULL, aes(x = x, y = y))
g = g + geom_point()
g = g + theme(axis.title = element_blank(),
              axis.text = element_blank(),
              axis.ticks = element_blank(),
              panel.grid.major = element_blank())
plot(g)

# 外れ値
x1.outlier = max(x) * 5
y1.outlier = mean(y) + (x1.outlier - mean(x))
x2.outlier = mean(x) - (x1.outlier - mean(x))
y2.outlier = mean(y) - (x1.outlier - mean(x))
# x = c(x, x1.outlier, x2.outlier)
# y = c(y, y1.outlier, y2.outlier)
x = c(x, x1.outlier)
y = c(y, y1.outlier)
cor(x, y)
g = ggplot(data = NULL, aes(x = x, y = y))
g = g + geom_point()
g = g + theme(axis.title = element_blank(),
              axis.text = element_blank(),
              axis.ticks = element_blank(),
              panel.grid.major = element_blank())
plot(g)

# 放物線
x = runif(n = size.n, min = -5, max = 5)
y = x * x + rnorm(n = size.n, mean = 0, sd = 0.75)

cor(x, y)
g = ggplot(data = NULL, aes(x = x, y = y))
g = g + geom_point()
g = g + theme(axis.title = element_blank(),
              axis.text = element_blank(),
              axis.ticks = element_blank(),
              panel.grid.major = element_blank())
plot(g)

