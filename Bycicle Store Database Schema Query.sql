/*  Bycicle Store Database Schema
A company rents and sells bicycles - both e-bikes and bikes. Each bike is unique because of its run, damages, size, colour, etc. The company sells the bikes via its own online shop and partner shops, so the main expense item is the supplier price and discounts.  
*/ 
 
create table customers ( 
customer_id INT, 
first_name varchar(50) not null,
last_name varchar(50),
phone_number INT, 
email varchar(50),
street varchar(50), 
city varchar,
zip_code INT,
constraint pk_customers primary key (customer_id)); 


insert into customers values (1,'Tahlia','Barnes',0550317,'tahliabarnes@gmail.com','Bundesautobahn_99','Munich',80611);
insert into customers values (2,'Masuma','Mackie',555416,'masuma_machie@gmail.com','Altstadtring_5','Munich',80527);
insert into customers values (3,'Kasim','Cooke',734201,'kacooke@gmail.com','Apfelallee_23','Munich',80455);
insert into customers values (4,'Issa','Rowland',504223,'isaa_rowland@gmail.com','Moosacher_Straße_134','Munich',80444);
insert into customers values (5,'Viktor','Nash',669944,'vik_nash@yahoo.com','Neuhauser_Straße_44','Munich',80123);
insert into customers values (6,'Megan','Mccullough',3189377,'megan_mccull@gmail.com','Dachauer_Straße_1 ','Munich',84135);
insert into customers values (7,'Troy','Orozco',7123581,'troy@outlook.com','Kardinal_Faulhaber_Straße_3','Berlin',10115);
insert into customers values (8,'Remy','Horne',1583754,'remy.horne@yahoo.com','Revaler_Strasse_99','Berlin',10119);
insert into customers values (9,'Elyse','Bate',5571432,'ebate@gmail.com','Kurfürstendamm_57','Berlin',10176);
insert into customers values (10,'Zaara','Parry',5741221,'zaara_parry@outlook.com','Oderbergerstrasse_6','Berlin',10247);
insert into customers values (11,'Benjamin','Frank',574123,'ben_frank@outlook.com','Allamstreet','Munich',10111);

create table orders (  
  order_id           INT not null,  
  order_status       varchar(50),  
  order_date         date,  
  required_date      date,  
  ship_date          date,
  type_order         varchar,
  website_id         INT,
  customer_id        INT,
  constraint pk_order_id primary key (order_id),  
  constraint fk_customer_id foreign key (customer_id) 
      references customers (customer_id));
      
insert into orders values (60,'ordered','10-10-2022','10-12-2022',NULL,'purchase',11,1);
insert into orders values (61,'shipped','10-03-2022','10-17-2022','10-07-2022','rent',12,2);
insert into orders values (62,'returned','07-02-2022','10-17-2022','10-19-2022','rent',13,3);
insert into orders values (63,'delivered','10-12-2022','10-17-2022','10-15-2022','rent',14,4);
insert into orders values (64,'ordered','10-14-2022','10-17-2022',NULL,'rent',14,5);
insert into orders values (65,'ordered','10-17-2022','10-18-2022',NULL,'purchase',11,6);
insert into orders values (66,'shipped','10-12-2022','10-18-2022','10-15-2022','rent',13,7); 
insert into orders values (67,'delivered','10-10-2022','10-18-2022','10-18-2022','purchase',14,8);
insert into orders values 
(68,'delivered','10-01-2022','10-19-2022','10-20-2022','rent',12,9);
insert into orders values (69,'delivered','09-28-2022','10-19-2022','10-19-2022','purchase',12,10);  
insert into orders values 
(70,'ordered','10-07-2022','10-19-2022',NULL,'rent',14,11);  

create table platforms (  
  website_id           INT not null,  
  website_name         varchar(50),
  constraint pk_website_id primary key (website_id));

  
insert into platforms values
(11,'bikebike.com');
insert into platforms values
(12,'google.shopping');
insert into platforms values
(13,'dechatlon.com');
insert into platforms values
(14,'amazon.com');

alter table orders
add constraint fk_website_id foreign key (website_id) 
      references platforms (website_id); 
   
   create table working_items  (  
  bike_id            INT not null,
  bike_name          varchar(50),
  sale_price         INT,
  quantity           INT,
  discount           INT,
  order_id           INT,  
  constraint pk_bike_id primary key (bike_id),
  constraint fk_order_id foreign key (order_id) 
      references orders (order_id));
  
  insert into working_items values
(1704305,'Himiway_City_Pedelec',1948,1,200,60);
  insert into working_items values
(1704306,'Made_x_Veloretti',362,1,NULL,61);
  insert into working_items values
(1704307,'Serious_Rockville_Disc',3118,1,100,62);
  insert into working_items values
(1704308,'JOBOBIKE_Linda',3247,1,NULL,63);
  insert into working_items values
(1704309,'Vanmoof_S3',752,1,50,64);
    insert into working_items values
(1704310,'Cube_Aim_Pro_grün',388,1,NULL,65);
    insert into working_items values
(1704311,'3_Speed_Caferacer',2727,1,NULL,66);
    insert into working_items values
(1704312,'MAKI+',1298,1,NULL,67);
      insert into working_items values
(1704313,'Jordaan+_eBike',4940,1,100,68);
      insert into working_items values
(1704314,'EP-2_Pro',3250,1,NULL,69);
      insert into working_items values
(1704315,'Woom_original',300,2,150,70);
      
      create table products  (  
  bike_id            INT not null,
  bike_name          varchar(50),
  size               INT,
  weight             INT,
  colour             varchar,
  supplier_price     INT,
  run                INT, 
  damages            INT,
  website_id         INT, 
  availibility       INT, 
  delivery_time      INT, 
  constraint fk_website_id foreign key (website_id) 
      references platforms (website_id));
      
       insert into products values
(1704305,'Himiway_City_Pedelec',38,14,'black',1499,500,1,11,1,7);  
 insert into products values
(1704306,'Made_x_Veloretti',42,27,'white',279,3000,0,12,1,6);  
 insert into products values
(1704307,'Serious_Rockville_Disc',46,14,'yellow',2399,100,0,13,1,10); 
   insert into products values
(1704308,'JOBOBIKE _Linda',54,21,'blue',2498,400,0,14,1,5); 
   insert into products values
(1704309,'Vanmoof_S3',29,14,'brown',579,1000,0,14,1,12); 
   insert into products values
(1704310,'Cube_Aim_Pro_grün',54,23,'black',299,1500,0,11,0,10); 
insert into products values
(1704311,'3_Speed_Caferacer',46,28,'grey',2098,500,1,13,1,12);
insert into products values
(1704312,'MAKI+',46,17,'black',999,500,0,14,1,14);
insert into products values
(1704313,'Jordaan+_eBike',38,15,'white',3800,2000,0,12,1,5);
insert into products values
(1704314,'EP-2_Pro',46,19,'white',2500,700,1,12,1,11);
insert into products values
(1704315,'Woom_original',38,5,'pink',1400,900,0,14,1,8);
insert into products values
(1704315,'Woom_original',38,5,'pink',1400,900,0,14,1,8);