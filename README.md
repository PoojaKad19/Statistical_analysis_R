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
