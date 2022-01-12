// open main dataset - happiness_income data
cd ..
use "data\final\happiness_income.dta" 

// do a simple regression of happines on ln of income
regress happiness ln_gdp_pc, robust

// export simple OLS regression table
cd results\tables
outreg2 using OLS_regression

// 1st stage regression
regress ln_gdp_pc ln_investment_pc, robust

// export 1st stage regression table
outreg2 using 1st_stage_regression

// 2nd stage IV 2SLS regression
ivregress 2sls happiness (ln_gdp_pc = ln_investment_pc), vce(robust)

// export IV regression table
outreg2 using IV_regression

// create scatter plot of happiness and income
scatter happiness ln_gdp_pc

// export scatter plot of happiness and income
cd ..
cd figures
graph export scatter_happiness_income.pdf

// create scatter plot of income and investment
scatter ln_gdp_pc ln_investment_pc

// export scatter plot of income and investment
graph export scatter_income_investment.pdf