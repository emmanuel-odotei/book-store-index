SELECT * FROM customers
LIMIT 10;

SELECT * FROM orders
LIMIT 10;

SELECT * FROM books
LIMIT 10;

SELECT * FROM pg_indexes
WHERE tablename = 'customers';

SELECT * FROM pg_indexes
WHERE tablename = 'books';

SELECT * FROM pg_indexes
WHERE tablename = 'orders';

CREATE INDEX customer_id_index ON orders(customer_id);
CREATE INDEX book_id_index ON orders(book_id);

EXPLAIN ANALYZE SELECT original_language, title, sales_in_millions
FROM books
WHERE original_language = 'French';

SELECT pg_size_pretty (pg_total_relation_size('books'));

CREATE INDEX original_language_title_sales_index ON books(original_language, title, sales_in_millions);

EXPLAIN ANALYZE SELECT original_language, title, sales_in_millions
FROM books
WHERE original_language = 'French';

SELECT pg_size_pretty (pg_total_relation_size('books'));


DROP INDEX IF EXISTS original_language_title_sales_index;


DROP INDEX IF EXISTS customer_id_index;
DROP INDEX IF EXISTS book_id_index;

SELECT NOW();
 
\COPY orders FROM 'orders_add.txt' DELIMITER ',' CSV HEADER;
 
SELECT NOW();

CREATE INDEX customer_id_index ON orders(customer_id);
CREATE INDEX book_id_index ON orders(book_id);

CREATE INDEX firstname_email_index ON customers(first_name, email_address);