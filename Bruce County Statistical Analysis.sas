/*
Written by: Joshua Ye
Class: ICS4U1
Summative: Statistical Analysis Summative
Date: May 25, 2020
Purpose: Analysis of data on Bruce County for ICS4U1 SAS summative
*/

*creating the library name for the data;
libname out "/home/u45269187/EPG194/data/summative";

*plotting the pie charts of the age distribution of Bruce County and Ontario in 2011;
*creating a newly formatted data set from the prexisting data for the age distribution graph;
data y2011_bruce;
length region $10.;
set out.age(keep=age_group y2011);
region='Bruce';
run;
data y2011_ont;
length region $10.;
set out.ontario(keep=age_group y2011);
region='Ontario';
run;
*creating a new data set that combines the custom sets above for the age distribution graph;
data combine;
set y2011_bruce y2011_ont;
if age_group='Total population' then delete;
run;
*displaying the side-by-side age distribution chart of Bruce County and Ontario in 2011;
proc gchart data = combine;
	title "Population Distribution of Ages between Bruce County & Ontario in 2011";
	pie  age_group/ group=region sumvar=y2011
	across=2
	clockwise value=none
	percent=arrow slice=none
	noheading
	legend;
run;

*plotting the pie charts of the age distribution of Bruce County and Ontario in 2016;
*creating a newly formatted data set from the prexisting data for the age distribution graph;
data y2016_bruce;
length region $10.;
set out.age(keep=age_group y2016);
region='Bruce';
run;
data y2016_ont;
length region $10.;
set out.ontario(keep=age_group y2016);
region='Ontario';
run;
*creating a new data set that combines the custom sets above for the age distribution graph;
data combine;
set y2016_bruce y2016_ont;
if age_group='Total population' then delete;
run;
*displaying the side-by-side age distribution chart of Bruce County and Ontario in 2016;
proc gchart data = combine;
	title "Population Distribution of Ages between Bruce County & Ontario in 2016";
	pie  age_group/ group=region sumvar=y2016
	across=2
	clockwise value=none
	percent=arrow slice=none
	noheading
	legend;
run;

*plotting the bar chart of the percent change of the age distributions in Bruce County from 2011 to 2016;
proc sgplot data=out.age;
  title "Percent Change of the Age Distributions in Bruce County from 2011 to 2016";
  hbar age_group / response=percent_change dataskin=gloss datalabel nostatlabel;
  xaxis grid display=(nolabel);
  yaxis grid discreteorder=data display=(nolabel);
run;

*plotting the bar chart of the percent change of the age distributions in Ontario from 2011 to 2016;
proc sgplot data=out.ontario;
  title "Percent Change of the Age Distributions in Ontario from 2011 to 2016";
  hbar age_group / response=percent_change dataskin=gloss datalabel nostatlabel;
  xaxis grid display=(nolabel);
  yaxis grid discreteorder=data display=(nolabel);
run;

*plotting the bar chart of the percent change of the number of farms, split by farm sizes, in Bruce County from 2011 to 2016;
proc sgplot data=out.size;
  title "Percent Change of Number of Farms Sorted by Size in Bruce County from 2011 to 2016";
  hbar farm_size / response=percent_change dataskin=gloss datalabel nostatlabel;
  xaxis grid display=(nolabel);
  yaxis grid discreteorder=data display=(nolabel);
run;

*plotting the pie charts of the farm capital value distributions of Bruce County in 2011 and 2016;
*creating a newly formatted data set from the prexisting data for the farm capital value distribution graphs;
data y2011;
set out.value(keep=farm_capital_value y2011);
year=2011;
rename y2011=population;
run;
data y2016;
set out.value(keep=farm_capital_value y2016);
year=2016;
rename y2016=population;
run;
*creating a new data set that combines the custom sets above for the farm capital value distribution graphs;
data combine;
set y2011 y2016;
run;
*displaying the side-by-side farm capital value distribution graphs of Bruce County in 2011 and 2016;
proc gchart data = combine;
	title "Capital Farm Values in Bruce County 2011 & 2016";
	pie  farm_capital_value/ group=year sumvar=population
	across=2
	clockwise value=none
	percent=arrow slice=none
	noheading
	legend;
run;

*plotting the bar chart of the percent change of the farm capital values in Bruce County from 2011 to 2016;
proc sgplot data=out.value;
  title "Percent Change of Capital Farm Values in Bruce County from 2011 to 2016";
  hbar farm_capital_value / response=percent_change dataskin=gloss datalabel nostatlabel;
  xaxis grid display=(nolabel);
  yaxis grid discreteorder=data display=(nolabel);
run;
  