// import Gallup data of subjective happiness ranking
cd ..
import excel "data\raw\gallup\DataPanelWHR2021C2.xls", firstrow

// keep only 3 interesting variables
keep Countryname year LifeLadder

// rename variable
rename Countryname country

// rename variable
rename LifeLadder happiness

// relabel variable happiness_score
label variable happiness "Happiness score"

// save .dta file with 3 variables
save "data\derived\happiness.dta", replace