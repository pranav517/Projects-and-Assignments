#The file has been imported using Table Data Import Wizard
#Inspecting after Import
select*
from `bajaj auto`;

#Creating New Table Bajaj1
create table bajaj1( 
Date date,`Close Price` float8,
`20 Day MA` float4,`50 Day MA` float4);

#Inspecting layout
select* from bajaj1;

#Inspecting Data Type of columns
Show fields
from `bajaj auto` ;

#Getting the desired format(YYYY-MM-DD) before changing data type
update `bajaj auto`
set Date= 
STR_TO_DATE(
replace(
substring_index(Date,'-',-2),'-',concat(' ',substring_index(date,'-',1),', ')
),'%M %d, %Y'
);

#Changing the data type
alter table `bajaj auto`
modify Date date;



#Populating the table

insert into bajaj1(Date,`Close Price`,`20 Day MA`,`50 Day MA`)
select Date,`Close Price`,
if (row_number() over(order by Date asc)>19,
avg(`Close Price`) over(order by Date rows 19 preceding),Null)as `20 Day MA`,
if (row_number() over(order by Date)>49,avg(`Close Price`) over(order by Date rows 49 preceding),Null)as `50 Day MA`
from `bajaj auto`;

#Inspecting the Final table
select* from bajaj1;

#The file has been imported using Table Data Import Wizard
#Inspecting after Import
select*
from `eicher motors`;

#Creating New Table
create table `eicher motors1`( 
Date date,`Close Price` float8,
`20 Day MA` float4,`50 Day MA` float4);

#Inspecting layout
select * from `eicher motors1`;

#Getting the desired format(YYYY-MM-DD) before changing data type
update `eicher motors`
set Date= 
STR_TO_DATE(
replace(
substring_index(Date,'-',-2),'-',concat(' ',substring_index(date,'-',1),', ')
),'%M %d, %Y'
);
#Changing the data type
alter table `eicher motors`
modify Date date;

#Populating the table
insert into `eicher motors1`(Date,`Close Price`,`20 Day MA`,`50 Day MA`)
select Date,`Close Price`,
if (row_number() over(order by Date asc)>19,
avg(`Close Price`) over(order by Date rows 19 preceding),Null)as `20 Day MA`,
if (row_number() over(order by Date)>49,avg(`Close Price`) over(order by Date rows 49 preceding),Null)as `50 Day MA`
from `eicher motors`;

#Inspecting the Final table
select * from `eicher motors1`;


#The file has been imported using Table Data Import Wizard
#Inspecting after Import
select*
from `hero motocorp`;

#Creating New Table
create table `hero motocorp1`( 
Date date,`Close Price` float8,
`20 Day MA` float4,`50 Day MA` float4);

#Inspecting layout
select * from `hero motocorp1`;

#Getting the desired format(YYYY-MM-DD) before changing data type
update `hero motocorp`
set Date= 
STR_TO_DATE(
replace(
substring_index(Date,'-',-2),'-',concat(' ',substring_index(date,'-',1),', ')
),'%M %d, %Y'
);

#Changing the data type
alter table `hero motocorp`
modify Date date;

#Populating the table
insert into `hero motocorp1`(Date,`Close Price`,`20 Day MA`,`50 Day MA`)
select Date,`Close Price`,
if (row_number() over(order by Date asc)>19,
avg(`Close Price`) over(order by Date rows 19 preceding),Null)as `20 Day MA`,
if (row_number() over(order by Date)>49,avg(`Close Price`) over(order by Date rows 49 preceding),Null)as `50 Day MA`
from `hero motocorp`;

#Inspecting the Final table
select * from `hero motocorp1`;

#Similar steps have been followed for Infosys1

select*
from Infosys;

create table Infosys1( 
Date date,`Close Price` float8,
`20 Day MA` float4,`50 Day MA` float4);

select * from Infosys1;

update infosys
set Date= 
STR_TO_DATE(
replace(
substring_index(Date,'-',-2),'-',concat(' ',substring_index(date,'-',1),', ')
),'%M %d, %Y'
);

alter table infosys
modify Date date;

insert into infosys1(Date,`Close Price`,`20 Day MA`,`50 Day MA`)
select Date,`Close Price`,
if (row_number() over(order by Date asc)>19,
avg(`Close Price`) over(order by Date rows 19 preceding),Null)as `20 Day MA`,
if (row_number() over(order by Date)>49,avg(`Close Price`) over(order by Date rows 49 preceding),Null)as `50 Day MA`
from infosys;

select * from infosys1;

#Similar steps have been followed for TCS1


select*
from tcs;

create table tcs1( 
Date date,`Close Price` float8,
`20 Day MA` float4,`50 Day MA` float4);

select * from tcs1;

update tcs
set Date= 
STR_TO_DATE(
replace(
substring_index(Date,'-',-2),'-',concat(' ',substring_index(date,'-',1),', ')
),'%M %d, %Y'
);

