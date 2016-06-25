akw <- readRDS("akw.RDS")
head(akw, 30)

cols <- RColorBrewer::brewer.pal(6, "Purples")[4:6][factor(cut(akw$chia, c(0, 50, 100,Inf)))]

## you can do it with
## require(wordcloudrr) or library(wordcloudrr)
## but you can also do it with the namespace operator ::

wordcloudrr::wordcloudrr(akw$term, akw$chia, cols = cols, width = 1500, height = 1000, shape = "star")

require(wordcloudrr)
?wordcloudrr
