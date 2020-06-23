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

## What did the run_analysis.R do?

1. read file from train,test dir with x,y,subject.
2. read the features name and activity labels handle the duplicate feature names and the activity labes join whih activity numbers.
3. rename colnames ,merge labels and subject of each row.
4. merge train and test data;
5. group by the whole data by activity and subject,at last summarise_all data with mean function.