alter table tcs
modify Date date;

insert into tcs1(Date,`Close Price`,`20 Day MA`,`50 Day MA`)
select Date,`Close Price`,
if (row_number() over(order by Date asc)>19,
avg(`Close Price`) over(order by Date rows 19 preceding),Null)as `20 Day MA`,
if (row_number() over(order by Date)>49,avg(`Close Price`) over(order by Date rows 49 preceding),Null)as `50 Day MA`
from tcs;

select * from tcs1;

#Similar steps have been followed for tvs motors 1


select*
from `tvs motors`;

create table `tvs motors1`( 
Date date,`Close Price` float8,
`20 Day MA` float4,`50 Day MA` float4);

select * from `tvs motors1`;

update `tvs motors`
set Date= 
STR_TO_DATE(
replace(
substring_index(Date,'-',-2),'-',concat(' ',substring_index(date,'-',1),', ')
),'%M %d, %Y'
);

alter table `tvs motors`
modify Date date;

insert into `tvs motors1`(Date,`Close Price`,`20 Day MA`,`50 Day MA`)
select Date,`Close Price`,
if (row_number() over(order by Date asc)>19,
avg(`Close Price`) over(order by Date rows 19 preceding),Null)as `20 Day MA`,
if (row_number() over(order by Date)>49,avg(`Close Price`) over(order by Date rows 49 preceding),Null)as `50 Day MA`
from `tvs motors`;

select * from `tvs motors1`;


##THE MASTER TABLE
#Creating a Master Table Layout
create table master_table(
Date date,Bajaj float8,TCS float8,TVS float8,Infosys float8,Eicher float8,
Hero float8);

#Inspecting
select* from master_table;

#Populating the table
insert into master_table(Date,Bajaj,TCS,TVS,Infosys,Eicher,Hero)

select b.Date,b.`Close Price`,t.`Close Price`,t1.`Close Price`,i.`Close Price`,e.`Close Price`,
h.`Close Price`
from bajaj1 b inner join tcs1 t on b.Date=t.Date
inner join `tvs motors1` t1 on t.Date=b.Date
inner join infosys1 i on i.date=b.date
inner join `Eicher motors1` e on e.Date=b.Date
inner join `Hero motocorp1` h on h.date=b.date;

#Final table
select* from master_table;

##THE SIGNAL TABLES FOR ALL 6 STOCKS

#Creatin a Layout for the table bajaj2
create table bajaj2(Date date,`Close Price` float8,`Signal` varchar(8));

#Inspecting
select* from bajaj2;

#Populating using a derived table in from clause which was created using Self Join.
 insert into bajaj2(Date,`Close Price`,`Signal`)
 select date,`Close Price`,if(20MA_2>50MA_2 and 20MA<50MA,'BUY',if(20MA_2<50MA_2 and 20MA>50MA,'SELL','HOLD') ) as 'Signal'
 from (SELECT a.Date,a.`Close Price`,a.`20 Day MA` AS "20MA",a.`50 Day MA` AS "50MA",
b.`20 Day MA` AS "20MA_2",b.`50 Day MA` AS "50MA_2"
FROM bajaj1 a, bajaj1 b
WHERE a.Date = b.Date + 1)x;

 
 ##Similarly for eicher2
 
 #Creatin a Layout for the table
create table eicher2(Date date,`Close Price` float8,`Signal` varchar(8));

#Inspecting
select* from eicher2;

#Populating using a derived table in from clause which was created using Self Join.
 insert into eicher2(Date,`Close Price`,`Signal`)
 select date,`Close Price`,if(20MA_2>50MA_2 and 20MA<50MA,'BUY',if(20MA_2<50MA_2 and 20MA>50MA,'SELL','HOLD') ) as 'Signal'
 from (SELECT a.Date,a.`Close Price`,a.`20 Day MA` AS "20MA",a.`50 Day MA` AS "50MA",
b.`20 Day MA` AS "20MA_2",b.`50 Day MA` AS "50MA_2"
FROM `eicher motors1` a, `eicher motors1` b
WHERE a.Date = b.Date + 1)x;

 
 ##Similarly for Hero2
 
 #Creatin a Layout for the table
create table hero2(Date date,`Close Price` float8,`Signal` varchar(8));

#Inspecting
select* from hero2;

#Populating using a derived table in from clause which was created using Self Join.
 insert into hero2(Date,`Close Price`,`Signal`)
 select date,`Close Price`,if(20MA_2>50MA_2 and 20MA<50MA,'BUY',if(20MA_2<50MA_2 and 20MA>50MA,'SELL','HOLD') ) as 'Signal'
 from (SELECT a.Date,a.`Close Price`,a.`20 Day MA` AS "20MA",a.`50 Day MA` AS "50MA",
b.`20 Day MA` AS "20MA_2",b.`50 Day MA` AS "50MA_2"
FROM `hero motocorp1` a, `hero motocorp1` b
WHERE a.Date = b.Date + 1)x;






