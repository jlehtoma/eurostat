---
title: "eurostat R package"
author: Leo Lahti, Janne Huovari, Markus Kainu, Przemyslaw Biecek
date: "2015-11-25"
bibliography: 
- references.bib
output: 
  md_document:
    variant: markdown_github
---
<!--
%\VignetteEngine{knitr::rmarkdown}
%\VignetteIndexEntry{eurostat Markdown Vignette}
%\usepackage[utf8]{inputenc}
-->



Installing the CRAN release version:


```r
install.packages("eurostat")
```

Installing the Github development version:


```r
library(devtools)
install_github("ropengov/eurostat")
```


```r
library(eurostat)
income <- search_eurostat("disposable income", type = "dataset")
```


```r
dat <- get_eurostat(id = "tsdtr210", time_format = "num")
```


```r
print(xtable(head(dat), caption = "This is a table.", label = "tab:getdatatable"))
```

```
## % latex table generated in R 3.2.2 by xtable 1.8-0 package
## % Wed Nov 25 23:57:37 2015
## \begin{table}[ht]
## \centering
## \begin{tabular}{rlllrr}
##   \hline
##  & unit & vehicle & geo & time & values \\ 
##   \hline
## 1 & PC & BUS\_TOT & AT & 1990.00 & 11.00 \\ 
##   2 & PC & BUS\_TOT & BE & 1990.00 & 10.60 \\ 
##   3 & PC & BUS\_TOT & BG & 1990.00 &  \\ 
##   4 & PC & BUS\_TOT & CH & 1990.00 & 3.70 \\ 
##   5 & PC & BUS\_TOT & CY & 1990.00 &  \\ 
##   6 & PC & BUS\_TOT & CZ & 1990.00 &  \\ 
##    \hline
## \end{tabular}
## \caption{This is a table.} 
## \label{tab:getdatatable}
## \end{table}
```


![plot of chunk 2015-manu-mapexample](./2015-manu-mapexample-1.pdf) 


```r
## ----2015-manu-searchdata, echo=TRUE, warning=FALSE, error=FALSE, eval=TRUE, fig.width=7, fig.height=7, dpi=300, cache=TRUE, fig.show='asis'----
id <- search_eurostat("Modal split of passenger transport", 
        	             type = "table")$code[1]

dat <- get_eurostat(id, time_format = "num")

# Triangle plot on passenger transport distributions with 2012 data for
# all countries with data 
transports <- tidyr::spread(subset(dat, time == 2012,
	   select = c(geo, vehicle, values)), vehicle, values)

# triangle plot
plotrix::triax.plot(na.omit(transports)[, -1], show.grid = TRUE, 
           label.points = TRUE, point.labels = transports$geo, 
           pch = 19)
```

![plot of chunk 2015-manu-search2](./2015-manu-search2-1.png) 


```r
library(eurostat)
data(efta_countries)
print(xtable(efta_countries))
```

```
## % latex table generated in R 3.2.2 by xtable 1.8-0 package
## % Wed Nov 25 23:58:05 2015
## \begin{table}[ht]
## \centering
## \begin{tabular}{rll}
##   \hline
##  & code & name \\ 
##   \hline
## 1 & IS & Iceland \\ 
##   2 & LI & Liechtenstein \\ 
##   3 & NO & Norway \\ 
##   4 & CH & Switzerland \\ 
##    \hline
## \end{tabular}
## \end{table}
```


```r
t1 <- get_eurostat("tsdtr420") %>%
  dplyr::filter(geo %in% c("UK", "SK", "FR", "PL", "ES", "PT", "LV"))
t1$Country <- t1$geo
ggplot(t1, aes(x = time, y = values, color=Country, group=Country, shape=Country)) +
  geom_point(size=4) + 
  geom_line() + theme_bw() + ggtitle("People killed in road accidents")+
  xlab("Year") + ylab("Number of killed people") + theme(legend.position="top")
```

```
## Warning: The shape palette can deal with a maximum of 6 discrete values
## because more than 6 becomes difficult to discriminate; you have 7.
## Consider specifying shapes manually if you must have them.
```

```
## Warning: The shape palette can deal with a maximum of 6 discrete values
## because more than 6 becomes difficult to discriminate; you have 7.
## Consider specifying shapes manually if you must have them.
```

```
## Warning: Removed 25 rows containing missing values (geom_point).
```

```
## Warning: Removed 10 rows containing missing values (geom_path).
```

```
## Warning: The shape palette can deal with a maximum of 6 discrete values
## because more than 6 becomes difficult to discriminate; you have 7.
## Consider specifying shapes manually if you must have them.
```

![plot of chunk 2015-manu-roadacc](./2015-manu-roadacc-1.png) 



```r
library(dplyr)
tmp1 <- get_eurostat("hlth_ehis_de1", time_format = "raw")
tmp1 %>%
  dplyr::filter( isced97 == "TOTAL" ,
          sex != "T",
          age != "TOTAL", geo == "PL") %>%
  mutate(BMI = factor(bmi, 
                      levels=c("LT18P5","18P5-25","25-30","GE30"), 
                      labels=c("<18.5", "18.5-25", "25-30",">30"))) %>%
  arrange(BMI) %>%
  ggplot(aes(y=values, x=age, fill=BMI)) +
  geom_bar(stat="identity") +
  facet_wrap(~sex) + coord_flip() +
  theme(legend.position="top") + ggtitle("Body mass index (BMI) by sex and age")+xlab("% of population")+scale_fill_brewer(type = "div")
```

![plot of chunk 2015-manu-bmi](./2015-manu-bmi-1.png) 
