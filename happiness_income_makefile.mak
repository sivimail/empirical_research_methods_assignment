STATA = StataMP-64 -b do

results/tables/IV_regression.txt: code/4_analysis.do data/final/happiness_income.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@

data/final/happiness_income.dta: code/3_combine_data.do data/derived/happiness.dta data/derived/income.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@

data/derived/income.dta: code/2_clean_pwt_data.do data/raw/pwt/pwt100.dta
	mkdir -p $(dir $@)
	$(STATA) $^ $@
data/derived/happiness.dta: code/1_import_and_clean_gallup_data.do data/raw/gallup/DataPanelWHR2021C2.xls
	mkdir -p $(dir $@)
	$(STATA) $^ $@

data/raw/pwt/pwt100.dta: 
	mkdir -p $(dir $@)
	curl -Lo $@ "https://www.rug.nl/ggdc/docs/pwt100.dta"
data/raw/gallup/DataPanelWHR2021C2.xls: 
	mkdir -p $(dir $@)
	curl -Lo $@ "https://happiness-report.s3.amazonaws.com/2021/DataPanelWHR2021C2.xls"

install:
	StataMP-64 -b ssc install outreg2