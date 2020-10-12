# ヒストグラム
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

# 度数分布表からヒストグラムの作成
# https://qiita.com/ciela/items/4babc1a4567e2ca34811#b#
freq.fun = function(csv, xs = 0, xe = 0) {
  # 与えられた度数分布のCSVからhist関数に与えるベクトルを取得する
  # 引数:
  #   csv: 1カラム目が変数、2カラム目が頻度となるCSVファイル
  #   xs, xe: それぞれ変数の下限と上限（与えなかった場合は変数の最小値と最大値を利用する）
  # 返り値:
  #   変数値が頻度の数だけ繰り返されたベクトル
  d <- csv
  vars <- d[[1]]
  xs <- ifelse(xs == 0, min(vars), xs)
  xe <- ifelse(xe == 0, max(vars), xe)
  d.ext <- d[vars >= xs & vars <= xe, ]
  rep(d.ext[[1]], d.ext[[2]])
}

# 文部科学省「平成21年度全国体力・運動能力，運動週間等調査結果について」
# https://www8.cao.go.jp/youth/whitepaper/h23honpenhtml/html/zuhyo/zu1118.html
raw.df = read_csv("../../hours_of_exercise.csv", skip = 2) %>%
  select(-c("小学生男子", "小学生女子", "中学生女子"))  %>%
  drop_na(everything()) %>%
  rename(freq = "中学生男子") %>%
  rename(hours = "1週間の総運動時間（分）") %>%
  transform(hours = as.numeric(hours)) %>%
  mutate(freq = freq * 10)-> hours.df

freq.vec = freq.fun(hours.df)

hist(freq.vec, breaks = seq(0, 2400, 60))
hist(freq.vec, breaks = seq(0, 2400,  300))
