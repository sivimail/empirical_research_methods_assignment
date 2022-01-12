STATA = stata -b do

data/raw/pwt/pwt100.dta: 
	mkdir -p $(dir $@)
	curl -Lo $@ "https://www.rug.nl/ggdc/docs/pwt100.dta"
data/raw/gallup/DataPanelWHR2021C2.xls: 
	mkdir -p $(dir $@)
	curl -Lo $@ "https://happiness-report.s3.amazonaws.com/2021/DataPanelWHR2021C2.xls"

install:
	stata -b ssc install outreg2