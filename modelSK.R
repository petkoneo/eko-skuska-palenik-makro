# library imports
library(xtable)


# Import csv
dataSk <- read.csv(file.choose(), header = TRUE, sep = ';')

# Create new variables for analysis 
# Kvartal can be splitted inside of excel
# Dummy variables for this purpose: before and after 2009
dataSk['crysis'] <- ifelse(dataSk$TIME.NA_ITEM < 2009, 0, 1)

# Create per capita data 
# 5.435 million people in SLOVAAAKIIAAA
# less milion
people <- 5.435
dataSk$Gross.domestic.product.at.market.prices / people
dataSk$Final.consumption.expenditure / people
dataSk$Household.and.NPISH.final.consumption.expenditure / people
dataSk$Taxes.on.production.and.imports.less.subsidies / people
dataSk$Wages.and.salaries / people
dataSk$Compensation.of.employees / people
dataSk$Final.consumption.expenditure.of.households / people

# Inital Plots if something is wrong
plot(dataSk$Gross.domestic.product.at.market.prices ~ dataSk$TIME.NA_ITEM ,
     main = "Household expenditure per Capita Slovakia",
     ylab = "Gross Domestic Product per Capita",
     xlab = "Date")

plot(dataSk$Final.consumption.expenditure.of.households ~ dataSk$TIME.NA_ITEM ,
     main = "Household expenditure per Capita Slovakia",
     ylab = "Household expenditure",
     xlab = "Date")

# Create linear model. Iterate on multiple variables.
modelSk <- lm(dataSk$Final.consumption.expenditure.of.households ~  
     dataSk$Taxes.on.production.and.imports.less.subsidies +
     dataSk$Taxes.on.production.and.imports.less.subsidies + 
     as.factor(dataSk$crysis) + 
     as.factor(dataSk$kvartal) )

# Model Summary
summary(modelSk)

# Vytvor tabulku
print(xtable(summary(modelSk), type = "latex"), file = "lmSlovakia.tex")

# Get this shit done !!!!! Forever
