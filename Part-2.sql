----- Part 2 - Data Definition Language -----

-- 1. Create database alta_online_shop 
create database alta_online_shop_test;

-- 2. Create Table 
-- A. create table user
create table users (
    user_id serial,
    user_name varchar(100) not null,
    tanggal_lahir date,
    status_user varchar(100),
    gender varchar(100),
    created_at timestamp,
    updated_at timestamp,
    primary key (user_id)
);

-- B. create Table
-- #1. create table product_type
create table product_type (
    type_id serial,
    product_type varchar(20),
    primary key (type_id)
);

-- #2. create table product
create table products (
    product_id serial,
    product_name varchar(50) not null,
    merk varchar(20),
    type_id int,
    primary key (product_id),
    foreign key (type_id) references product_type(type_id)
);

-- #3. create table description
create table descriptions (
    description_id serial,
    product_id int,
    detail_description varchar(500) not null,
    primary key (description_id),
    foreign key (product_id) references products(product_id)
);


-- #4. create table payment_methods
create table payment_methods (
    payment_methods_id serial,
    description_id int,
    payment_methods varchar(20) not null,
    primary key (payment_methods_id),
    foreign key (description_id) references descriptions(description_id)
);

-- C. Create Table
-- #1. create table transaction
create table transactions (
    transaction_id serial,
    user_id int,
    transaction_date timestamp,
    primary key (transaction_id),
    foreign key (user_id) references users(user_id)
);

-- #2 create table transaction_detail
create table transaction_detail (
    transaction_detail_id serial,
    transaction_id int,
    product_id int,
    quantity int not null,
    price int not null,
    primary key (transaction_detail_id),
    foreign key (product_id) references products(product_id)
);

-- 3. Create Table Kurir 
create table kurir (
    kurir_id serial,
    kurir_name int,
    created_at timestamp,
    updated_at timestamp
);

--- 4. Tambah Colom Ongkos_Dasar pada tabel kurir ---
alter table kurir
add column ongkos_dasar numeric(5);

----- 5. Rename Table Kurir menjadi Shipping --------
alter table kurir
rename to shipping;

--- 6. Drop Table Shiping
drop table shipping;

------------------ 7. Relasi Tabel ------------------ 
-- A. 1 to 1: payment_methods dengan descriptions
-- sudah dikerjakan pada nomor 2.B poin ke 3 & 4

-- B. 1 to many: users dengan alamat
create table alamat (
    alamat_id serial,
    user_id int,
    detail_alamat varchar(255),
    foreign key (user_id) references users(user_id)
);

-- C. many to many: users dengan payment_methods
create table user_payment_method_detail (
    user_payment_methods_id serial,
    user_id int,
    payment_methods_id int,
    primary key (user_payment_methods_id),
    foreign key (user_id) references users(user_id),
    foreign key (payment_methods_id) references payment_methods(payment_methods_id)
);