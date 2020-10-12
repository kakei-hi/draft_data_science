# 共分散 相関係数

cm = c(116.5,  122.6, 128.1, 133.5, 139.0, 145.2)
inch = cm * 0.39370
m = cm / 100

height.df = data.frame(age = 6:11, cm = cm, inch = inch, m = m)
n = nrow(height.df)

m_age = mean(height.df$age)
m_cm = mean(height.df$cm)
m_inch = mean(height.df$inch)

# 共分散
d_age = (height.df$age - m_age)
d_cm = (height.df$cm - m_cm)
d_inch = (height.df$inch - m_inch)

s_xy_cm = sum(d_age * d_cm) / n
s_xy_inch = sum(d_age * d_inch) / n

# 相関係数
cor(height.df$age, height.df$cm)
cor(height.df$age, height.df$inch)
cor(height.df$age, height.df$m)

# 標準偏差
d2_age = d_age * d_age
var_age = sum(d2_age) / n
s_age = sqrt(var_age)

d2_cm = d_cm * d_cm
var_cm = sum(d2_cm) / n
s_cm = sqrt(var_cm)

d2_inch = d_inch * d_inch
var_inch = sum(d2_inch) / n
s_inch = sqrt(var_inch)

s_age = sqrt((n - 1) / n) * sd(height.df$age)
s_cm = sqrt((n - 1) / n) * sd(height.df$cm)
s_inch = sqrt((n - 1) / n) * sd(height.df$inch)

r_cm = s_xy_cm / (s_age * s_cm)
r_inch = s_xy_inch / (s_age * s_inch)
