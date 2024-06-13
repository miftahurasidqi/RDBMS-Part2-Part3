----- Part 3 - Data Manipulation Language -----

----------------- Release 1 ----------------

-- 1.INSERT  
-- 1.A. Insert 3 Product Type
insert into product_type (product_type)
values ('Elektronik'),
    ('Pakaian Pria'),
    ('Pakaian Wanita');

-- 1.B Insert 2 Product dengan product type_id = 1
insert into products (type_id, product_name, merk)
values (1, 'Samsung Galaxy A20', 'Samsung'),
    (1, '4K Smart TV', 'Toshiba');

-- 1.C Insert 3 Product dengan product type_id = 2
insert into products (type_id, product_name, merk)
values (2, 'Kemeja Panjang', 'Glody Outfit'),
    (2, 'Kemeja Pendek', 'Hoof'),
    (2, 'Jas Formal', 'Dua Saudara');
    
-- 1.D Insert 3 Product dengan product type_id = 3
insert into products (type_id, product_name, merk)
values (3, 'Fuji Dress', 'Hana Fashion'),
    (3, 'Gamis Flanel', 'Evertop'),
    (3, 'Jilbab Segi Empat Motif', 'Authentism');

-- 1.E Insert  Product description pada setiap product
insert into descriptions (product_id, detail_description)
values (1, 'Smartphone dengan layar 6,4 inci, kamera ganda, baterai 4000mAh, prosesor Exynos, dan penyimpanan 32GB dapat diperluas.'),
    (2, 'TV Ultra HD 4K dengan HDR, aplikasi streaming, Wi-Fi, dan Bluetooth, memberikan pengalaman menonton luar biasa.'),
    (3, 'Kemeja katun berkualitas, desain klasik, kerah runcing, kancing depan, ideal untuk acara formal dan kasual.'),
    (4, 'Kemeja ringan, desain modern, warna cerah, nyaman untuk cuaca hangat, cocok untuk aktivitas santai sehari-hari.'),
    (5, 'Jas wol premium, potongan slim fit, detail lapel tajam, kancing berkualitas, ideal untuk acara resmi dan bisnis.'),
    (6, 'Gaun satin elegan, potongan A-line, detail renda, tali bahu adjustable, cocok untuk pesta dan perayaan khusus.'),
    (7, 'Gamis flanel lembut, potongan longgar, nyaman dipakai, tersedia dalam warna solid, cocok untuk ibadah dan acara keluarga.'),
    (8, 'Jilbab voal ringan, berbagai motif cantik, mudah dibentuk, cocok dipadukan dengan berbagai gaya busana.');

-- 1.F Insert 3 payment_method
insert into payment_methods (description_id, payment_methods)
values (1, 'COD'),
    (2, 'Bank BRI'),
    (3, 'Bank BCA');

insert into users (
        user_name,
        tanggal_lahir,
        status_user,
        gender,
        created_at
    )
values (
        'Mifta',
        '02-01-2001',
        'active',
        'Laki-Laki',
        now()
    ),
    (
        'Fikar',
        '09-03-2001',
        'active',
        'Laki-Laki',
        now()
    ),
    (
        'Yovina',
        '02-11-2000',
        'active',
        'Perempuan',
        now()
    ),
    (
        'Wily',
        '04-02-1999',
        'active',
        'Laki-Laki',
        now()
    ),
    (
        'Adi',
        '21-12-2000',
        'active',
        'Laki-Laki',
        now()
    );

-- 1.H Insert 3 transaction di masing-masing user
insert into transactions (user_id, transaction_date)
values (1, now()),
    (1, now()),
    (1, now()),
    (2, now()),
    (2, now()),
    (2, now()),
    (3, now()),
    (3, now()),
    (3, now()),
    (4, now()),
    (4, now()),
    (4, now());

