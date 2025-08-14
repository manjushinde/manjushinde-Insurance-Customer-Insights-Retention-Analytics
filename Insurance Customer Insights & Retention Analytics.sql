## Customer Targeting Analytics for Insurance Sales project ##

select * from demographic_data;
select * from financial_data;
select * from insurance_data;
select * from personal_data;
select * from city_data;

alter table city_data add column state varchar(50) ;
set sql_safe_updates = 0;

update city_data
set state =
case when city_name in ('Mumbai','Pune') then 'Maharashtra'
	 when city_name = 'Ahmedabad' then 'Gujarat'
     when city_name = 'Bangalore' then 'Karnataka'
     when city_name = 'Chennai' then 'Tamil Nadu'
     when city_name = 'Delhi' then 'Delhi'
     else 'Unknown'
end;

select * from city_data;
select * from demographic_data;

alter table demographic_data drop column state;

create table New_demographic_data as (
select d.*, c.state from city_data c
inner join demographic_data d on c.city_key = d.city_key);

select * from New_demographic_data;
drop table demographic_data;

rename table New_demographic_data to demographic_data;
select * from demographic_data;

create table new_demographic_data as 
select * from (
with cte1 as(
select d.PAN_no, d.city_key, d.state, c.city_name, c.tier, d.pincode
from demographic_data d
inner join city_data c on c.city_key = d.city_key),
cte2 as (
select *,
case when city_name = 'Pune' then concat(411, right(cast(pincode as char),3),'') 
	 when city_name = 'Mumbai' then concat(400, right(cast(pincode as char),3),'')
	 when city_name = 'Ahmedabad' then concat(380, right(cast(pincode as char),3),'')
	 when city_name = 'Chennai' then concat(600, right(cast(pincode as char),3),'')
	 when city_name = 'Bangalore' then concat(560, right(cast(pincode as char),3),'')
	 when city_name = 'Delhi' then concat(110, right(cast(pincode as char),3),'')
end as new_pin
from cte1)
select PAN_no, city_key, state, city_name, tier,
cast(case when length(new_pin) < 6 then concat(new_pin,'000','') else new_pin 
end as unsigned) as pincode
from cte2) as temp;

select * from new_demographic_data;
select * from demographic_data;
select * from city_data;

drop table demographic_data;
rename table New_demographic_data to demographic_data;

#============================================ Demographic_data is cleaned Now and joined with city table ================================

select * from financial_data;
select card_type, count(*)
from financial_data
group by card_type;

alter table financial_data add column card_type_new varchar(50);

set sql_safe_updates = 0;

update financial_data
set card_type_new = 
(select
	case when income >=600000 and cibil_score > 700 then 'Credit'
    else 'Debit' end);

alter table financial_data drop column card_type;

select card_type_new, count(*) from financial_data
group by card_type_new;

alter table financial_data change card_type_new card_type varchar(50);

select * from financial_data;
#============================ financial_data is cleaned ======================================
select * from insurance_data;
#============================ insurance_data is cleaned ======================================

select * from personal_data;

select right(email_id,4), count(*)
from personal_data
group by right(email_id,4);

set sql_safe_updates = 0;

alter table personal_data add column new_mail_id varchar(100);

update personal_data
set new_mail_id = 
			case when email_id = '' then concat(SUBSTRING_INDEX(name,' ',1),SUBSTRING_INDEX(name,' ',-1),'@example.com')
			else email_id end;

alter table personal_data drop column email_id;
alter table personal_data change new_mail_id  email_id varchar(100);


update personal_data
set gender = 
case 
	when gender = 'M' then 'Male'
	when gender = 'F' then 'Female'
end
;

select * from personal_data;
#============================ personal_data is cleaned ======================================

select * from demographic_data; # I alredy join demographic_data table with city_data table 
select * from city_data;
select * from financial_data;
select * from insurance_data;
select * from personal_data;

#There is no any missing or null value present in the dataset now to check the column data type


describe demographic_data;
/*PAN_no	-text
city_key	-text
state	    -varchar(50)
city_name	-text
tier	    -int
pincode	    -bigint unsigned*/
# all data types are ok

describe financial_data;
/*PAN_no    	  		-text
income	       		 	-int
cibil_score  			-int
bank_account_number		-text
card_type				-varchar(50)*/
#All data types are ok

describe personal_data;
/*
PAN_no  	-text
name    	-text
gender  	-text
occupation	-text
mobile  	-text
dob     	-text
email_id	-varchar(100)*/
#Here dob is text but we want this into date formate

alter table personal_data
modify column dob date;

update personal_data
set dob = str_to_date(dob,'%Y-%m-%d');
describe personal_data;
# all data types are ok

describe insurance_data;
/*
PAN_no					-text
type_of_insurance	    -text
premium	 				-int
payment_frequency	    -text
insurance_start_date 	-text
insurance_end_date		-text  */
# Here insurance_start_date and insurance_end_date are text so convert them into date data_type

set sql_safe_updates = 0;

update insurance_data
set insurance_start_date = str_to_date(insurance_start_date, '%d-%m-%Y')
where insurance_start_date is not null;

alter table insurance_data
modify column insurance_start_date date;

update insurance_data
set insurance_end_date = str_to_date(insurance_end_date, '%d-%m-%Y')
where insurance_end_date is not null;

alter table insurance_data
modify column insurance_end_date date;

#=========================================
select count(*) from demographic_data;
select count(*) from financial_data;
select count(*) from insurance_data;
select count(*) from personal_data;
select count(*) from city_data;

# Here City_data and demographic_data are alredy joined so now join remaining tables

create table final_Information as 
(select 
d.PAN_no, d.city_key, d.city_name, d.state, d.tier, d.pincode, f.income, f.cibil_score, 
f.bank_account_number, f.card_type, i.type_of_insurance, i.premium, i.payment_frequency, 
i.insurance_start_date, i.insurance_end_date, p.name, p.gender, p.occupation, p.mobile, 
p.dob, p.email_id
from demographic_data d
inner join financial_data f on f.PAN_no = d.PAN_no
inner join insurance_data i on i.PAN_no = d.PAN_no
inner join personal_data p on p.PAN_no = d.PAN_no
);

select * from final_Information;