#Similarly for Infosys2

#Creatin a Layout for the table
create table infosys2(Date date,`Close Price` float8,`Signal` varchar(8));

#Inspecting
select* from infosys2;

#Populating using a derived table in from clause which was created using Self Join.
 insert into infosys2(Date,`Close Price`,`Signal`)
 select date,`Close Price`,if(20MA_2>50MA_2 and 20MA<50MA,'BUY',if(20MA_2<50MA_2 and 20MA>50MA,'SELL','HOLD') ) as 'Signal'
 from (SELECT a.Date,a.`Close Price`,a.`20 Day MA` AS "20MA",a.`50 Day MA` AS "50MA",
b.`20 Day MA` AS "20MA_2",b.`50 Day MA` AS "50MA_2"
FROM infosys1 a, infosys1 b
WHERE a.Date = b.Date + 1)x;


#TCS2
 
 #Creatin a Layout for the table
create table tcs2(Date date,`Close Price` float8,`Signal` varchar(8));

#Inspecting
select* from tcs2;

#Populating using a derived table in from clause which was created using Self Join.
 insert into tcs2(Date,`Close Price`,`Signal`)
 select date,`Close Price`,if(20MA_2>50MA_2 and 20MA<50MA,'BUY',if(20MA_2<50MA_2 and 20MA>50MA,'SELL','HOLD') ) as 'Signal'
 from (SELECT a.Date,a.`Close Price`,a.`20 Day MA` AS "20MA",a.`50 Day MA` AS "50MA",
b.`20 Day MA` AS "20MA_2",b.`50 Day MA` AS "50MA_2"
FROM tcs1 a, tcs1 b
WHERE a.Date = b.Date + 1)x;

 
 #TVS2
 
 #Creatin a Layout for the table
create table tvs2(Date date,`Close Price` float8,`Signal` varchar(8));

#Inspecting
select* from tvs2;

#Populating using a derived table in from clause which was created using Self Join.
 insert into tvs2(Date,`Close Price`,`Signal`)
 select date,`Close Price`,if(20MA_2>50MA_2 and 20MA<50MA,'BUY',if(20MA_2<50MA_2 and 20MA>50MA,'SELL','HOLD') ) as 'Signal'
 from (SELECT a.Date,a.`Close Price`,a.`20 Day MA` AS "20MA",a.`50 Day MA` AS "50MA",
b.`20 Day MA` AS "20MA_2",b.`50 Day MA` AS "50MA_2"
FROM `tvs motors1` a, `tvs motors1` b
WHERE a.Date = b.Date + 1)x;

#Creating a UDF that takes Date from Bajaj2 table as Input and returns Signal as Output

delimiter $$
create function signal_generator(D date)
 returns varchar(8) deterministic
 begin
 declare signal_generated varchar(8);
 select `Signal` from bajaj2 where `Date`=D into signal_generated;
 return(signal_generated);
 end $$
 
delimiter ;
#Inspecting the function
select signal_generator('2016-10-14') as 'Signal'
from bajaj2; #The function successfully generates the right signal

#ANALYSIS

select count(*) as 'number of buys'
from bajaj2 where `signal`='BUY';
#We get 9 instances in total where stock is showing the tendency to go to a positive trend
select count(*) as 'number of sells'
from bajaj2 where `signal`='SELL';
#We get 6 instances in total where stock is showing the tendency to go to a negative trend

select count(*) as 'number of buys'
from eicher2 where `signal`='BUY';
#We get 4 instances in total where stock is showing the tendency to go to a positive trend
select count(*) as 'number of sells'
from eicher2 where `signal`='sell';
#We get 4 instances in total where stock is showing the tendency to go to a negative trend

select count(*) as 'number of buys'
from hero2 where `signal`='BUY';
#We get 6 instances in total where stock is showing the tendency to go to a positive trend
select count(*) as 'number of sells'
from hero2 where `signal`='SELL';
#We get 3 instances in total where stock is showing the tendency to go to a negative trend

select count(*) as 'number of buys'
from infosys2 where `signal`='BUY';
#We get 7 instances in total where stock is showing the tendency to go to a positive trend
select count(*) as 'number of sells'
from infosys2 where `signal`='SELL';
#We get 4 instances in total where stock is showing the tendency to go to a negaitive trend

select count(*) as 'number of buys'
from tcs2 where `signal`='BUY';
#We get 11 instances in total where stock is showing the tendency to go to a positive trend
select count(*) as 'number of sells'
from tcs2 where `signal`='SELL';
#We get 6 instances in total where stock is showing the tendency to go to a negative trend

select count(*) as 'number of buys'
from tvs2 where `signal`='BUY';
#We get 6 instances in total where stock is showing the tendency to go to a positive trend
select count(*) as 'number of sells'
from tvs2 where `signal`='SELL';
#We get 6 instances in total where stock is showing the tendency to go to a negative trend