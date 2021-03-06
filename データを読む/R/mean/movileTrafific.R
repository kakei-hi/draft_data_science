# 【我が国の移動通信トラヒックの現状】

traffic.vec = c(9.9, 23.4, 44.2, 80.0, 123.3, 184.5, 249.0, 335.9, 404.6, 442.3)
ratio_traffic.vec = array(dim = 0)

times = length(traffic.vec) - 1
for (i in 1: times) {
  ratio_traffic.vec[i] = traffic.vec[i + 1] / traffic.vec[i]
}

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

(ratio_traffic.vec = round(ratio_traffic.vec, 2))
(g = geoMean(ratio_traffic.vec))
(9.9 * g^(times))

(a = mean(ratio_traffic.vec))
(9.9 * a^(times))

(h = harmMean(traffic.vec))
(9.9 * h^(times))

