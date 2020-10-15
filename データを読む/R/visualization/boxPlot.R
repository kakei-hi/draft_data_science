# 箱ひげ図

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

# 説明用箱ひげ図
y.exp =rnorm(n = 100)
y.exp = c(y.exp, rnorm(n = 5, mean = 2, sd = 1))
explain.df = tibble(y.exp)

# 貯蓄データ
read_csv("../mean/amountSaving.csv") %>% 
  pull(amount_of_saving) ->
  skew
read_csv("../mean/symDist.csv") %>%
  pull(amount_of_saving) ->
  sym
# data.frame(skew = skew.df$amount_of_saving, 
#            sym = sym.df$amount_of_saving) %>%
#   rename("偏りのある分布" = skew) %>%
#   rename("対称な分布" = sym) %>%
#   pivot_longer(cols = c('偏りのある分布', '対称な分布'), names_to = "dist", 
#                values_to = "val") ->
#   saving.df

# 分散の違い
mu = 4000
sig0 = (4000 - 2700) / 4
sig1 = sig0 * 3
n= length(skew)
v_small = rnorm(n = n, mean = mu, sd = sig0)
v_large = rnorm(n = n, mean = mu, sd = sig1)

tibble(skew, sym, v_small, v_large) %>%
  rename("偏りのある分布" = skew) %>%
  rename("対称な分布" = sym) %>%
  rename("分散の小さい分布" = v_small) %>%
  rename("分散の大きい分布" = v_large) %>%
  pivot_longer(cols = c('偏りのある分布', 
                        '対称な分布', 
                        "分散の小さい分布",
                        "分散の大きい分布"),
               names_to = "dist", 
               values_to = "val") ->
  dist.df
  
# tibble(var_small.vec,  var_larg.vec) %>%
#   rename("分散の小さい分布" = var_small.vec) %>%
#   rename("分散の大きい分布" = var_larg.vec) %>%
#   pivot_longer(cols = c("分散の小さい分布", "分散の大きい分布"),
#                names_to = "dist", values_to = "val") ->
#   var_diff.df
# 
# data.frame(skew = skew.df$amount_of_saving, 
#            sym = sym.df$amount_of_saving) %>%
#   rename("偏りのある分布" = skew) %>%
#   rename("対称な分布" = sym) %>%
#   pivot_longer(cols = c('偏りのある分布', '対称な分布'), names_to = "dist", 
#                values_to = "val") ->
#   saving.df

quartz(file = "boxplot.pdf", type = "pdf", width = 7, height = 7)

ggplot(data = explain.df) +
  geom_boxplot(aes(x = "", y = y.exp), width = 0.5) + 
  theme(axis.title = element_blank(),
        axis.text = element_blank(),
        axis.ticks = element_blank(),
        panel.grid.major= element_blank())

ggplot(data = dist.df, aes(x = dist, y = val, fill = dist)) +
  geom_boxplot(width = 0.5, alpha = 0.5) + 
  scale_fill_manual(values = c("#00FF77", "#FF00FF", "#00C7FF", "#FFFF00")) +
  scale_x_discrete(limits = c("偏りのある分布", "対称な分布", 
                              "分散の小さい分布", "分散の大きい分布")) + 
  guides(fill = FALSE) +
  theme(axis.title = element_blank(),
        axis.ticks = element_blank(),
        panel.grid.major = element_blank())

# ggplot(data = saving.df, aes(x = dist, y = val, fill = dist)) +
#   geom_boxplot(alpha = 0.5) + 
#   scale_fill_manual(values = c("#00FF77", "#FF00FF")) +
#   scale_x_discrete(limits = c("偏りのある分布", "対称な分布")) + 
#   guides(fill = FALSE) +
#   theme(axis.title = element_blank(),
#         axis.ticks = element_blank(),
#         panel.grid.major = element_blank())
# 
# ggplot(data = var_diff.df, aes(x = dist, y = val, fill = dist)) +
#   geom_boxplot(alpha = 0.5) + 
#   scale_fill_manual(values = c("#00C7FF", "#FFFF00")) +
#   scale_x_discrete(limits = c("分散の小さい分布", "分散の大きい分布")) + 
#   guides(fill = FALSE) +
#   theme(axis.title = element_blank(),
#         axis.ticks = element_blank(),
#         panel.grid.major = element_blank())

dev.off()

