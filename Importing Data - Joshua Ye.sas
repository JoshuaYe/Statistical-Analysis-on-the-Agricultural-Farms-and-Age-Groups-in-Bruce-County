/*
Written by: Joshua Ye
Class: ICS4U1
Summative: Statistical Analysis Summative
Date: May 25, 2020
Purpose: To import Bruce County data for ICS4U1 SAS summative
*/

libname out "/home/u45269187/EPG194/data/summative";

%web_drop_table(out.age);
FILENAME REFFILE '/home/u45269187/EPG194/data/summative/Datasets.xlsx';
PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=out.age;
	GETNAMES=YES;
	SHEET="Age";
RUN;
PROC CONTENTS DATA=out.age; RUN;
%web_open_table(out.age);

%web_drop_table(out.ontario);
FILENAME REFFILE '/home/u45269187/EPG194/data/summative/Datasets.xlsx';
PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=out.ontario;
	GETNAMES=YES;
	SHEET="Ontario";
RUN;
PROC CONTENTS DATA=out.ontario; RUN;
%web_open_table(out.ontario);

%web_drop_table(out.size);
FILENAME REFFILE '/home/u45269187/EPG194/data/summative/Datasets.xlsx';
PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=out.size;
	GETNAMES=YES;
	SHEET="Size";
RUN;
PROC CONTENTS DATA=out.size; RUN;
%web_open_table(out.size);

%web_drop_table(out.value);
FILENAME REFFILE '/home/u45269187/EPG194/data/summative/Datasets.xlsx';
PROC IMPORT DATAFILE=REFFILE
	DBMS=XLSX
	OUT=out.value;
	GETNAMES=YES;
	SHEET="Value";
RUN;
PROC CONTENTS DATA=out.value; RUN;
%web_open_table(out.value);