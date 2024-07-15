# Statistical_analysis_R

## Research Scenario and Research Questions

### Research Scenario:

In research paper, the Silvana and team had sought to develop a diagnostic test to detect the most common type of pancreatic cancer based on the biomarkers from different group of individuals.
The key features are four urinary biomarkers: creatinine, LYVE1, REG1B, and TFF1.
• Creatinine is a protein that is often used as an indicator of kidney function.
• LYVE1 is lymphatic vessel endothelial hyaluronan receptor 1, a protein that may play a role in tumor metastasis
• REG1B is a protein that may be associated with pancreas regeneration.
• TFF1 is trefoil factor 1, which may be related to regeneration and repair of the urinary tract.

The goal of this experiment is to predict the presence of pancreatic cancer before it is clinically diagnosed. It is an attempt to be able to detect the pancreatic cancer based on the presence and value of biomarkers in urine samples and then follow the clinical diagnostic methods to confirm the onset of disease at much earlier stages of its development.

### Research Questions:
1. To Examine whether there is linear relationship between age of the patients and the biomarkers – REG1B, LYVE1 and TFF1.
2. To investigate whether the different categories of diagnosis, i.e., 1 = control (no pancreatic disease), 2 = benign hepatobiliary disease (119 of which are chronic pancreatitis); 3 = pancreatic cancer, are not due to age differences.


## Dataset Overview

This dataset consists of 590 observations and 14 attributes. Below are the variables that will be used for investigating the research questions are as below:

