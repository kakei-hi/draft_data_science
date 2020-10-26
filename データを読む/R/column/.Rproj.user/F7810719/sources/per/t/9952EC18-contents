# コラム用

pckg = "tidyverse"
if(!require(pckg, character.only = TRUE)){
  install.packages(pckg, type = "source")
  if (!require(pckg, character.only = TRUE)){
    str = paste0("could not install ", pckg)
    stop(str)
  }
}

pckg = "scales"
if(!require(pckg, character.only = TRUE)){
  install.packages(pckg, type = "source")
  if (!require(pckg, character.only = TRUE)){
    str = paste0("could not install ", pckg)
    stop(str)
  }
}

# for Titanicp, expand.dft
pckg = "vcdExtra"
if(!require(pckg, character.only = TRUE)){
  install.packages(pckg, type = "source")
  if (!require(pckg, character.only = TRUE)){
    str = paste0("could not install ", pckg)
    stop(str)
  }
}

# R データセット
# https://prs.ism.ac.jp/~nakama/Rjp/datasets-manual.pdf
quartz(file = "culumnSample.pdf", type = "pdf", width = 7, height = 7)

# 棒グラフ
Titanicp %>%
  select(pclass, survived) %>%
  table() %>%
  as.data.frame() %>%
  ggplot(aes(x = pclass, y = Freq, fill = survived)) +
  geom_bar(stat = "identity", alpha = 0.75)

Titanicp %>%
  select(pclass, survived) %>%
  table() %>%
  as.data.frame() %>%
  ggplot(aes(x = pclass, y = Freq, fill = survived)) +
  geom_bar(stat = "identity", alpha = 0.75, position = "fill") +
  scale_y_continuous(labels = percent)

# 箱ひげ図
Titanicp %>%
  drop_na(age) %>%
  ggplot(aes(x = pclass, y = age, fill = pclass)) +
  geom_boxplot(alpha = 0.75)

# ヒストグラム
Titanicp %>%
  drop_na(age) %>%
  ggplot(aes(x = age)) +
  geom_histogram(binwidth = 10, fill = "white", colour = "black") +
  facet_grid(pclass ~.)

# 散布図 & 折れ線グラフ
qtr = as.numeric(time(UKgas))
cnsmp = as.numeric(UKgas)

# 散布図
tibble(qtr, cnsmp) %>%
  filter(qtr >= 1970) %>%
  ggplot(aes(x = qtr, y = cnsmp)) +
  geom_point()  

# 折れ線グラフ
tibble(qtr, cnsmp) %>%
  filter(qtr >= 1960) %>%
  ggplot(aes(x = qtr, y = cnsmp)) +
  geom_point() + 
  geom_line()

dev.off()


# https://www.e-stat.go.jp/stat-search/files?page=1&layout=datalist&toukei=00100004&tstat=000001099495&cycle=0&tclass1=000001139466&toukei_kind=7&result_page=1
# 市民の社会貢献に関する実態調査 令和元年度
# 【クロス分析】ボランティア活動について シート"33"
# file = "r-1shimin2.xlsx"

# esoph 
# http://www.okadajp.org/RWiki/?パッケージ+%27datasets%27+の情報

# xtabs(~Type+Treatment, CO2)
expand.dft(occupationalStatus) %>% 
  table() %>%
  as.data.frame() %>%
  ggplot(aes(x = origin, y = Freq, fill = destination)) +
  geom_bar(stat = "identity")

expand.dft(occupationalStatus) %>% 
  table() %>%
  as.data.frame() %>%
  ggplot(aes(x = origin, y = Freq, fill = destination)) +
  geom_bar(stat = "identity", position = "fill") +
  scale_y_continuous(labels = percent)

# 分割表Titanicをデータフレームに変換
expand.dft(Titanic) %>%
  select(Class, Sex) %>%
  table() %>%
  as.data.frame() %>%
  ggplot(aes(x = Class, y = Freq, fill = Sex)) +
  geom_bar(stat = "identity")

expand.dft(Titanic) %>%
  select(Class, Sex) %>%
  table() %>%
  as.data.frame() %>%
  ggplot(aes(x = Class, y = Freq, fill = Sex)) +
  geom_bar(stat = "identity", position = "fill") +
  scale_y_continuous(labels = percent)

pckg = "tidyverse"
install.packages(pckg)
library(pckg)

