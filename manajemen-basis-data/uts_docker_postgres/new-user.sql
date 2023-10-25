-- membuat user backend_dev dengan role CRUD semua table
CREATE USER backend_dev WITH PASSWORD 'back25end03';
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA salam TO backend_dev;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA salam TO backend_dev;


-- membuat user bi_dev dengan role read/select semua table/view 
CREATE USER bi_dev WITH PASSWORD 'bi25dev03';
GRANT CONNECT ON DATABASE postgres TO bi_dev;
GRANT USAGE ON SCHEMA salam TO bi_dev;
GRANT SELECT ON ALL TABLES IN SCHEMA salam TO bi_dev;
GRANT SELECT ON ALL SEQUENCEs IN SCHEMA salam TO bi_dev;