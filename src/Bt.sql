create database demo;
use demo;
create table product(
                        id int,
                        productCode int,
                        productName varchar(100),
                        productPrice int,
                        productAmount int,
                        productDescription varchar(100),
                        productStatus tinyint
);
alter table product change id id int not null primary key auto_increment;

insert product( productCode, productName, productPrice, productAmount, productDescription, productStatus) values
    (212,'sp1',5000,100000,'noboby',1 ),
    (213,'sp2',10000,100000,'noboby',1 ),
    (214,'sp3',6000,100000,'noboby',0 ),
    (215,'sp4',7000,100000,'noboby',0 ),
    (216,'sp5',8000,100000,'noboby',1 );

alter table product add index id_code(productCode);

alter table product add index id_aaa(productName,productPrice);

explain select * from product where productName = 'sp1' or productPrice = 5000;

explain select * from product where productCode = 216;

create view productHiHi as select  productCode, productName, productPrice, productStatus from product;

alter view productHiHi as select  productName, productPrice, productStatus from product where productStatus = true;

drop view productHiHi;

create procedure getAll()
begin
select  * from product;
end;

call getAll();

create procedure addProduct(in Code int, in name_p varchar(20), in price int, in amount int,in desr varchar(100), in statuss tinyint)
begin
    insert product(productCode, productName, productPrice, productAmount, productDescription, productStatus) VALUES
    (Code,name_p,price,amount,desr,statuss);
end;


call addProduct(207,'sp 54', 12000, 200000,'sss',1);

create procedure editProduct(in idd int,in Code int, in name_p varchar(20), in price int, in amount int,in desr varchar(100), in statuss tinyint)
begin
update demo.product set productCode = Code, productName = name_p, productPrice = price, productAmount = amount,
                        productDescription = desr, productStatus = statuss
where id = idd;
end;

call editProduct(3,500,'hải nè',200000,65656565,'asss',1);

create procedure deleteProduce(in iddd int)
begin
delete from demo.product where id = iddd;
end;

call deleteProduce(2);


