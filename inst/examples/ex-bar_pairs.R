rawdata <- data.frame(
  num_left = iris$Sepal.Length[iris$Species == 'setosa'][1:15],
  num_right = iris$Sepal.Length[iris$Species == 'versicolor'][1:15],
  labs = paste('id', 1:15,sep = '-')
)
fig_pairsbar(rawdata, labelspan.num = 0.5, labelspan.lab = 0.8)

fig_pairsbar(rawdata, labelspan.num = 0.5, labelspan.lab = 0.8, ishorizontal = F)

fig_pairsbar(rawdata, labelspan.num = 0.5, labelspan.lab = 0.8, ishorizontal = F,
             bar.width = 0.7)
