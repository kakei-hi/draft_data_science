# 月平均気温（東京）

 # http://www.data.jma.go.jp/gmd/risk/obsdl/

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

read_csv("temp_tokyo.csv", skip = 3) %>%
  select("年月", "平均気温(℃)") %>%
  rename(date = "年月", temp = "平均気温(℃)") %>%
  drop_na(temp) -> temp0.df

# 年月yyyy/mmを年月日yyyy/mm/1に変換
# x = gsub("([0-9]+)/([0-9]+)", "\\1/\\2/1", temp0.df$date)

temp0.df$date = as.Date(gsub("([0-9]+)/([0-9]+)", "\\1/\\2/1", temp0.df$date))

temp0.df %>%
  filter(date >= as.Date("1900/1/1")) %>%
  ggplot() +
  geom_line(aes(x = date, y = temp))

