-- SCHEMA: salam

-- DROP SCHEMA IF EXISTS salam ;

CREATE SCHEMA IF NOT EXISTS salam
    AUTHORIZATION postgres;
	
-- 	Masuk ke skema "salam"
SET search_path TO salam;

-- Buat tabel "mahasiswas"
CREATE TABLE mahasiswas (
	id SERIAL PRIMARY KEY,
	nim VARCHAR(10) UNIQUE,
	nama VARCHAR(100),
	alamat VARCHAR (200),
	tanggal_lahir DATE,
	CONSTRAINT check_tanggal_lahir CHECK (tanggal_lahir <= CURRENT_DATE)
)
	
-- Tambahkan data dummy
INSERT INTO mahasiswas (nim, nama, alamat,tanggal_lahir)
VALUES 
	('1234567890', 'Andi Susanto', 'Jl. Mawar No. 123, Jakarta', '1999-07-10'),
    ('0987654321', 'Budi Santoso', 'Jl. Melati No. 456, Bandung', '2000-05-15'),
    ('1122334455', 'Citra Wijaya', 'Jl. Anggrek No. 789, Surabaya', '1999-12-20'),
    ('5555555555', 'Dewi Permata', 'Jl. Kenanga No. 101, Medan', '2001-02-28'),
    ('7777777777', 'Eko Prasetyo', 'Jl. Dahlia No. 555, Semarang', '2000-11-05');
   
--  menampilkan data dalam tabel mahasiswas
SELECT * FROM mahasiswas m ;
    


-- PENGUJIAN CHECK CONSTRAINT
-- menguji check constraint: kesalahan tanggal lahir yang tidak boleh melebihi tanggal hari ini
INSERT INTO mahasiswas (nim, nama, alamat, tanggal_lahir)
VALUES 
	('1217050017', 'Ansyarullah', 'Komplek Vijaya Kusuma Blok 6A No. 26', '2023-11-23');
-- akan eror karena setelah di check, tanggal lahirnya melebihi hari ini	

-- menguji nim sebagai unique constraint yang tidak boleh sama
INSERT INTO mahasiswas (nim, nama, alamat, tanggal_lahir)
VALUES 
	('1234567890', 'Ansyarullah', 'Komplek Vijaya Kusuma Blok 6A No. 26', '2003-11-23');
--	akan eror karena nim tersebut sudah ada sebelumnya