-- 1.I Insert 3 Product di masing-masing transaction 
insert into transaction_detail (transaction_id, product_id, quantity, price)
values (1, 1, 2, 1500),
    (1, 5, 1, 1000),
    (1, 6, 3, 900),
    (2, 1, 1, 1500),
    (2, 5, 3, 1000),
    (2, 2, 2, 1800),
    (3, 1, 5, 1500),
    (3, 3, 2, 800),
    (3, 6, 3, 900),
    (4, 6, 3, 900),
    (4, 5, 4, 1000),
    (4, 7, 3, 850),
    (5, 2, 1, 1800),
    (5, 5, 6, 1000),
    (5, 7, 3, 850),
    (6, 2, 3, 1800),
    (6, 5, 7, 1000),
    (6, 7, 3, 850),
    (7, 2, 2, 1800),
    (7, 5, 9, 1000),
    (7, 7, 3, 800),
    (8, 5, 8, 1000),
    (8, 6, 1, 900),
    (8, 7, 3, 850),
    (9, 3, 5, 800),
    (9, 6, 1, 900),
    (9, 7, 3, 850),
    (10, 3, 6, 800),
    (10, 6, 1, 900),
    (10, 7, 3, 850),
    (11, 3, 4, 800),
    (11, 6, 1, 900),
    (11, 7, 3, 850),
    (12, 3, 9, 800),
    (12, 6, 1, 900),
    (12, 7, 3, 850);

-- 2. SELECT
-- 2.A Tampilkan nama user dengan gender laki-laki
select *
from users
where gender = 'Laki-Laki';

-- 2.B Tampilkan Product dengan id = 3
select *
from products
where product_id = 3;

-- 2.C Tampilkan user yang created_at dalam range 7 hari terakhir dan mengandung huruf a
select *
from users
where created_at >= now() - interval '7 days'
and user_name like '%a%';

-- 2.D Hitung Jumlah user dengan gender perempuan 
select gender, count(*) as Jumlah_User
from users
where gender = 'Perempuan'
group by gender;

-- 2.E Tampilkan Data Pelanggan dengan urutan sesuai nama abjad
select *
from users
order by user_name;

-- 2.F Tampilkan 5 data transaksi dengan product id = 3
select *
from transaction_detail
where product_id = 3
limit 5;

-- 3. UPDATE
-- 3.A Update product_id = 1 dengan product_name 'product dummy'
update products
set product_name = 'product dummy'
where product_id = 1;

-- 3.B Update quantity = 3 pada product_id = 1
update transaction_detail
set quantity = 3
where product_id = 1;

-- 4. DELETE
-- 4.A Delete product_id = 1

-- sebelum menghapus data pada tabel product dari product_id = 1, harus menghapus data relasinya terlebih dahulu
-- menhapus data relasi pada tabel payment_methods  
delete from payment_methods
where description_id in (
    select description_id
    from descriptions
    where product_id = 1
);

-- menghapus data relasi pada tabel descriptions
delete from descriptions
where product_id = 1;

-- menghapus data relasi pada tabel transaction_detail
delete from transaction_detail
where product_id = 1;

-- setelah menghapus data relasi, baru menghapus data pada tabel products
delete from products
where product_id = 1;

-- 4.B Delete product dengan type_id = 1

-- sebelum menghapus data pada tabel product dengan type_id = 1, harus menghapus data relasinya terlebih dahulu
-- menhapus data relasi pada tabel payment_methods  
delete from payment_methods
where description_id in (
    select description_id
    from descriptions
    where product_id in (
        select product_id
        from products
        where type_id = 1
   )
);

-- menghapus data relasi pada tabel descriptions
delete from descriptions
where product_id in (
    select product_id
    from products
    where type_id = 1
);

-- menghapus data relasi pada tabel transaction_detail
delete from transaction_detail
where product_id in (
    select product_id
    from products
    where type_id = 1
);

-- setelah menghapus data relasi, baru menghapus data pada tabel products
delete from products
where product_id in (
    select product_id
    from products
    where type_id = 1
);
