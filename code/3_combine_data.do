// open happiness data file
cd ..
use "data\derived\happiness.dta", replace

// combine 2 datasets - happiness dataset and income dataset
cd "data\derived"
merge 1:1 country year using income.dta

// generate ln of gdp_pc and ln of investment_pc
foreach x in gdp_pc investment_pc {
    generate ln_`x' = ln(`x')
}

// label ln of gdp_pc
label variable ln_gdp_pc "ln of gdp_pc"

// label ln of investment_pc
label variable ln_investment_pc "ln of investment_pc"

cd ..
cd ..
// save final dataset
save "data\final\happiness_income.dta", replace