---
title: "READ.ME"
author: "chen pengfei"
date: "6/23/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R Markdown

Suppose we have the "UCI HAR Dataset" and the sub dir at the project path.

read file ,rename colnames ,merge labels and subject of each row,merge train and test data;
then group by the whole data by activity and subject,at last summarise_all data with mean function.

```{r cars}
summary(cars)
```

## Including Plots

You can also embed plots, for example:

```{r pressure, echo=FALSE}
plot(pressure)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
