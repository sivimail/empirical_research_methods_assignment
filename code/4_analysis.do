// open main dataset - happiness_income data
cd ..
use "data\final\happiness_income.dta" 

// 2nd stage IV 2SLS regression
ivregress 2sls happiness (ln_gdp_pc = ln_investment_pc), vce(robust)

// export IV regression table
cd results\tables
outreg2 using IV_regression
