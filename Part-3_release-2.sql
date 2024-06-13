----- Part 3 - Data Manipulation Language -----

----------------- Release 2 ----------------

-- 1. Gabungkan data transaksi dari user_id = 1 dan user_id = 2
select *
from transactions
where user_id = 1
union
select *
from transactions
where user_id = 2;

-- 2. Tampilkan jumlah harga transaksi dari user_id = 1
select sum(price) as jumlah_harga_transaksi
from transaction_detail
where transaction_id in (
        select transaction_id
        from transactions
        where user_id = 1
);

-- 3. Tampilkan total transaksi dari type_id = 2
select count(*) as total_transaksi
from transaction_detail
where product_id in (
        select product_id
        from products
        where type_id = 2
);

-- 4. Tampilkan filed tabel products dan filed name tabel product_type yang saling berhubungan
select p.product_id,
    p.product_name,
    p.merk,
    p.type_id,
    pt.product_type
from products p
left join product_type pt using (type_id);

-- 5. tampilakn semua filed tabel transactions, filed name tabel products dan filed name tabel users
select t.transaction_id, t.user_id, t.transaction_date, p.product_name, u.user_name
from users u
inner join transactions t using (user_id)
inner join transaction_detail td using (transaction_id)
inner join products p using (product_id);

-- 6. Tampilkan semua data tabel products yang tidak ada di tabel transaction_detail mengunakan subquery
select *
from products
where product_id not in (
    select product_id
    from transaction_detail
);

-- 7. Terapkan otomasi mengunakan function pada column update_at dan contohkan hasilnya
-- create function
create or replace function trigger_set_updated_at() returns trigger as $$ begin new.updated_at = now();
return new;
end;
$$ language plpgsql;

-- aktifasi function
create trigger set_updated_at before
update on users for each row execute procedure trigger_set_updated_at();

-- contoh 1
update users
set tanggal_lahir = '2002-02-01'
where user_id = 1;

-- contoh 2
update users
set status_user = 'baned'
where user_id = 2;

-- cek hasilnya
select *
from users;


-- 8 Create View yg menghasilkan data yg sama dengan no 4
create view product_info as
select p.product_id, p.product_name, p.merk, p.type_id, pt.product_type
from products p
left join product_type pt using (type_id);

-- contoh pengunaan
select *
from product_info;

