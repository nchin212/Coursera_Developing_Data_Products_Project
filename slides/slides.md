Coursera Developing Data Products Project
========================================================
author: Nicholas Chin Wei Lun
date: 20 October, 2020
autosize: true

Overview
========================================================
This application aims to predict housing prices using number of rooms. It contains 2 tabs: 

**Main** - The application itself

**Description** - A short description on what the application does and how to use it

Move the slider in the application to select a certain number of rooms and the application will use the models to predict the housing price for that particular value. The predicted housing price for the different models will be printed.

Layout
========================================================

<div align="center">
<img src="housing.png" width=1500 height=650>
</div>

Data
========================================================
The data is taken from the Boston housing dataset from the MASS package. The average number of rooms, 'rm' will be used to predict housing prices, 'medv'.


```r
library(MASS)
head(Boston[,c(6,14)])
```

```
     rm medv
1 6.575 24.0
2 6.421 21.6
3 7.185 34.7
4 6.998 33.4
5 7.147 36.2
6 6.430 28.7
```

Models
========================================================

The following regression models were used to fit the data:

**Model1** - medv ~ rm

**Model2** - medv ~ poly(rm,2)

**Model3** - medv ~ poly(rm,3)
