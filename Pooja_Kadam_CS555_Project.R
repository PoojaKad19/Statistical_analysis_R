setwd("/Users/kadam/Desktop/CS555/Project")
install.packages(gridExtra)
#-------Data Preparation--------------------------
#uploading the dataset in R
data<-read.csv("/Users/kadam/Desktop/CS555/Project/urinary_biomarkers.csv")
# to view the structure of dataset and the datatypes
str(data)
#check null values are found in the data set
colSums(is.na(data))

#removing the columns that are not necessary in investigation of research questions
data2<-data[,!names(data) %in% c("sample_id", "stage", "benign_sample_diagnosis")]

#repalce the NA values in 2 columns with the column mean
data2$plasma_CA19_9[is.na(data2$plasma_CA19_9)]<-mean(data2$plasma_CA19_9, na.rm = TRUE)
data2$REG1A[is.na(data2$REG1A)]<-mean(data2$REG1A, na.rm = TRUE)

#checking for null values again in the proceesed dataset
colSums(is.na(data2))
#saving the cleaned data file that can be used for analysis
write.csv(data2, "/Users/kadam/Desktop/CS555/Project/urinary_biomarkers_cleaned.csv")
View(data2)

# distribution of 4 feature variables. 
par(mfrow=c(2,2))

boxplot(data2$creatinine,
        main = "creatinine", col = "steelblue")
    
boxplot(data2$LYVE1,
        main = "LYVE1", col = "#E69F00")

boxplot(data2$REG1B,
        main = "REG1B", col = "darkolivegreen3")


boxplot(data2$TFF1,
        main = "TFF1", col = "coral")

par(mfrow=c(1,1))

#histogram of the 4 feature variables
par(mfrow=c(2,2))

hist(data2$creatinine,  
     col="salmon")


hist(data2$LYVE1,  
     col="darkseagreen1")


hist(data2$REG1B,  
     col="cornflowerblue")


hist(data2$TFF1,  
     col="darkgoldenrod1") 

par(mfrow=c(1,1))

#composition of male and female patients in this study

library(ggplot2)


ggplot(data = data2, aes(x = age, group= sex,fill = sex)) +
  geom_histogram()

ggplot(data2, aes(x=sex)) + 
  geom_bar()

c <- table(data2$sex)

pie(c,
    labels = paste0(names(c), ": ", c),
    main = "Composition of male and female patients in this study",
    col = hcl.colors(length(c), "BluYl"))

#--------Multiple linear regression--------------------

data3<- data2[,c("age","LYVE1","REG1B","TFF1")]
cor(data3)
pairs(data3)

#building MLR model
m<-lm(data3$age~data3$LYVE1+data3$REG1B+data3$TFF1)
m

#checking the model assumptions
# model residuals
resid(m)
# same as resid()
residuals(m) 

#plotting the residuals
par(mfrow=c(3,2)) 
plot(fitted(m), resid(m), axes=TRUE, frame.plot=TRUE, xlab='fitted values', ylab='residue')
abline(a=0, b=0)
plot(data3$LYVE1, resid(m), axes=TRUE, frame.plot=TRUE, xlab='LYVE1', ylab='residue')
plot(data3$REG1B, resid(m), axes=TRUE, frame.plot=TRUE, xlab='REG1B', ylab='residue')
plot(data3$TFF1, resid(m), axes=TRUE, frame.plot=TRUE, xlab='TFF1', ylab='residue')
hist(resid(m))
par(mfrow=c(1,1)) 


#manual calculation of r-squared
totalss <- sum((data3$age - mean(data3$age))^2)
regss <- sum((fitted(m) - mean(data3$age))^2)
resiss <- sum((data3$age-fitted(m))^2)
fstatistic <- (regss/2)/(resiss/97)
pvalue <- 1-pf(fstatistic, df1=2, df2=97)
R2 <- regss/totalss
R2
pvalue


# Critical value of F test, alpha=0.05
qf(0.95, df1=3, df2=586)

# Critical value of t test, alpha=0.05
qt(0.975, df=586)

#interpreting the results
summary(m)
#confidece interval
confint(m,level=0.95)

#------------------ANOVA------------------------------------
library(ggplot2)
ggplot(data2, aes(group = diagnosis, y = age, fill = diagnosis)) + 
  geom_boxplot() 


ggplot(data = data2, aes(x = age, group= diagnosis,fill = diagnosis)) +
  geom_histogram()


qf(.95, df1=2, df2=587)

is.factor(data2$diagnosis)
m1<-aov(data2$age~data2$diagnosis, data=data2)
summary(m1)


