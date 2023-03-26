--Practice 7:
CREATE TABLE ogrenciler6
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int 
);
INSERT INTO ogrenciler6 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler6 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler6 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler6 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler6 VALUES(127, 'Mustafa Bak', 'Ali', 99);
​
--DML -Data Manipulation Lang.--> DELETE KOMUTU
/*
* DELETE FROM tablo_adı;  --> Tablonun tüm içerğini siler.
- Veriyi seçerek silmek için WHERE komutu kullanılır
* DELETE FROM tablo_adı WHERE sutun_adi = veri; -->Tabloda istediğiniz veriyi siler.
*/
--İlişkili tablolarda child tablodan veri silmeden parent tablodan silemeyiz. Eğer o veriyi silmek istiyorsak
--önce child tablodan sonra parent tablodan silebiliriz.
--NOT: Child tabloda olan bir veriyi Parent tablodan silmeye çalışalırsak
--ERROR:  update or delete on table "student" violates foreign key constraint "notlar_st_no_fkey" on table "notlar"
--hatayı alırız
/*
TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin 
tamamını siler.
Ancak, seçmeli silme yapamaz.
TRUNCATE TABLE where ...... OLMAZ
TRUNCATE TABLE ogrenciler;
-- tablodaki verileri siler
*/
​
--Practice 7:
-- İsmi Ali Can ve id'si 123 olan kaydı siliniz.
SELECT * FROM ogrenciler6;

DELETE FROM ogrenciler6 WHERE isim='Ali Can' AND id=0123;

-- id 'si 126'dan büyük olan kayıtları silelim.
DELETE FROM ogrenciler6 WHERE  id>0126;

-- id'si 123, 125 veya 126 olanları silelim.
DELETE FROM ogrenciler6 WHERE  id IN (124,125,126);
--========================================================================================
--Practice 6
--IN - OR - AND CONDITION
/*
IN Condition birden fazla mantiksal ifade ile tanimlayabilecegimiz durumlari
(Condition) tek komutla yazabilme imkani verir
AND (ve): Belirtilen şartların her ikiside gerçekleşiyorsa o kayıt listelenir.
OR (veya): Belirtilen şartlardan biri gerçekleşirse, kayıt listelenir
*/
--BETWEEN CONDITION
/*
BETWEEN Condition iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek komutla
yazabilme imkani verir. Yazdigimiz 2 sinirda araliga dahildir (INCLUSIVE)
*/
--NOT BETWEEN CONDITION
/*
NOT BETWEEN Condition iki mantiksal ifade ile tanimlayabilecegimiz durumlari tek
komutla yazabilme imkani verir. Yazdigimiz 2 sinirda araliga harictir (EXCLUSIVE)
*/
​
CREATE table personel
(
id char(4),
isim varchar(50),
maas int
);
insert into personel values('1001', 'Ali Can', 70000);
insert into personel values('1002', 'Veli Mert', 85000);
insert into personel values('1003', 'Ayşe Tan', 65000);
insert into personel values('1004', 'Derya Soylu', 95000);
insert into personel values('1005', 'Yavuz Bal', 80000);
insert into personel values('1006', 'Sena Beyaz', 100000);
​
​
--Practice 6
-- id'si 1003 ile 1005 arasında olan personel bilgilerini listeleyiniz
SELECT  * FROM personel WHERE id BETWEEN '1003' AND '1005'; 

-- D ile Y arasındaki personel bilgilerini listeleyiniz
SELECT  * FROM personel WHERE isim BETWEEN 'D' AND 'Y'; 

-- D ile Y arasında olmayan personel bilgilerini listeleyiniz
SELECT  * FROM personel WHERE isim  NOT BETWEEN 'D' AND 'Y'; 

-- Maaşı 70000 ve ismi Sena olan personeli listeleyiniz
SELECT  * FROM personel WHERE maas=70000 OR isim='Sena Beyaz'; 
​
--Practice 8
--Varolan bir Table gibi Yeni Bir Table Olusturma (Sadece istedigimiz sutunlari alma)
CREATE TABLE ogr_bilgi 
AS SELECT isim, email 
FROM ogrenciler1;
--Varolan bir Table gibi Yeni Bir Table Olusturma (Tamamiyla Diger Table ile Ayni)
CREATE TABLE ogr_tum_bilgi 
AS SELECT * 
FROM ogrenciler1;
--DML – Data Manupulation Language ( Insert-Update-Delete )
--INSERT INTO komutu, Postgre SQL’de tabloya bir veya birden fazla kayit eklemek icin kullanilir.
--Tum Field’lere data eklemek icin
insert into ogrenciler1 values('1234','Erol','0532154624','erol@gmail.com','06-03-2023');
​
--Bazi Field’lere data eklemek icin(Parcali Veri Ekleme)
insert into ogrenciler1 (isim, tel, email) values('Ayse', '0532154625', 'ayse@gmail.com');
​
--a) Yukarida verilen “personel” tablosunu olusturun
--b) Tablodan maasi 5000’den az veya unvani isci olanlarin isimlerini listeleyin
--c) Iscilerin tum bilgilerini listeleyin
--d) Soyadi Can,Cem veya Gul olanlarin unvanlarini ve maaslarini listeleyin
--e) Maasi 5000’den cok olanlarin emailve is baslama tarihlerini listeleyin
--f) Maasi 5000’den cok veya 7000’den az olanlarin tum bilgilerini listeleyin
​
-------------------------------------------------------------------------------------
-- 17 March 2023
--------------------------------------------------------------------------------

CREATE TABLE companies
(
  company_id SMALLINT,
  company VARCHAR(20),
  number_of_employees SMALLINT
);
INSERT INTO companies VALUES(100, 'IBM', 12000);
INSERT INTO companies VALUES(101, 'GOOGLE', 18000);
INSERT INTO companies VALUES(102, 'MICROSOFT', 10000);
INSERT INTO companies VALUES(103, 'APPLE', 21000);
SELECT * FROM companies;
--1.Example: Find the company and number_of_employees
--whose number_of_employees is the second highest
--1. WAY
SELECT company, number_of_employees FROM companies
WHERE number_of_employees <
				
							
--2. WAY
SELECT company, number_of_employees FROM companies
ORDER BY company, number_of_employees DESC
OFFSET 1 LIMIT 1;


--2.Example: Find the company names and number of employees whose number of employees
--is less than the average number of employees
SELECT company, number_of_employees FROM companies
WHERE number_of_employees < (SELECT AVG(number_of_employees) FROM companies);

SELECT * FROM companies
--3.Example: Update the number of employees of the IBM to 9999
UPDATE companies
SET number_of_employees=9999
WHERE company='IBM';

--4.Example: Update the number of employees to 16000 if the number of employees
--is less than the average number of employees
UPDATE companies
SET number_of_employees= 16000
WHERE number_of_employees < (SELECT AVG(number_of_employees) FROM companies);