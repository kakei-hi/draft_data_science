# 棒グラフ

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

par(family = "HiraKakuProN-W3")                     # plot() で日本語 on mac
theme_set(theme_grey(base_family = "HiraKakuProN-W3")) # ggplot で日本語

faculty = c(rep("理学部", 206), rep("工学部", 300), rep("法学部", 180), 
            rep("文学部", 182))
career = c(rep("進学", 123), rep("就職", 80), rep("不明", 3),
           rep("進学", 152), rep("就職", 146), rep("不明", 2),
           rep("進学", 26), rep("就職", 147), rep("不明", 7),
           rep("進学", 15), rep("就職", 154), rep("不明", 13))

data.frame(faculty = faculty, career = career) %>% write_csv("career.csv")

career.df = read_csv("career.csv") %>%
  group_by(faculty) %>%
  select(career) %>%
  table() %>%
  as.data.frame()


# x軸並べ替え 
# career.df %>% 
#   transform(faculty = factor(faculty, levels = c("理学部", "工学部", "法学部", "文学部"))) %>%
#   ggplot(aes(x = faculty, y = Freq, fill = career)) +
#   geom_bar(stat = "identity", position = "dodge")

quartz(file = "barChart.pdf", type = "pdf", width = 6, height = 5)

# 積み上げグラフ
career.df %>% 
  ggplot(aes(x = faculty, y = Freq, fill = career)) +
  geom_bar(stat = "identity", alpha = 0.5) +
  scale_fill_manual(values = c("#FF00FF", "#00FF77", "#00C7FF")) -> g
plot(g)

# 積み上げグラフ x軸，積み上げ順並べ替え 
career.df %>% 
  transform(faculty = factor(faculty, levels = c("理学部", "工学部", "法学部", "文学部"))) %>%
  transform(career = factor(career, levels = c("不明", "就職", "進学"))) %>%
  ggplot(aes(x = faculty, y = Freq, fill = career)) +
  geom_bar(stat = "identity", alpha = 0.5) + 
  scale_fill_manual(values = c("#00C7FF", "#FF00FF", "#00FF77")) -> g
#  scale_x_discrete(limits = c("理学部", "工学部", "法学部", "文学部"))  -> g
plot(g)

# 積み上げグラフ 割合 
# position = "fill": 棒を積み重ね，各棒の高さを揃える ← 相対的な割合
career.df %>% 
  transform(faculty = factor(faculty, levels = c("理学部", "工学部", "法学部", "文学部"))) %>%
  transform(career = factor(career, levels = c("不明", "就職", "進学"))) %>%
  ggplot(aes(x = faculty, y = Freq, fill = career)) +
  geom_bar(stat = "identity", position = "fill", alpha = 0.5) + 
  scale_fill_manual(values = c("#00C7FF", "#FF00FF", "#00FF77")) +
  scale_y_continuous(labels = percent) -> g
plot(g)

dev.off()

# # 集合グラフ 
# career.df %>% 
#   ggplot(aes(x = faculty, y = Freq, fill = career)) +
#   geom_bar(stat = "identity", position = "dodge", alpha = 0.5) + 
#   scale_x_discrete(limits = c("理学部", "工学部", "法学部", "文学部"))

