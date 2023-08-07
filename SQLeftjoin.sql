CREATE TABLE users (
    id INT PRIMARY KEY,
    email VARCHAR(100),
    name VARCHAR(100),
    password VARCHAR(255),
    address VARCHAR(200),
    role VARCHAR(50),
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE products (
    id INT PRIMARY KEY,
    category_id INT,
    user_id INT,
    code VARCHAR(50),
    name VARCHAR(100),
    slug VARCHAR(100),
    description TEXT,
    photo VARCHAR(200),
    qty INT,
    unit VARCHAR(50),
    price DECIMAL(10, 2),
    status VARCHAR(20)
);

CREATE TABLE categories (
    id INT PRIMARY KEY,
    user_id INT,
    code VARCHAR(50),
    name VARCHAR(100),
    slug VARCHAR(100),
    description TEXT,
    status VARCHAR(20),
    photo VARCHAR(200)
);

SELECT 
    p.id AS product_id,
    p.name AS product_name,
    p.description AS product_description,
    p.price AS product_price,
    c.name AS category_name,
    u.name AS user_name
FROM products p
LEFT JOIN categories c ON p.category_id = c.id
LEFT JOIN users u ON p.user_id = u.id;