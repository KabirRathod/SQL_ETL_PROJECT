select * from customersales ;

select
	ProductID,
	Price,
	Country,
	sum(Quantity) as Tot_Qu_IND
from
	customersales
where
	Country='IND'
group by
	ProductID
order by
	Tot_Qu_IND desc
;

#########################################################
############# selling details by Country ################
#########################################################

create table etl_project.total_IND_sale(
	Product_ID varchar(10) ,
    Sale_Price int,
    Tot_Qu_IND int(100)
);

insert into total_IND_sale(Product_ID,Sale_Price,Tot_Qu_IND)
select ProductID,Price,sum(Quantity) as Tot_Qu_IND
From customersales 
where
	Country='IND'
group by
	ProductID
order by
	Tot_Qu_IND desc
;
select * from total_IND_sale;


create table etl_project.total_SCO_sale(
	Product_ID varchar(10) ,
    Sale_Price int,
    Tot_Qu_SCO int(100)
);

insert into total_SCO_sale(Product_ID,Sale_Price,Tot_Qu_SCO)
select ProductID,Price,sum(Quantity) as Tot_Qu_SCO
From customersales 
where
	Country='SCO'
group by
	ProductID
order by
	Tot_Qu_SCO desc
;
select * from total_SCO_sale;


create table etl_project.total_ITY_sale(
	Product_ID varchar(10) ,
    Sale_Price int,
    Tot_Qu_ITY int(100)
);

insert into total_ITY_sale(Product_ID,Sale_Price,Tot_Qu_ITY)
select ProductID,Price,sum(Quantity) as Tot_Qu_ITY
From customersales 
where
	Country='ITY'
group by
	ProductID
order by
	Tot_Qu_ITY desc
;
select * from total_ITY_sale;


create table etl_project.total_END_sale(
	Product_ID varchar(10) ,
    Sale_Price int,
    Tot_Qu_END int(100)
);

insert into total_END_sale(Product_ID,Sale_Price,Tot_Qu_END)
select ProductID,Price,sum(Quantity) as Tot_Qu_END
From customersales 
where
	Country='END'
group by
	ProductID
order by
	Tot_Qu_END desc
;
select * from total_END_sale;

#########################################################################################################
################## Product selling By Online and Offline In individual Country ##########################
#########################################################################################################

select
	ProductID,
	Country,
	count(_Channel) as Channel_Online
from
	customersales
where
	_Channel='online'
group by
	Country
;

select
	ProductID,
	Country,
	count(_Channel) as Channel_Online
from
	customersales
where
	_Channel='offline'
group by
	Country
;

CREATE TABLE Channel_Offline_Count (
    ProductID varchar(10),
    Country VARCHAR(255),
    Channel_Offline INT
);

INSERT INTO Channel_Offline_Count (ProductID, Country, Channel_Offline)
SELECT
    ProductID,
    Country,
    COUNT(*) AS Channel_Offline
FROM
    customersales
WHERE
    _Channel = 'offline'
GROUP BY
    ProductID,
    Country;

select * from Channel_Offline_Count ;


CREATE TABLE Channel_Online_Count (
    ProductID varchar(10),
    Country VARCHAR(255),
    Channel_Online INT
);

INSERT INTO Channel_Online_Count (ProductID, Country, Channel_Online)
SELECT
    ProductID,
    Country,
    COUNT(*) AS Channel_Online
FROM
    customersales
WHERE
    _Channel = 'online'
GROUP BY
    ProductID,
    Country;

select * from Channel_Online_Count ;
