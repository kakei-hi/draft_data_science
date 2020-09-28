# 速度の平均
# 調和平均値

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

speed.vec = c(60, 120, 150)

(a = mean(speed.vec))
(t_a = 900 / a)

(h = harmMean(speed.vec))
(t_h = 900 / h)

(g = geoMean(speed.vec))
(t_g = 900 / g)
