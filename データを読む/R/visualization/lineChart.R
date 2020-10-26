# 折れ線グラフ

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

covid.raw = read.csv("../../130001_tokyo_covid19_patients.csv", fileEncoding = "UTF-8-BOM")
covid.df = covid.raw %>% select(公表_年月日, 患者_年代) %>%
  rename(date = 公表_年月日, age = 患者_年代) %>%
  mutate(date = as.Date(date)) %>%
  filter(date >= as.Date("2020/3/15") & date <= as.Date("2020/4/15")) %>%
  group_by(date, order_by = age) %>%
  summarise(n = n()) %>%
  rename(age = order_by) %>%
  pivot_wider(id_cols = date, names_from = age, values_from = n) %>%
#  select(-不明, -"'-") %>%
  rename(age10 = "10代", age20 = "20代", age30 = "30代", age40 = "40代", 
         age50 = "50代", age60 = "60代", age70 = "70代", age80 = "80代", 
         age90 = "90代", age_under10 = "10歳未満", age_over100 = "100歳以上",
         age_unkwown = "不明") %>%
  write_csv("temp.csv") # group化したままではrowSumsなどが機能しないので一旦，エクスポート
 
read_csv("temp.csv") %>%
  mutate(total = rowSums(select(., starts_with("age")), na.rm = T)) %>%
  select(date, total)%>%
  ggplot() +
  geom_line(aes(x = date, y = total))