![image](https://github.com/user-attachments/assets/61584aa7-0e38-4941-a40f-ce9fc7c16211)

The below histogram shows the presence of outliers in the dataset. Majority of outliers are found in the variable – creatinine, REG1B and TFF1. The mean and minimum value is also the same for the variables – TFF1 and REG1B.

![image](https://github.com/user-attachments/assets/5084dc32-7260-42c6-ae0e-890ec35fd313)

The below histogram shows the distribution of the 4 feature variables – creatinine, LYVE1, REG1B, TFF1. It is observed that the distribution is skewed towards right.

![image](https://github.com/user-attachments/assets/eb10baeb-4407-4346-bfcb-8775f8ba15a7)

![image](https://github.com/user-attachments/assets/e32cc35b-24e4-48aa-b40f-c71c33bacf99)

The above pie chart shows the composition of male and female in the study. The percent of male and female is same for the study.
Below, the distribution of age for male and female. It is observed that the age distribution of both male and female is normally distributed.

![image](https://github.com/user-attachments/assets/a307b77d-aae6-470b-9d32-63e416c05ee0)


## Statistical methods used

1. Multiple Linear Regression
• To examine whether there is linear relationship between age of the patients and the biomarkers - REG1B, LYVE1 and TFF1, multiple regression analysis was performed. Initially, linearity was checked by plotting the scatterplots and finding the correlation coefficients.
• Then, multiple linear regression model was fit for each biomarker with age.
• Then, the model assumptions were checked including – normality, constant variance and linearity. This was done by examining the residuals of the model.
• To check the linearity, r-squared value and F-statistic was calculated and p-value is determined with alpha as 0.05
• Hypothesis for F-test –
𝑯𝟎: 𝜷𝟏 = 𝜷𝟐 = ⋯ = 𝜷𝒌 = 0
𝑯𝟏: 𝜷𝒊 ≠ 𝟎 for at least one i


2. ANOVA
• ANOVA (analysis of variance) was used to investigate whether the different categories of diagnosis (control, benign hepatobiliary disease, pancreatic cancer) are not due to age differences.
• Checked that the age data for each diagnosis category are normally distributed and have equal variances by plotting histogram and boxplots.
• Conducted an ANOVA with diagnosis as the independent variable and age as the dependent variable.
• The null hypothesis is that there is no difference in age across diagnosis categories. The alternative hypothesis is that there is a difference.
𝐻0: 𝜇1 = 𝜇2 = 𝜇3 . 𝐻1: 𝜇𝑖 ≠ 𝜇𝑗 for some 𝑖 and 𝑗. 𝛼 = 0.05
𝐹 = 𝑀𝑆𝐵/ 𝑀𝑆𝑊 with 𝑘 − 1 = 2 and 𝑛 − 𝑘 = 590 − 3 = 587 degrees of freedom
• F-distribution with 2, 587 degrees of freedom and associated with 𝛼 = 0.05. Decision Rule: Reject 𝐻0 if 𝐹 ≥ 3.01
• If the p-value is less than the chosen significance level (usually 0.05), then you reject the null hypothesis and conclude that there is a difference in age across diagnosis categories.


## Results and Discussion

1. Multiple Linear Regression

   ![image](https://github.com/user-attachments/assets/f11cc95f-07ca-41c8-9549-018279726326)


   correlation table:

   ![image](https://github.com/user-attachments/assets/dc186375-cd9c-499d-b370-07c6dd2cb67d)


   As per above correlation coefficients, there is no significant correlation between age and the biomarkers.
Fitting the model:
Upon fitting the model, below is the equation for MLR:
Y = 55.184 + 1.174 * LYVE1 + 0.002 * REG1B + 0.0001 * TFF1
Assessing model assumption by plotting residuals:

![image](https://github.com/user-attachments/assets/bf8a7210-5b38-4c60-9137-a168275183a6)

The above residual plot shows random scattering of points indicating that there is linear relation between the biomarkers. Although, there is no same amount of scattering in the residual plots, hence, there is no constant variance. The histogram of residuals is normally distributed as observed from the above histogram.

Calculating multiple R-squared:
Multiple R-squared: 0.1097

Decision rule for F-test: F-distribution with 3, 586 degrees of freedom and associated with 𝛼 = 0.05
Decision Rule: Reject 𝐻0 if F ≥ 2.62; Otherwise, do not reject 𝐻0

Result:
![image](https://github.com/user-attachments/assets/3f530be4-2135-4b41-b1df-69acd278eafe)

F-statistic is 24.07. Hence, reject the null hypothesis. We have significant evidence at the 𝛼 = 0.05 level that 𝛽LYVE1 ≠ 0 𝑎𝑛𝑑/𝑜𝑟 𝛽TFF1 ≠ 0 𝑎𝑛𝑑/𝑜𝑟 𝛽REG1B ≠ 0
Here, 𝑝 < 0.05
There is evidence of a linear association between annual age and biomarkers – LYVE1 and/or REG1B and/or TFF1

Confidence interval at alpha=0.05 is calculated and it is as below.
Confidence interval at alpha =0.05:
![image](https://github.com/user-attachments/assets/87cf0531-3eec-45a5-ae2a-d3fd83fd2d1c)

Only the biomarker LYVE1 has confidence interval that cannot be rejected, the remaining value for other 2 biomarkers do not show any association with the variable age.


2. ANOVA

   ![image](https://github.com/user-attachments/assets/e31007b4-ea4a-4716-8f27-042c0786c724)

The below boxplot shows the distribution of 3 diagnosis categories across age. There are few outliers for category 1 and 3.

   ![image](https://github.com/user-attachments/assets/3ff312f4-8eb3-4a26-a12b-27e66d5bea75)

Result:
The F-statistic was calculated to be 61.74 which is greater than 3.01.
We have significant evidence at the 𝛼 = 0.05 that there is a difference in age across diagnosis categories - control, benign hepatobiliary disease, pancreatic cancer.


## Conclusion
1. There is linear relation between the biomarker LYVE1 with age, i.e, with increase in age there increase in the presence of biomarker by 1.174 time per 1 year increase in age. The remaining 2 biomarkers are not linearly correlated with age and show no association.
2. Upon performing ANOVA it can be concluded that among the 3 categories mentioned in the column diagnosis – 1=control, 2=benign hepatobiliary disease, 3=pancreatic cancer, there is proof of the presence of different age groups across these categories.


## Limitations
1. Lot of data was missing in the original dataset which may have had influence in the investigation.
2. The presence of outliers in the dataset may have also influenced the result of the investigation.
3. The assumptions made in the investigation may not be satisfactory and additional tests like pair wise comparisons might be needed to further investigate the relevance of the research questions.
