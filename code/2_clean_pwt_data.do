// open PWT national accounts data
cd ..
use "data\raw\pwt\pwt100.dta", replace

// keep only 6 interesting variables
keep countrycode country year rgdpo pop csh_i

// generate investment (gross capital formation) in millions USD in PPP
generate investment = rgdpo*csh_i

// generate GDP per capita in PPP in constant prices of 2017
generate gdp_pc = rgdpo/pop

// label variable gdp_pc
label variable gdp_pc "GDP per capita in PPP in constant prices of 2017"

// generate gross capital formation per capita in PPP in constant prices of 2017
generate investment_pc = investment/pop

// label variable investment_pc
label variable investment_pc "Gross capital formation per capita in PPP in constant prices of 2017"

// keep only 4 variables to be used in matching and regression
keep country year gdp_pc investment_pc

// save .dta file with 9 variables
save "data\derived\income.dta", replace