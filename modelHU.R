# library imports
library(xtable)

# Import csv
dataHu <- read.csv(file.choose(), header = TRUE, sep = ';')

# Create new variables for analysis 
# Kvartal can be splitted inside of excel
# Dummy variables for this purpose: before and after 2009
dataHu['crysis'] <- ifelse(dataHu$TIME.NA_ITEM < 2009, 0, 1)

# Create per capita data 
# 9.798 million (2017) In Hungary
# less milion
people <- 9.798 
dataHu$Gross.domestic.product.at.market.prices / people
dataHu$Final.consumption.expenditure / people
dataHu$Household.and.NPISH.final.consumption.expenditure / people
dataHu$Taxes.on.production.and.imports.less.subsidies / people
dataHu$Wages.and.salaries / people
dataHu$Compensation.of.employees / people

# Inital Plots if something is wrong
plot(dataHu$Gross.domestic.product.at.market.prices ~ dataHu$TIME.NA_ITEM ,
     main = "Gross Domestic Product per Capita Hungary",
     ylab = "Gross Domestic Product per Capita",
     xlab = "Date")

plot(dataHu$Final.consumption.expenditure.of.households ~ dataSk$TIME.NA_ITEM ,
     main = "Household expenditure per Capita Hungary",
     ylab = "Household expenditure",
     xlab = "Date")

# Create linear model. Iterate on multiple variables.
modelHu <- lm(dataHu$Final.consumption.expenditure.of.households ~  
                dataHu$Taxes.on.production.and.imports.less.subsidies +
                dataHu$Taxes.on.production.and.imports.less.subsidies + 
                as.factor(dataHu$crysis) + 
                as.factor(dataHu$kvartal) )

# Model Summary
summary(modelHu)

# Vytvor tabulku
print(xtable(summary(modelHu), type = "latex"), file = "lmHungary.tex")

# Get this shit done !!!!! Forever

